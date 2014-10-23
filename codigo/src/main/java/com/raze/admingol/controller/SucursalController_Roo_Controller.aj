// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.controller.SucursalController;
import com.raze.admingol.domain.Empresa;
import com.raze.admingol.domain.Sucursal;
import com.raze.admingol.domain.Usuario;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SucursalController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SucursalController.create(@Valid Sucursal sucursal, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sucursal);
            return "sucursals/create";
        }
        uiModel.asMap().clear();
        sucursal.persist();
        return "redirect:/sucursals/" + encodeUrlPathSegment(sucursal.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SucursalController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Sucursal());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Empresa.countEmpresas() == 0) {
            dependencies.add(new String[] { "empresa", "empresas" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "sucursals/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SucursalController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("sucursal", Sucursal.findSucursal(id));
        uiModel.addAttribute("itemId", id);
        return "sucursals/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SucursalController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sucursals", Sucursal.findSucursalEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Sucursal.countSucursals() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sucursals", Sucursal.findAllSucursals(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "sucursals/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SucursalController.update(@Valid Sucursal sucursal, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sucursal);
            return "sucursals/update";
        }
        uiModel.asMap().clear();
        sucursal.merge();
        return "redirect:/sucursals/" + encodeUrlPathSegment(sucursal.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SucursalController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Sucursal.findSucursal(id));
        return "sucursals/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SucursalController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Sucursal sucursal = Sucursal.findSucursal(id);
        sucursal.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sucursals";
    }
    
    void SucursalController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("sucursal_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("sucursal_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void SucursalController.populateEditForm(Model uiModel, Sucursal sucursal) {
        uiModel.addAttribute("sucursal", sucursal);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String SucursalController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
