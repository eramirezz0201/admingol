// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.TorneoEquipo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect TorneoEquipo_Roo_Jpa_Entity {
    
    declare @type: TorneoEquipo: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long TorneoEquipo.id;
    
    @Version
    @Column(name = "version")
    private Integer TorneoEquipo.version;
    
    public Long TorneoEquipo.getId() {
        return this.id;
    }
    
    public void TorneoEquipo.setId(Long id) {
        this.id = id;
    }
    
    public Integer TorneoEquipo.getVersion() {
        return this.version;
    }
    
    public void TorneoEquipo.setVersion(Integer version) {
        this.version = version;
    }
    
}
