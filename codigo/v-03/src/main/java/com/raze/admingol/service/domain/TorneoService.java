package com.raze.admingol.service.domain;
import com.raze.admingol.domain.Torneo;
import java.util.List;

public interface TorneoService {

	public abstract long countAllTorneos();


	public abstract void deleteTorneo(Torneo torneo);


	public abstract Torneo findTorneo(Long id);


	public abstract List<Torneo> findAllTorneos();


	public abstract List<Torneo> findTorneoEntries(int firstResult, int maxResults);


	public abstract void saveTorneo(Torneo torneo);


	public abstract Torneo updateTorneo(Torneo torneo);

}
