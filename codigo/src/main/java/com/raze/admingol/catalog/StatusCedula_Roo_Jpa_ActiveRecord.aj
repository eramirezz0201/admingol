// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.StatusCedula;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StatusCedula_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager StatusCedula.entityManager;
    
    public static final List<String> StatusCedula.fieldNames4OrderClauseFilter = java.util.Arrays.asList("nombreStatusCedula", "descripcion", "activo", "usuario", "fechaCreacion", "fechaModificacion");
    
    public static final EntityManager StatusCedula.entityManager() {
        EntityManager em = new StatusCedula().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long StatusCedula.countStatusCedulas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM StatusCedula o", Long.class).getSingleResult();
    }
    
    public static List<StatusCedula> StatusCedula.findAllStatusCedulas() {
        return entityManager().createQuery("SELECT o FROM StatusCedula o", StatusCedula.class).getResultList();
    }
    
    public static List<StatusCedula> StatusCedula.findAllStatusCedulas(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StatusCedula o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StatusCedula.class).getResultList();
    }
    
    public static StatusCedula StatusCedula.findStatusCedula(Long id) {
        if (id == null) return null;
        return entityManager().find(StatusCedula.class, id);
    }
    
    public static List<StatusCedula> StatusCedula.findStatusCedulaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM StatusCedula o", StatusCedula.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<StatusCedula> StatusCedula.findStatusCedulaEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StatusCedula o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StatusCedula.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void StatusCedula.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void StatusCedula.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            StatusCedula attached = StatusCedula.findStatusCedula(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void StatusCedula.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void StatusCedula.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public StatusCedula StatusCedula.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StatusCedula merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
