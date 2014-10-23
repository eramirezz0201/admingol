// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.catalog.StatusCedula;
import com.raze.admingol.domain.CedulaPartido;
import com.raze.admingol.domain.Partido;
import com.raze.admingol.domain.Usuario;
import java.util.Date;

privileged aspect CedulaPartido_Roo_JavaBean {
    
    public Partido CedulaPartido.getPartido() {
        return this.partido;
    }
    
    public void CedulaPartido.setPartido(Partido partido) {
        this.partido = partido;
    }
    
    public int CedulaPartido.getMarcadorEquipoLocal() {
        return this.marcadorEquipoLocal;
    }
    
    public void CedulaPartido.setMarcadorEquipoLocal(int marcadorEquipoLocal) {
        this.marcadorEquipoLocal = marcadorEquipoLocal;
    }
    
    public int CedulaPartido.getMarcadorEquipoVisitante() {
        return this.marcadorEquipoVisitante;
    }
    
    public void CedulaPartido.setMarcadorEquipoVisitante(int marcadorEquipoVisitante) {
        this.marcadorEquipoVisitante = marcadorEquipoVisitante;
    }
    
    public String CedulaPartido.getObservaciones() {
        return this.observaciones;
    }
    
    public void CedulaPartido.setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
    public StatusCedula CedulaPartido.getStatus() {
        return this.status;
    }
    
    public void CedulaPartido.setStatus(StatusCedula status) {
        this.status = status;
    }
    
    public Usuario CedulaPartido.getUsuario() {
        return this.usuario;
    }
    
    public void CedulaPartido.setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Date CedulaPartido.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void CedulaPartido.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date CedulaPartido.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void CedulaPartido.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
}
