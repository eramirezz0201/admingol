// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.DiasJuego;
import com.raze.admingol.catalog.TipoCobro;
import com.raze.admingol.controller.ConfiguracionTorneoController;
import com.raze.admingol.domain.ConfiguracionTorneo;
import com.raze.admingol.domain.Torneo;
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

privileged aspect ConfiguracionTorneoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ConfiguracionTorneoController.create(@Valid ConfiguracionTorneo configuracionTorneo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, configuracionTorneo);
            return "configuraciontorneos/create";
        }
        uiModel.asMap().clear();
        configuracionTorneo.persist();
        return "redirect:/configuraciontorneos/" + encodeUrlPathSegment(configuracionTorneo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ConfiguracionTorneoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ConfiguracionTorneo());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Torneo.countTorneos() == 0) {
            dependencies.add(new String[] { "torneo", "torneos" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "configuraciontorneos/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ConfiguracionTorneoController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("configuraciontorneo", ConfiguracionTorneo.findConfiguracionTorneo(id));
        uiModel.addAttribute("itemId", id);
        return "configuraciontorneos/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ConfiguracionTorneoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findConfiguracionTorneoEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ConfiguracionTorneo.countConfiguracionTorneos() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("configuraciontorneos", ConfiguracionTorneo.findAllConfiguracionTorneos(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "configuraciontorneos/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ConfiguracionTorneoController.update(@Valid ConfiguracionTorneo configuracionTorneo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, configuracionTorneo);
            return "configuraciontorneos/update";
        }
        uiModel.asMap().clear();
        configuracionTorneo.merge();
        return "redirect:/configuraciontorneos/" + encodeUrlPathSegment(configuracionTorneo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ConfiguracionTorneoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ConfiguracionTorneo.findConfiguracionTorneo(id));
        return "configuraciontorneos/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ConfiguracionTorneoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ConfiguracionTorneo configuracionTorneo = ConfiguracionTorneo.findConfiguracionTorneo(id);
        configuracionTorneo.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/configuraciontorneos";
    }
    
    void ConfiguracionTorneoController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("configuracionTorneo_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("configuracionTorneo_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ConfiguracionTorneoController.populateEditForm(Model uiModel, ConfiguracionTorneo configuracionTorneo) {
        uiModel.addAttribute("configuracionTorneo", configuracionTorneo);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("diasjuegoes", DiasJuego.findAllDiasJuegoes());
        uiModel.addAttribute("tipocobroes", TipoCobro.findAllTipoCobroes());
        uiModel.addAttribute("torneos", Torneo.findAllTorneos());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String ConfiguracionTorneoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
