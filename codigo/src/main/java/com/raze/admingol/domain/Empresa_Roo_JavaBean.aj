// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.Empresa;
import com.raze.admingol.domain.Usuario;
import java.util.Date;

privileged aspect Empresa_Roo_JavaBean {
    
    public String Empresa.getNombre() {
        return this.nombre;
    }
    
    public void Empresa.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Empresa.getNombreComercial() {
        return this.nombreComercial;
    }
    
    public void Empresa.setNombreComercial(String nombreComercial) {
        this.nombreComercial = nombreComercial;
    }
    
    public String Empresa.getDomicilio() {
        return this.domicilio;
    }
    
    public void Empresa.setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }
    
    public String Empresa.getTelefono() {
        return this.telefono;
    }
    
    public void Empresa.setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public String Empresa.getCorreoE() {
        return this.correoE;
    }
    
    public void Empresa.setCorreoE(String correoE) {
        this.correoE = correoE;
    }
    
    public byte[] Empresa.getLogo() {
        return this.logo;
    }
    
    public void Empresa.setLogo(byte[] logo) {
        this.logo = logo;
    }
    
    public Boolean Empresa.getActivo() {
        return this.activo;
    }
    
    public void Empresa.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    public Usuario Empresa.getUsuario() {
        return this.usuario;
    }
    
    public void Empresa.setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Date Empresa.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void Empresa.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date Empresa.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void Empresa.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
}
