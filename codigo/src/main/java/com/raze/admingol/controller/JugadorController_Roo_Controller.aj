// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.Posicion;
import com.raze.admingol.catalog.StatusEquipoJugador;
import com.raze.admingol.controller.JugadorController;
import com.raze.admingol.domain.Equipo;
import com.raze.admingol.domain.Jugador;
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

privileged aspect JugadorController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String JugadorController.create(@Valid Jugador jugador, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, jugador);
            return "jugadors/create";
        }
        uiModel.asMap().clear();
        jugador.persist();
        return "redirect:/jugadors/" + encodeUrlPathSegment(jugador.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String JugadorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Jugador());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Equipo.countEquipoes() == 0) {
            dependencies.add(new String[] { "equipo", "equipoes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "jugadors/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String JugadorController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("jugador", Jugador.findJugador(id));
        uiModel.addAttribute("itemId", id);
        return "jugadors/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String JugadorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("jugadors", Jugador.findJugadorEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Jugador.countJugadors() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("jugadors", Jugador.findAllJugadors(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "jugadors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String JugadorController.update(@Valid Jugador jugador, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, jugador);
            return "jugadors/update";
        }
        uiModel.asMap().clear();
        jugador.merge();
        return "redirect:/jugadors/" + encodeUrlPathSegment(jugador.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String JugadorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Jugador.findJugador(id));
        return "jugadors/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String JugadorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Jugador jugador = Jugador.findJugador(id);
        jugador.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/jugadors";
    }
    
    void JugadorController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("jugador_fechanacimiento_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("jugador_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("jugador_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void JugadorController.populateEditForm(Model uiModel, Jugador jugador) {
        uiModel.addAttribute("jugador", jugador);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("posicions", Posicion.findAllPosicions());
        uiModel.addAttribute("statusequipojugadors", StatusEquipoJugador.findAllStatusEquipoJugadors());
        uiModel.addAttribute("equipoes", Equipo.findAllEquipoes());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String JugadorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
