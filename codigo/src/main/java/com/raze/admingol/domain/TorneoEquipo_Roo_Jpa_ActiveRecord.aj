// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.TorneoEquipo;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TorneoEquipo_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TorneoEquipo.entityManager;
    
    public static final List<String> TorneoEquipo.fieldNames4OrderClauseFilter = java.util.Arrays.asList("torneo", "equipo", "activo", "usuario", "fechaCreacion", "fechaModificacion");
    
    public static final EntityManager TorneoEquipo.entityManager() {
        EntityManager em = new TorneoEquipo().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TorneoEquipo.countTorneoEquipoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TorneoEquipo o", Long.class).getSingleResult();
    }
    
    public static List<TorneoEquipo> TorneoEquipo.findAllTorneoEquipoes() {
        return entityManager().createQuery("SELECT o FROM TorneoEquipo o", TorneoEquipo.class).getResultList();
    }
    
    public static List<TorneoEquipo> TorneoEquipo.findAllTorneoEquipoes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM TorneoEquipo o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, TorneoEquipo.class).getResultList();
    }
    
    public static TorneoEquipo TorneoEquipo.findTorneoEquipo(Long id) {
        if (id == null) return null;
        return entityManager().find(TorneoEquipo.class, id);
    }
    
    public static List<TorneoEquipo> TorneoEquipo.findTorneoEquipoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TorneoEquipo o", TorneoEquipo.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<TorneoEquipo> TorneoEquipo.findTorneoEquipoEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM TorneoEquipo o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, TorneoEquipo.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TorneoEquipo.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TorneoEquipo.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TorneoEquipo attached = TorneoEquipo.findTorneoEquipo(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TorneoEquipo.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TorneoEquipo.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TorneoEquipo TorneoEquipo.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TorneoEquipo merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
