// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.TipoPartido;
import com.raze.admingol.domain.Usuario;
import java.util.Date;

privileged aspect TipoPartido_Roo_JavaBean {
    
    public String TipoPartido.getNombreTipoPartido() {
        return this.nombreTipoPartido;
    }
    
    public void TipoPartido.setNombreTipoPartido(String nombreTipoPartido) {
        this.nombreTipoPartido = nombreTipoPartido;
    }
    
    public String TipoPartido.getDescripcion() {
        return this.descripcion;
    }
    
    public void TipoPartido.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Boolean TipoPartido.getActivo() {
        return this.activo;
    }
    
    public void TipoPartido.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    public Usuario TipoPartido.getUsuario() {
        return this.usuario;
    }
    
    public void TipoPartido.setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Date TipoPartido.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void TipoPartido.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date TipoPartido.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void TipoPartido.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
}
