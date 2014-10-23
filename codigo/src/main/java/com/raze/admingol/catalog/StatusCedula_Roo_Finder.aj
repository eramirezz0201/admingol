// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.StatusCedula;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect StatusCedula_Roo_Finder {
    
    public static Long StatusCedula.countFindStatusCedulasByActivo(Boolean activo) {
        if (activo == null) throw new IllegalArgumentException("The activo argument is required");
        EntityManager em = StatusCedula.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM StatusCedula AS o WHERE o.activo = :activo", Long.class);
        q.setParameter("activo", activo);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<StatusCedula> StatusCedula.findStatusCedulasByActivo(Boolean activo) {
        if (activo == null) throw new IllegalArgumentException("The activo argument is required");
        EntityManager em = StatusCedula.entityManager();
        TypedQuery<StatusCedula> q = em.createQuery("SELECT o FROM StatusCedula AS o WHERE o.activo = :activo", StatusCedula.class);
        q.setParameter("activo", activo);
        return q;
    }
    
    public static TypedQuery<StatusCedula> StatusCedula.findStatusCedulasByActivo(Boolean activo, String sortFieldName, String sortOrder) {
        if (activo == null) throw new IllegalArgumentException("The activo argument is required");
        EntityManager em = StatusCedula.entityManager();
        String jpaQuery = "SELECT o FROM StatusCedula AS o WHERE o.activo = :activo";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        TypedQuery<StatusCedula> q = em.createQuery(jpaQuery, StatusCedula.class);
        q.setParameter("activo", activo);
        return q;
    }
    
}
