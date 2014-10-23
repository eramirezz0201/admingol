// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.StatusPartido;
import com.raze.admingol.controller.PartidoController;
import com.raze.admingol.domain.Cancha;
import com.raze.admingol.domain.Equipo;
import com.raze.admingol.domain.Partido;
import com.raze.admingol.domain.Torneo;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PartidoController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByCancha", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCanchaForm(Model uiModel) {
        uiModel.addAttribute("canchas", Cancha.findAllCanchas());
        return "partidoes/findPartidoesByCancha";
    }
    
    @RequestMapping(params = "find=ByCancha", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCancha(@RequestParam("cancha") Cancha cancha, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCancha(cancha, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByCancha(cancha) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCancha(cancha, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByCanchaAndStatus", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCanchaAndStatusForm(Model uiModel) {
        uiModel.addAttribute("canchas", Cancha.findAllCanchas());
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        return "partidoes/findPartidoesByCanchaAndStatus";
    }
    
    @RequestMapping(params = "find=ByCanchaAndStatus", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCanchaAndStatus(@RequestParam("cancha") Cancha cancha, @RequestParam("status") StatusPartido status, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCanchaAndStatus(cancha, status, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByCanchaAndStatus(cancha, status) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCanchaAndStatus(cancha, status, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByCanchaAndStatusAndFechaJuegoBetween", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCanchaAndStatusAndFechaJuegoBetweenForm(Model uiModel) {
        uiModel.addAttribute("canchas", Cancha.findAllCanchas());
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/findPartidoesByCanchaAndStatusAndFechaJuegoBetween";
    }
    
    @RequestMapping(params = "find=ByCanchaAndStatusAndFechaJuegoBetween", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCanchaAndStatusAndFechaJuegoBetween(@RequestParam("cancha") Cancha cancha, @RequestParam("status") StatusPartido status, @RequestParam("minFechaJuego") @DateTimeFormat(style = "M-") Date minFechaJuego, @RequestParam("maxFechaJuego") @DateTimeFormat(style = "M-") Date maxFechaJuego, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCanchaAndStatusAndFechaJuegoBetween(cancha, status, minFechaJuego, maxFechaJuego, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByCanchaAndStatusAndFechaJuegoBetween(cancha, status, minFechaJuego, maxFechaJuego) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCanchaAndStatusAndFechaJuegoBetween(cancha, status, minFechaJuego, maxFechaJuego, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByCanchaAndStatusAndFechaJuegoEquals", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCanchaAndStatusAndFechaJuegoEqualsForm(Model uiModel) {
        uiModel.addAttribute("canchas", Cancha.findAllCanchas());
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/findPartidoesByCanchaAndStatusAndFechaJuegoEquals";
    }
    
    @RequestMapping(params = "find=ByCanchaAndStatusAndFechaJuegoEquals", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByCanchaAndStatusAndFechaJuegoEquals(@RequestParam("cancha") Cancha cancha, @RequestParam("status") StatusPartido status, @RequestParam("fechaJuego") @DateTimeFormat(style = "M-") Date fechaJuego, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCanchaAndStatusAndFechaJuegoEquals(cancha, status, fechaJuego, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByCanchaAndStatusAndFechaJuegoEquals(cancha, status, fechaJuego) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByCanchaAndStatusAndFechaJuegoEquals(cancha, status, fechaJuego, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByFechaJuegoBetweenAndStatus", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByFechaJuegoBetweenAndStatusForm(Model uiModel) {
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/findPartidoesByFechaJuegoBetweenAndStatus";
    }
    
    @RequestMapping(params = "find=ByFechaJuegoBetweenAndStatus", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByFechaJuegoBetweenAndStatus(@RequestParam("minFechaJuego") @DateTimeFormat(style = "M-") Date minFechaJuego, @RequestParam("maxFechaJuego") @DateTimeFormat(style = "M-") Date maxFechaJuego, @RequestParam("status") StatusPartido status, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByFechaJuegoBetweenAndStatus(minFechaJuego, maxFechaJuego, status, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByFechaJuegoBetweenAndStatus(minFechaJuego, maxFechaJuego, status) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByFechaJuegoBetweenAndStatus(minFechaJuego, maxFechaJuego, status, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByFechaJuegoEqualsAndStatus", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByFechaJuegoEqualsAndStatusForm(Model uiModel) {
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/findPartidoesByFechaJuegoEqualsAndStatus";
    }
    
    @RequestMapping(params = "find=ByFechaJuegoEqualsAndStatus", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByFechaJuegoEqualsAndStatus(@RequestParam("fechaJuego") @DateTimeFormat(style = "M-") Date fechaJuego, @RequestParam("status") StatusPartido status, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByFechaJuegoEqualsAndStatus(fechaJuego, status, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByFechaJuegoEqualsAndStatus(fechaJuego, status) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByFechaJuegoEqualsAndStatus(fechaJuego, status, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteForm(Model uiModel) {
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        return "partidoes/findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante";
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatusForm(Model uiModel) {
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        return "partidoes/findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus";
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante, @RequestParam("status") StatusPartido status, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByTorneoEquipoLocalOrTorneoEquipoVisitante", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteForm(Model uiModel) {
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        return "partidoes/findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitante";
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitante", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitante(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteForm(Model uiModel) {
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        return "partidoes/findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante";
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatusForm(Model uiModel) {
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        return "partidoes/findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus";
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante, @RequestParam("status") StatusPartido status, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
    @RequestMapping(params = { "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus", "form" }, method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatusForm(Model uiModel) {
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("statuspartidoes", StatusPartido.findAllStatusPartidoes());
        return "partidoes/findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus";
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus", method = RequestMethod.GET)
    public String PartidoController.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("status") StatusPartido status, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, status, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Partido.countFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, status) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("partidoes", Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, status, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "partidoes/list";
    }
    
}
