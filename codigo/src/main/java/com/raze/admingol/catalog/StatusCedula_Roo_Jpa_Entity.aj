// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.StatusCedula;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect StatusCedula_Roo_Jpa_Entity {
    
    declare @type: StatusCedula: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long StatusCedula.id;
    
    @Version
    @Column(name = "version")
    private Integer StatusCedula.version;
    
    public Long StatusCedula.getId() {
        return this.id;
    }
    
    public void StatusCedula.setId(Long id) {
        this.id = id;
    }
    
    public Integer StatusCedula.getVersion() {
        return this.version;
    }
    
    public void StatusCedula.setVersion(Integer version) {
        this.version = version;
    }
    
}
