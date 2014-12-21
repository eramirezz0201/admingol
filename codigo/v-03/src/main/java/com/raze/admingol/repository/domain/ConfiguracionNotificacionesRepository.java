package com.raze.admingol.repository.domain;
import com.raze.admingol.domain.ConfiguracionNotificaciones;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@RooJpaRepository(domainType = ConfiguracionNotificaciones.class)
public interface ConfiguracionNotificacionesRepository extends JpaSpecificationExecutor<ConfiguracionNotificaciones>, JpaRepository<ConfiguracionNotificaciones, Long> {
}