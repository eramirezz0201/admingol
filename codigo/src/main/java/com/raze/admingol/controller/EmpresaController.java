package com.raze.admingol.controller;
import com.raze.admingol.domain.Empresa;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RooWebJson(jsonObject = Empresa.class)
@Controller
@RequestMapping("/empresas")
@RooWebScaffold(path = "empresas", formBackingObject = Empresa.class)
@RooWebFinder
public class EmpresaController {
}
