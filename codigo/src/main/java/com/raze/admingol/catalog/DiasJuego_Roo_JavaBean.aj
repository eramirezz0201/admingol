// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.DiasJuego;
import com.raze.admingol.domain.Usuario;
import java.util.Date;

privileged aspect DiasJuego_Roo_JavaBean {
    
    public String DiasJuego.getNombreDiasJuego() {
        return this.nombreDiasJuego;
    }
    
    public void DiasJuego.setNombreDiasJuego(String nombreDiasJuego) {
        this.nombreDiasJuego = nombreDiasJuego;
    }
    
    public String DiasJuego.getDescripcion() {
        return this.descripcion;
    }
    
    public void DiasJuego.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Boolean DiasJuego.getActivo() {
        return this.activo;
    }
    
    public void DiasJuego.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    public Usuario DiasJuego.getUsuario() {
        return this.usuario;
    }
    
    public void DiasJuego.setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Date DiasJuego.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void DiasJuego.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date DiasJuego.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void DiasJuego.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
}