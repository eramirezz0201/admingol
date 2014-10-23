// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.Accion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Accion_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Accion.entityManager;
    
    public static final List<String> Accion.fieldNames4OrderClauseFilter = java.util.Arrays.asList("nombreAccion", "descripcion", "activo", "usuario", "fechaCreacion", "fechaModificacion");
    
    public static final EntityManager Accion.entityManager() {
        EntityManager em = new Accion().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Accion.countAccions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Accion o", Long.class).getSingleResult();
    }
    
    public static List<Accion> Accion.findAllAccions() {
        return entityManager().createQuery("SELECT o FROM Accion o", Accion.class).getResultList();
    }
    
    public static List<Accion> Accion.findAllAccions(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Accion o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Accion.class).getResultList();
    }
    
    public static Accion Accion.findAccion(Long id) {
        if (id == null) return null;
        return entityManager().find(Accion.class, id);
    }
    
    public static List<Accion> Accion.findAccionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Accion o", Accion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Accion> Accion.findAccionEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Accion o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Accion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Accion.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Accion.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Accion attached = Accion.findAccion(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Accion.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Accion.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Accion Accion.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Accion merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
