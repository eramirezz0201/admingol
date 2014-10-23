package com.raze.admingol.controller;
import com.raze.admingol.catalog.TipoTarjeta;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RooWebJson(jsonObject = TipoTarjeta.class)
@Controller
@RequestMapping("/tipotarjetas")
@RooWebScaffold(path = "tipotarjetas", formBackingObject = TipoTarjeta.class)
@RooWebFinder
public class TipoTarjetaController {
}
