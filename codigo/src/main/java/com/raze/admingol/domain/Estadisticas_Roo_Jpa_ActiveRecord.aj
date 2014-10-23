// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.Estadisticas;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Estadisticas_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Estadisticas.entityManager;
    
    public static final List<String> Estadisticas.fieldNames4OrderClauseFilter = java.util.Arrays.asList("alineacion", "accion", "minuto", "usuario", "fechaCreacion", "fechaModificacion");
    
    public static final EntityManager Estadisticas.entityManager() {
        EntityManager em = new Estadisticas().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Estadisticas.countEstadisticases() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Estadisticas o", Long.class).getSingleResult();
    }
    
    public static List<Estadisticas> Estadisticas.findAllEstadisticases() {
        return entityManager().createQuery("SELECT o FROM Estadisticas o", Estadisticas.class).getResultList();
    }
    
    public static List<Estadisticas> Estadisticas.findAllEstadisticases(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Estadisticas o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Estadisticas.class).getResultList();
    }
    
    public static Estadisticas Estadisticas.findEstadisticas(Long id) {
        if (id == null) return null;
        return entityManager().find(Estadisticas.class, id);
    }
    
    public static List<Estadisticas> Estadisticas.findEstadisticasEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Estadisticas o", Estadisticas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Estadisticas> Estadisticas.findEstadisticasEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Estadisticas o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Estadisticas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Estadisticas.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Estadisticas.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Estadisticas attached = Estadisticas.findEstadisticas(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Estadisticas.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Estadisticas.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Estadisticas Estadisticas.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Estadisticas merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}