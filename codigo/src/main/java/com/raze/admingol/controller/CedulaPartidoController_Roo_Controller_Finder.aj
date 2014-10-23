// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.StatusCedula;
import com.raze.admingol.controller.CedulaPartidoController;
import com.raze.admingol.domain.CedulaPartido;
import com.raze.admingol.domain.Partido;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CedulaPartidoController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByPartido", "form" }, method = RequestMethod.GET)
    public String CedulaPartidoController.findCedulaPartidoesByPartidoForm(Model uiModel) {
        uiModel.addAttribute("partidoes", Partido.findAllPartidoes());
        return "cedulapartidoes/findCedulaPartidoesByPartido";
    }
    
    @RequestMapping(params = "find=ByPartido", method = RequestMethod.GET)
    public String CedulaPartidoController.findCedulaPartidoesByPartido(@RequestParam("partido") Partido partido, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("cedulapartidoes", CedulaPartido.findCedulaPartidoesByPartido(partido, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) CedulaPartido.countFindCedulaPartidoesByPartido(partido) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cedulapartidoes", CedulaPartido.findCedulaPartidoesByPartido(partido, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "cedulapartidoes/list";
    }
    
    @RequestMapping(params = { "find=ByPartidoAndStatus", "form" }, method = RequestMethod.GET)
    public String CedulaPartidoController.findCedulaPartidoesByPartidoAndStatusForm(Model uiModel) {
        uiModel.addAttribute("partidoes", Partido.findAllPartidoes());
        uiModel.addAttribute("statuscedulas", StatusCedula.findAllStatusCedulas());
        return "cedulapartidoes/findCedulaPartidoesByPartidoAndStatus";
    }
    
    @RequestMapping(params = "find=ByPartidoAndStatus", method = RequestMethod.GET)
    public String CedulaPartidoController.findCedulaPartidoesByPartidoAndStatus(@RequestParam("partido") Partido partido, @RequestParam("status") StatusCedula status, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("cedulapartidoes", CedulaPartido.findCedulaPartidoesByPartidoAndStatus(partido, status, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) CedulaPartido.countFindCedulaPartidoesByPartidoAndStatus(partido, status) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cedulapartidoes", CedulaPartido.findCedulaPartidoesByPartidoAndStatus(partido, status, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "cedulapartidoes/list";
    }
    
}
