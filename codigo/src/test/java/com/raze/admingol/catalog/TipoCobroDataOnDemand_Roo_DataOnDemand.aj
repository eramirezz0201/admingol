// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.TipoCobro;
import com.raze.admingol.catalog.TipoCobroDataOnDemand;
import com.raze.admingol.domain.UsuarioDataOnDemand;
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
import org.springframework.stereotype.Component;

privileged aspect TipoCobroDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TipoCobroDataOnDemand: @Component;
    
    private Random TipoCobroDataOnDemand.rnd = new SecureRandom();
    
    private List<TipoCobro> TipoCobroDataOnDemand.data;
    
    @Autowired
    UsuarioDataOnDemand TipoCobroDataOnDemand.usuarioDataOnDemand;
    
    public TipoCobro TipoCobroDataOnDemand.getNewTransientTipoCobro(int index) {
        TipoCobro obj = new TipoCobro();
        setActivo(obj, index);
        setDescripcion(obj, index);
        setFechaCreacion(obj, index);
        setFechaModificacion(obj, index);
        setNombreTipoCobro(obj, index);
        return obj;
    }
    
    public void TipoCobroDataOnDemand.setActivo(TipoCobro obj, int index) {
        Boolean activo = Boolean.TRUE;
        obj.setActivo(activo);
    }
    
    public void TipoCobroDataOnDemand.setDescripcion(TipoCobro obj, int index) {
        String descripcion = "descripcion_" + index;
        obj.setDescripcion(descripcion);
    }
    
    public void TipoCobroDataOnDemand.setFechaCreacion(TipoCobro obj, int index) {
        Date fechaCreacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaCreacion(fechaCreacion);
    }
    
    public void TipoCobroDataOnDemand.setFechaModificacion(TipoCobro obj, int index) {
        Date fechaModificacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaModificacion(fechaModificacion);
    }
    
    public void TipoCobroDataOnDemand.setNombreTipoCobro(TipoCobro obj, int index) {
        String nombreTipoCobro = "nombreTipoCobro_" + index;
        obj.setNombreTipoCobro(nombreTipoCobro);
    }
    
    public TipoCobro TipoCobroDataOnDemand.getSpecificTipoCobro(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TipoCobro obj = data.get(index);
        Long id = obj.getId();
        return TipoCobro.findTipoCobro(id);
    }
    
    public TipoCobro TipoCobroDataOnDemand.getRandomTipoCobro() {
        init();
        TipoCobro obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return TipoCobro.findTipoCobro(id);
    }
    
    public boolean TipoCobroDataOnDemand.modifyTipoCobro(TipoCobro obj) {
        return false;
    }
    
    public void TipoCobroDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = TipoCobro.findTipoCobroEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TipoCobro' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TipoCobro>();
        for (int i = 0; i < 10; i++) {
            TipoCobro obj = getNewTransientTipoCobro(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
