// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.controller.CanchaController;
import com.raze.admingol.domain.Cancha;
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

privileged aspect CanchaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CanchaController.create(@Valid Cancha cancha, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cancha);
            return "canchas/create";
        }
        uiModel.asMap().clear();
        cancha.persist();
        return "redirect:/canchas/" + encodeUrlPathSegment(cancha.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CanchaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Cancha());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Sucursal.countSucursals() == 0) {
            dependencies.add(new String[] { "sucursal", "sucursals" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "canchas/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CanchaController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("cancha", Cancha.findCancha(id));
        uiModel.addAttribute("itemId", id);
        return "canchas/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CanchaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("canchas", Cancha.findCanchaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Cancha.countCanchas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("canchas", Cancha.findAllCanchas(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "canchas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CanchaController.update(@Valid Cancha cancha, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cancha);
            return "canchas/update";
        }
        uiModel.asMap().clear();
        cancha.merge();
        return "redirect:/canchas/" + encodeUrlPathSegment(cancha.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CanchaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Cancha.findCancha(id));
        return "canchas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CanchaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Cancha cancha = Cancha.findCancha(id);
        cancha.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/canchas";
    }
    
    void CanchaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("cancha_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("cancha_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void CanchaController.populateEditForm(Model uiModel, Cancha cancha) {
        uiModel.addAttribute("cancha", cancha);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("sucursals", Sucursal.findAllSucursals());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String CanchaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
