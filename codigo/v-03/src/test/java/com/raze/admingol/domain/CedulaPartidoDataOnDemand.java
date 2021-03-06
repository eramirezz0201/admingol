package com.raze.admingol.domain;
import com.raze.admingol.catalog.StatusCedula;
import com.raze.admingol.repository.domain.CedulaPartidoRepository;
import com.raze.admingol.service.domain.CedulaPartidoService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

@Component
@Configurable
public class CedulaPartidoDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<CedulaPartido> data;

	@Autowired
    PartidoDataOnDemand partidoDataOnDemand;

	@Autowired
    UsuarioDataOnDemand usuarioDataOnDemand;

	@Autowired
    CedulaPartidoService cedulaPartidoService;

	@Autowired
    CedulaPartidoRepository cedulaPartidoRepository;

	public CedulaPartido getNewTransientCedulaPartido(int index) {
        CedulaPartido obj = new CedulaPartido();
        setFechaCreacion(obj, index);
        setFechaModificacion(obj, index);
        setHoraInicioReal(obj, index);
        setMarcadorEquipoLocal(obj, index);
        setMarcadorEquipoVisitante(obj, index);
        setObservaciones(obj, index);
        setPartido(obj, index);
        setStatus(obj, index);
        return obj;
    }

	public void setFechaCreacion(CedulaPartido obj, int index) {
        Date fechaCreacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaCreacion(fechaCreacion);
    }

	public void setFechaModificacion(CedulaPartido obj, int index) {
        Date fechaModificacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaModificacion(fechaModificacion);
    }

	public void setHoraInicioReal(CedulaPartido obj, int index) {
        Date horaInicioReal = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setHoraInicioReal(horaInicioReal);
    }

	public void setMarcadorEquipoLocal(CedulaPartido obj, int index) {
        int marcadorEquipoLocal = index;
        obj.setMarcadorEquipoLocal(marcadorEquipoLocal);
    }

	public void setMarcadorEquipoVisitante(CedulaPartido obj, int index) {
        int marcadorEquipoVisitante = index;
        obj.setMarcadorEquipoVisitante(marcadorEquipoVisitante);
    }

	public void setObservaciones(CedulaPartido obj, int index) {
        String observaciones = "observaciones_" + index;
        obj.setObservaciones(observaciones);
    }

	public void setPartido(CedulaPartido obj, int index) {
        Partido partido = partidoDataOnDemand.getRandomPartido();
        obj.setPartido(partido);
    }

	public void setStatus(CedulaPartido obj, int index) {
        StatusCedula status = StatusCedula.class.getEnumConstants()[0];
        obj.setStatus(status);
    }

	public CedulaPartido getSpecificCedulaPartido(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CedulaPartido obj = data.get(index);
        Long id = obj.getId();
        return cedulaPartidoService.findCedulaPartido(id);
    }

	public CedulaPartido getRandomCedulaPartido() {
        init();
        CedulaPartido obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return cedulaPartidoService.findCedulaPartido(id);
    }

	public boolean modifyCedulaPartido(CedulaPartido obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = cedulaPartidoService.findCedulaPartidoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CedulaPartido' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CedulaPartido>();
        for (int i = 0; i < 10; i++) {
            CedulaPartido obj = getNewTransientCedulaPartido(i);
            try {
                cedulaPartidoService.saveCedulaPartido(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            cedulaPartidoRepository.flush();
            data.add(obj);
        }
    }
}
