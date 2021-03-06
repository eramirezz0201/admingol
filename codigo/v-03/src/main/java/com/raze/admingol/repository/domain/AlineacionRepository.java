package com.raze.admingol.repository.domain;
import com.raze.admingol.domain.Alineacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface AlineacionRepository extends JpaSpecificationExecutor<Alineacion>, JpaRepository<Alineacion, Long> {
}
