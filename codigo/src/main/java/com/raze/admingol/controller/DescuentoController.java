package com.raze.admingol.controller;
import com.raze.admingol.catalog.Descuento;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RooWebJson(jsonObject = Descuento.class)
@Controller
@RequestMapping("/descuentoes")
@RooWebScaffold(path = "descuentoes", formBackingObject = Descuento.class)
@RooWebFinder
public class DescuentoController {
}
