// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.controller.CanchaController;
import com.raze.admingol.domain.Cancha;
import com.raze.admingol.domain.Sucursal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CanchaController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByActivo", "form" }, method = RequestMethod.GET)
    public String CanchaController.findCanchasByActivoForm(Model uiModel) {
        return "canchas/findCanchasByActivo";
    }
    
    @RequestMapping(params = "find=ByActivo", method = RequestMethod.GET)
    public String CanchaController.findCanchasByActivo(@RequestParam(value = "activo", required = false) Boolean activo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("canchas", Cancha.findCanchasByActivo(activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Cancha.countFindCanchasByActivo(activo == null ? Boolean.FALSE : activo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("canchas", Cancha.findCanchasByActivo(activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "canchas/list";
    }
    
    @RequestMapping(params = { "find=BySucursalAndActivo", "form" }, method = RequestMethod.GET)
    public String CanchaController.findCanchasBySucursalAndActivoForm(Model uiModel) {
        uiModel.addAttribute("sucursals", Sucursal.findAllSucursals());
        return "canchas/findCanchasBySucursalAndActivo";
    }
    
    @RequestMapping(params = "find=BySucursalAndActivo", method = RequestMethod.GET)
    public String CanchaController.findCanchasBySucursalAndActivo(@RequestParam("sucursal") Sucursal sucursal, @RequestParam(value = "activo", required = false) Boolean activo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("canchas", Cancha.findCanchasBySucursalAndActivo(sucursal, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Cancha.countFindCanchasBySucursalAndActivo(sucursal, activo == null ? Boolean.FALSE : activo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("canchas", Cancha.findCanchasBySucursalAndActivo(sucursal, activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "canchas/list";
    }
    
}
