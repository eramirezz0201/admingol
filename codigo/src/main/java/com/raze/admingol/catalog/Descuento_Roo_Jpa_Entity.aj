// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.Descuento;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Descuento_Roo_Jpa_Entity {
    
    declare @type: Descuento: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Descuento.id;
    
    @Version
    @Column(name = "version")
    private Integer Descuento.version;
    
    public Long Descuento.getId() {
        return this.id;
    }
    
    public void Descuento.setId(Long id) {
        this.id = id;
    }
    
    public Integer Descuento.getVersion() {
        return this.version;
    }
    
    public void Descuento.setVersion(Integer version) {
        this.version = version;
    }
    
}
