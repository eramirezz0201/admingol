// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.ConceptoCobro;
import com.raze.admingol.domain.Usuario;
import java.util.Date;

privileged aspect ConceptoCobro_Roo_JavaBean {
    
    public String ConceptoCobro.getNombreConceptoCobro() {
        return this.nombreConceptoCobro;
    }
    
    public void ConceptoCobro.setNombreConceptoCobro(String nombreConceptoCobro) {
        this.nombreConceptoCobro = nombreConceptoCobro;
    }
    
    public String ConceptoCobro.getDescripcion() {
        return this.descripcion;
    }
    
    public void ConceptoCobro.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Boolean ConceptoCobro.getActivo() {
        return this.activo;
    }
    
    public void ConceptoCobro.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    public Usuario ConceptoCobro.getUsuario() {
        return this.usuario;
    }
    
    public void ConceptoCobro.setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Date ConceptoCobro.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void ConceptoCobro.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date ConceptoCobro.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void ConceptoCobro.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
}
