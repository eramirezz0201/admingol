// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.TipoCobro;
import com.raze.admingol.controller.ConfiguracionTorneoController;
import com.raze.admingol.domain.ConfiguracionTorneo;
import com.raze.admingol.domain.Torneo;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ConfiguracionTorneoController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByInscripcionAndActivo", "form" }, method = RequestMethod.GET)
    public String ConfiguracionTorneoController.findConfiguracionTorneosByInscripcionAndActivoForm(Model uiModel) {
        return "configuraciontorneos/findConfiguracionTorneosByInscripcionAndActivo";
    }
    
    @RequestMapping(params = "find=ByInscripcionAndActivo", method = RequestMethod.GET)
    public String ConfiguracionTorneoController.findConfiguracionTorneosByInscripcionAndActivo(@RequestParam(value = "inscripcion", required = false) Boolean inscripcion, @RequestParam(value = "activo", required = false) Boolean activo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findConfiguracionTorneosByInscripcionAndActivo(inscripcion == null ? Boolean.FALSE : inscripcion, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ConfiguracionTorneo.countFindConfiguracionTorneosByInscripcionAndActivo(inscripcion == null ? Boolean.FALSE : inscripcion, activo == null ? Boolean.FALSE : activo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findConfiguracionTorneosByInscripcionAndActivo(inscripcion == null ? Boolean.FALSE : inscripcion, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "configuraciontorneos/list";
    }
    
    @RequestMapping(params = { "find=ByTipoCobroAndActivo", "form" }, method = RequestMethod.GET)
    public String ConfiguracionTorneoController.findConfiguracionTorneosByTipoCobroAndActivoForm(Model uiModel) {
        uiModel.addAttribute("tipocobroes", TipoCobro.findAllTipoCobroes());
        return "configuraciontorneos/findConfiguracionTorneosByTipoCobroAndActivo";
    }
    
    @RequestMapping(params = "find=ByTipoCobroAndActivo", method = RequestMethod.GET)
    public String ConfiguracionTorneoController.findConfiguracionTorneosByTipoCobroAndActivo(@RequestParam("tipoCobro") TipoCobro tipoCobro, @RequestParam(value = "activo", required = false) Boolean activo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findConfiguracionTorneosByTipoCobroAndActivo(tipoCobro, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ConfiguracionTorneo.countFindConfiguracionTorneosByTipoCobroAndActivo(tipoCobro, activo == null ? Boolean.FALSE : activo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findConfiguracionTorneosByTipoCobroAndActivo(tipoCobro, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "configuraciontorneos/list";
    }
    
    @RequestMapping(params = { "find=ByTorneoAndActivo", "form" }, method = RequestMethod.GET)
    public String ConfiguracionTorneoController.findConfiguracionTorneosByTorneoAndActivoForm(Model uiModel) {
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        return "configuraciontorneos/findConfiguracionTorneosByTorneoAndActivo";
    }
    
    @RequestMapping(params = "find=ByTorneoAndActivo", method = RequestMethod.GET)
    public String ConfiguracionTorneoController.findConfiguracionTorneosByTorneoAndActivo(@RequestParam("torneo") Torneo torneo, @RequestParam(value = "activo", required = false) Boolean activo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findConfiguracionTorneosByTorneoAndActivo(torneo, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ConfiguracionTorneo.countFindConfiguracionTorneosByTorneoAndActivo(torneo, activo == null ? Boolean.FALSE : activo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findConfiguracionTorneosByTorneoAndActivo(torneo, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "configuraciontorneos/list";
    }
    
}