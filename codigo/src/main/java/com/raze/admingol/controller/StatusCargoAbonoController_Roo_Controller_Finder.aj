// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.StatusCargoAbono;
import com.raze.admingol.controller.StatusCargoAbonoController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect StatusCargoAbonoController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByActivo", "form" }, method = RequestMethod.GET)
    public String StatusCargoAbonoController.findStatusCargoAbonoesByActivoForm(Model uiModel) {
        return "statuscargoabonoes/findStatusCargoAbonoesByActivo";
    }
    
    @RequestMapping(params = "find=ByActivo", method = RequestMethod.GET)
    public String StatusCargoAbonoController.findStatusCargoAbonoesByActivo(@RequestParam(value = "activo", required = false) Boolean activo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("statuscargoabonoes", StatusCargoAbono.findStatusCargoAbonoesByActivo(activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) StatusCargoAbono.countFindStatusCargoAbonoesByActivo(activo == null ? Boolean.FALSE : activo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("statuscargoabonoes", StatusCargoAbono.findStatusCargoAbonoesByActivo(activo == null ? Boolean.FALSE : activo, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "statuscargoabonoes/list";
    }
    
}
