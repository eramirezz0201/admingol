// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.Alineacion;
import com.raze.admingol.domain.Jugador;
import com.raze.admingol.domain.Partido;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Alineacion_Roo_Finder {
    
    public static Long Alineacion.countFindAlineacionsByJugador(Jugador jugador) {
        if (jugador == null) throw new IllegalArgumentException("The jugador argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Alineacion AS o WHERE o.jugador = :jugador", Long.class);
        q.setParameter("jugador", jugador);
        return ((Long) q.getSingleResult());
    }
    
    public static Long Alineacion.countFindAlineacionsByJugadorAndFechaCreacionBetween(Jugador jugador, Date minFechaCreacion, Date maxFechaCreacion) {
        if (jugador == null) throw new IllegalArgumentException("The jugador argument is required");
        if (minFechaCreacion == null) throw new IllegalArgumentException("The minFechaCreacion argument is required");
        if (maxFechaCreacion == null) throw new IllegalArgumentException("The maxFechaCreacion argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Alineacion AS o WHERE o.jugador = :jugador AND o.fechaCreacion BETWEEN :minFechaCreacion AND :maxFechaCreacion", Long.class);
        q.setParameter("jugador", jugador);
        q.setParameter("minFechaCreacion", minFechaCreacion);
        q.setParameter("maxFechaCreacion", maxFechaCreacion);
        return ((Long) q.getSingleResult());
    }
    
    public static Long Alineacion.countFindAlineacionsByPartido(Partido partido) {
        if (partido == null) throw new IllegalArgumentException("The partido argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Alineacion AS o WHERE o.partido = :partido", Long.class);
        q.setParameter("partido", partido);
        return ((Long) q.getSingleResult());
    }
    
    public static Long Alineacion.countFindAlineacionsByPartidoAndFechaCreacionBetween(Partido partido, Date minFechaCreacion, Date maxFechaCreacion) {
        if (partido == null) throw new IllegalArgumentException("The partido argument is required");
        if (minFechaCreacion == null) throw new IllegalArgumentException("The minFechaCreacion argument is required");
        if (maxFechaCreacion == null) throw new IllegalArgumentException("The maxFechaCreacion argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Alineacion AS o WHERE o.partido = :partido AND o.fechaCreacion BETWEEN :minFechaCreacion AND :maxFechaCreacion", Long.class);
        q.setParameter("partido", partido);
        q.setParameter("minFechaCreacion", minFechaCreacion);
        q.setParameter("maxFechaCreacion", maxFechaCreacion);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByJugador(Jugador jugador) {
        if (jugador == null) throw new IllegalArgumentException("The jugador argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery<Alineacion> q = em.createQuery("SELECT o FROM Alineacion AS o WHERE o.jugador = :jugador", Alineacion.class);
        q.setParameter("jugador", jugador);
        return q;
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByJugador(Jugador jugador, String sortFieldName, String sortOrder) {
        if (jugador == null) throw new IllegalArgumentException("The jugador argument is required");
        EntityManager em = Alineacion.entityManager();
        String jpaQuery = "SELECT o FROM Alineacion AS o WHERE o.jugador = :jugador";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        TypedQuery<Alineacion> q = em.createQuery(jpaQuery, Alineacion.class);
        q.setParameter("jugador", jugador);
        return q;
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByJugadorAndFechaCreacionBetween(Jugador jugador, Date minFechaCreacion, Date maxFechaCreacion) {
        if (jugador == null) throw new IllegalArgumentException("The jugador argument is required");
        if (minFechaCreacion == null) throw new IllegalArgumentException("The minFechaCreacion argument is required");
        if (maxFechaCreacion == null) throw new IllegalArgumentException("The maxFechaCreacion argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery<Alineacion> q = em.createQuery("SELECT o FROM Alineacion AS o WHERE o.jugador = :jugador AND o.fechaCreacion BETWEEN :minFechaCreacion AND :maxFechaCreacion", Alineacion.class);
        q.setParameter("jugador", jugador);
        q.setParameter("minFechaCreacion", minFechaCreacion);
        q.setParameter("maxFechaCreacion", maxFechaCreacion);
        return q;
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByJugadorAndFechaCreacionBetween(Jugador jugador, Date minFechaCreacion, Date maxFechaCreacion, String sortFieldName, String sortOrder) {
        if (jugador == null) throw new IllegalArgumentException("The jugador argument is required");
        if (minFechaCreacion == null) throw new IllegalArgumentException("The minFechaCreacion argument is required");
        if (maxFechaCreacion == null) throw new IllegalArgumentException("The maxFechaCreacion argument is required");
        EntityManager em = Alineacion.entityManager();
        String jpaQuery = "SELECT o FROM Alineacion AS o WHERE o.jugador = :jugador AND o.fechaCreacion BETWEEN :minFechaCreacion AND :maxFechaCreacion";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        TypedQuery<Alineacion> q = em.createQuery(jpaQuery, Alineacion.class);
        q.setParameter("jugador", jugador);
        q.setParameter("minFechaCreacion", minFechaCreacion);
        q.setParameter("maxFechaCreacion", maxFechaCreacion);
        return q;
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByPartido(Partido partido) {
        if (partido == null) throw new IllegalArgumentException("The partido argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery<Alineacion> q = em.createQuery("SELECT o FROM Alineacion AS o WHERE o.partido = :partido", Alineacion.class);
        q.setParameter("partido", partido);
        return q;
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByPartido(Partido partido, String sortFieldName, String sortOrder) {
        if (partido == null) throw new IllegalArgumentException("The partido argument is required");
        EntityManager em = Alineacion.entityManager();
        String jpaQuery = "SELECT o FROM Alineacion AS o WHERE o.partido = :partido";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        TypedQuery<Alineacion> q = em.createQuery(jpaQuery, Alineacion.class);
        q.setParameter("partido", partido);
        return q;
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByPartidoAndFechaCreacionBetween(Partido partido, Date minFechaCreacion, Date maxFechaCreacion) {
        if (partido == null) throw new IllegalArgumentException("The partido argument is required");
        if (minFechaCreacion == null) throw new IllegalArgumentException("The minFechaCreacion argument is required");
        if (maxFechaCreacion == null) throw new IllegalArgumentException("The maxFechaCreacion argument is required");
        EntityManager em = Alineacion.entityManager();
        TypedQuery<Alineacion> q = em.createQuery("SELECT o FROM Alineacion AS o WHERE o.partido = :partido AND o.fechaCreacion BETWEEN :minFechaCreacion AND :maxFechaCreacion", Alineacion.class);
        q.setParameter("partido", partido);
        q.setParameter("minFechaCreacion", minFechaCreacion);
        q.setParameter("maxFechaCreacion", maxFechaCreacion);
        return q;
    }
    
    public static TypedQuery<Alineacion> Alineacion.findAlineacionsByPartidoAndFechaCreacionBetween(Partido partido, Date minFechaCreacion, Date maxFechaCreacion, String sortFieldName, String sortOrder) {
        if (partido == null) throw new IllegalArgumentException("The partido argument is required");
        if (minFechaCreacion == null) throw new IllegalArgumentException("The minFechaCreacion argument is required");
        if (maxFechaCreacion == null) throw new IllegalArgumentException("The maxFechaCreacion argument is required");
        EntityManager em = Alineacion.entityManager();
        String jpaQuery = "SELECT o FROM Alineacion AS o WHERE o.partido = :partido AND o.fechaCreacion BETWEEN :minFechaCreacion AND :maxFechaCreacion";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        TypedQuery<Alineacion> q = em.createQuery(jpaQuery, Alineacion.class);
        q.setParameter("partido", partido);
        q.setParameter("minFechaCreacion", minFechaCreacion);
        q.setParameter("maxFechaCreacion", maxFechaCreacion);
        return q;
    }
    
}
