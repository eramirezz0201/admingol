package com.raze.admingol.service.domain;
import com.raze.admingol.domain.ControlPagoServicio;
import java.util.List;

public interface ControlPagoServicioService {

	public abstract long countAllControlPagoServicios();


	public abstract void deleteControlPagoServicio(ControlPagoServicio controlPagoServicio);


	public abstract ControlPagoServicio findControlPagoServicio(Long id);


	public abstract List<ControlPagoServicio> findAllControlPagoServicios();


	public abstract List<ControlPagoServicio> findControlPagoServicioEntries(int firstResult, int maxResults);


	public abstract void saveControlPagoServicio(ControlPagoServicio controlPagoServicio);


	public abstract ControlPagoServicio updateControlPagoServicio(ControlPagoServicio controlPagoServicio);

}
