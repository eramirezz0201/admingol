package com.raze.admingol.controller;
import com.raze.admingol.domain.PagoHechoServicio;
import com.raze.admingol.service.domain.ControlPagoServicioService;
import com.raze.admingol.service.domain.PagoHechoServicioService;
import com.raze.admingol.service.domain.UsuarioService;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/pagohechoservicios")
public class PagoHechoServicioController {

	@Autowired
    ControlPagoServicioService controlPagoServicioService;

	@Autowired
    PagoHechoServicioService pagoHechoServicioService;

	@Autowired
    UsuarioService usuarioService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid PagoHechoServicio pagoHechoServicio, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pagoHechoServicio);
            return "pagohechoservicios/create";
        }
        uiModel.asMap().clear();
        pagoHechoServicioService.savePagoHechoServicio(pagoHechoServicio);
        return "redirect:/pagohechoservicios/" + encodeUrlPathSegment(pagoHechoServicio.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new PagoHechoServicio());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (controlPagoServicioService.countAllControlPagoServicios() == 0) {
            dependencies.add(new String[] { "controlPagoServicio", "controlpagoservicios" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "pagohechoservicios/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("pagohechoservicio", pagoHechoServicioService.findPagoHechoServicio(id));
        uiModel.addAttribute("itemId", id);
        return "pagohechoservicios/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pagohechoservicios", pagoHechoServicioService.findPagoHechoServicioEntries(firstResult, sizeNo));
            float nrOfPages = (float) pagoHechoServicioService.countAllPagoHechoServicios() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pagohechoservicios", pagoHechoServicioService.findAllPagoHechoServicios());
        }
        addDateTimeFormatPatterns(uiModel);
        return "pagohechoservicios/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PagoHechoServicio pagoHechoServicio, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pagoHechoServicio);
            return "pagohechoservicios/update";
        }
        uiModel.asMap().clear();
        pagoHechoServicioService.updatePagoHechoServicio(pagoHechoServicio);
        return "redirect:/pagohechoservicios/" + encodeUrlPathSegment(pagoHechoServicio.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, pagoHechoServicioService.findPagoHechoServicio(id));
        return "pagohechoservicios/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PagoHechoServicio pagoHechoServicio = pagoHechoServicioService.findPagoHechoServicio(id);
        pagoHechoServicioService.deletePagoHechoServicio(pagoHechoServicio);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pagohechoservicios";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("pagoHechoServicio_fechapago_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pagoHechoServicio_fechavencimiento_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pagoHechoServicio_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pagoHechoServicio_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, PagoHechoServicio pagoHechoServicio) {
        uiModel.addAttribute("pagoHechoServicio", pagoHechoServicio);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("controlpagoservicios", controlPagoServicioService.findAllControlPagoServicios());
        uiModel.addAttribute("usuarios", usuarioService.findAllUsuarios());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showJson(@PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            PagoHechoServicio pagoHechoServicio = pagoHechoServicioService.findPagoHechoServicio(id);
            if (pagoHechoServicio == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<String>(pagoHechoServicio.toJson(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            List<PagoHechoServicio> result = pagoHechoServicioService.findAllPagoHechoServicios();
            return new ResponseEntity<String>(PagoHechoServicio.toJsonArray(result), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            PagoHechoServicio pagoHechoServicio = PagoHechoServicio.fromJsonToPagoHechoServicio(json);
            pagoHechoServicioService.savePagoHechoServicio(pagoHechoServicio);
            RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
            headers.add("Location",uriBuilder.path(a.value()[0]+"/"+pagoHechoServicio.getId().toString()).build().toUriString());
            return new ResponseEntity<String>(headers, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            for (PagoHechoServicio pagoHechoServicio: PagoHechoServicio.fromJsonArrayToPagoHechoServicios(json)) {
                pagoHechoServicioService.savePagoHechoServicio(pagoHechoServicio);
            }
            return new ResponseEntity<String>(headers, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            PagoHechoServicio pagoHechoServicio = PagoHechoServicio.fromJsonToPagoHechoServicio(json);
            pagoHechoServicio.setId(id);
            if (pagoHechoServicioService.updatePagoHechoServicio(pagoHechoServicio) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<String>(headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> deleteFromJson(@PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            PagoHechoServicio pagoHechoServicio = pagoHechoServicioService.findPagoHechoServicio(id);
            if (pagoHechoServicio == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            pagoHechoServicioService.deletePagoHechoServicio(pagoHechoServicio);
            return new ResponseEntity<String>(headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
