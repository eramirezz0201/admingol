package com.raze.admingol.domain;
import com.raze.admingol.catalog.Posicion;
import com.raze.admingol.catalog.StatusEquipoJugador;
import com.raze.admingol.repository.domain.JugadorRepository;
import com.raze.admingol.service.domain.JugadorService;
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

@Configurable
@Component
public class JugadorDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<Jugador> data;

	@Autowired
    EquipoDataOnDemand equipoDataOnDemand;

	@Autowired
    UsuarioDataOnDemand usuarioDataOnDemand;

	@Autowired
    JugadorService jugadorService;

	@Autowired
    JugadorRepository jugadorRepository;

	public Jugador getNewTransientJugador(int index) {
        Jugador obj = new Jugador();
        setActivo(obj, index);
        setApellidoMaterno(obj, index);
        setApellidoPaterno(obj, index);
        setCorreoE(obj, index);
        setDomicilio(obj, index);
        setEquipo(obj, index);
        setEsDelegado(obj, index);
        setFechaCreacion(obj, index);
        setFechaModificacion(obj, index);
        setFechaNacimiento(obj, index);
        setFoto(obj, index);
        setNombre(obj, index);
        setPosicion(obj, index);
        setStatus(obj, index);
        setTelefono(obj, index);
        return obj;
    }

	public void setActivo(Jugador obj, int index) {
        Boolean activo = Boolean.TRUE;
        obj.setActivo(activo);
    }

	public void setApellidoMaterno(Jugador obj, int index) {
        String apellidoMaterno = "apellidoMaterno_" + index;
        obj.setApellidoMaterno(apellidoMaterno);
    }

	public void setApellidoPaterno(Jugador obj, int index) {
        String apellidoPaterno = "apellidoPaterno_" + index;
        obj.setApellidoPaterno(apellidoPaterno);
    }

	public void setCorreoE(Jugador obj, int index) {
        String correoE = "correoE_" + index;
        obj.setCorreoE(correoE);
    }

	public void setDomicilio(Jugador obj, int index) {
        String domicilio = "domicilio_" + index;
        obj.setDomicilio(domicilio);
    }

	public void setEquipo(Jugador obj, int index) {
        Equipo equipo = equipoDataOnDemand.getRandomEquipo();
        obj.setEquipo(equipo);
    }

	public void setEsDelegado(Jugador obj, int index) {
        Boolean esDelegado = Boolean.TRUE;
        obj.setEsDelegado(esDelegado);
    }

	public void setFechaCreacion(Jugador obj, int index) {
        Date fechaCreacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaCreacion(fechaCreacion);
    }

	public void setFechaModificacion(Jugador obj, int index) {
        Date fechaModificacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaModificacion(fechaModificacion);
    }

	public void setFechaNacimiento(Jugador obj, int index) {
        Date fechaNacimiento = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaNacimiento(fechaNacimiento);
    }

	public void setFoto(Jugador obj, int index) {
        byte[] foto = String.valueOf(index).getBytes();
        obj.setFoto(foto);
    }

	public void setNombre(Jugador obj, int index) {
        String nombre = "nombre_" + index;
        obj.setNombre(nombre);
    }

	public void setPosicion(Jugador obj, int index) {
        Posicion posicion = Posicion.class.getEnumConstants()[0];
        obj.setPosicion(posicion);
    }

	public void setStatus(Jugador obj, int index) {
        StatusEquipoJugador status = StatusEquipoJugador.class.getEnumConstants()[0];
        obj.setStatus(status);
    }

	public void setTelefono(Jugador obj, int index) {
        String telefono = "telefono_" + index;
        obj.setTelefono(telefono);
    }

	public Jugador getSpecificJugador(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Jugador obj = data.get(index);
        Long id = obj.getId();
        return jugadorService.findJugador(id);
    }

	public Jugador getRandomJugador() {
        init();
        Jugador obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return jugadorService.findJugador(id);
    }

	public boolean modifyJugador(Jugador obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = jugadorService.findJugadorEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Jugador' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Jugador>();
        for (int i = 0; i < 10; i++) {
            Jugador obj = getNewTransientJugador(i);
            try {
                jugadorService.saveJugador(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            jugadorRepository.flush();
            data.add(obj);
        }
    }
}
