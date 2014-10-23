// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.StatusPartido;
import com.raze.admingol.controller.PartidoController;
import com.raze.admingol.domain.Cancha;
import com.raze.admingol.domain.Equipo;
import com.raze.admingol.domain.Partido;
import com.raze.admingol.domain.Torneo;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect PartidoController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.showJson(@PathVariable("id") Long id) {
        Partido partido = Partido.findPartido(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (partido == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(partido.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Partido> result = Partido.findAllPartidoes();
        return new ResponseEntity<String>(Partido.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PartidoController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        Partido partido = Partido.fromJsonToPartido(json);
        partido.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+partido.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PartidoController.createFromJsonArray(@RequestBody String json) {
        for (Partido partido: Partido.fromJsonArrayToPartidoes(json)) {
            partido.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PartidoController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Partido partido = Partido.fromJsonToPartido(json);
        partido.setId(id);
        if (partido.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> PartidoController.deleteFromJson(@PathVariable("id") Long id) {
        Partido partido = Partido.findPartido(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (partido == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        partido.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCancha", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByCancha(@RequestParam("cancha") Cancha cancha) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByCancha(cancha).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCanchaAndStatus", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByCanchaAndStatus(@RequestParam("cancha") Cancha cancha, @RequestParam("status") StatusPartido status) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByCanchaAndStatus(cancha, status).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCanchaAndStatusAndFechaJuegoBetween", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByCanchaAndStatusAndFechaJuegoBetween(@RequestParam("cancha") Cancha cancha, @RequestParam("status") StatusPartido status, @RequestParam("minFechaJuego") @DateTimeFormat(style = "M-") Date minFechaJuego, @RequestParam("maxFechaJuego") @DateTimeFormat(style = "M-") Date maxFechaJuego) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByCanchaAndStatusAndFechaJuegoBetween(cancha, status, minFechaJuego, maxFechaJuego).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCanchaAndStatusAndFechaJuegoEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByCanchaAndStatusAndFechaJuegoEquals(@RequestParam("cancha") Cancha cancha, @RequestParam("status") StatusPartido status, @RequestParam("fechaJuego") @DateTimeFormat(style = "M-") Date fechaJuego) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByCanchaAndStatusAndFechaJuegoEquals(cancha, status, fechaJuego).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByFechaJuegoBetweenAndStatus", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByFechaJuegoBetweenAndStatus(@RequestParam("minFechaJuego") @DateTimeFormat(style = "M-") Date minFechaJuego, @RequestParam("maxFechaJuego") @DateTimeFormat(style = "M-") Date maxFechaJuego, @RequestParam("status") StatusPartido status) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByFechaJuegoBetweenAndStatus(minFechaJuego, maxFechaJuego, status).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByFechaJuegoEqualsAndStatus", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByFechaJuegoEqualsAndStatus(@RequestParam("fechaJuego") @DateTimeFormat(style = "M-") Date fechaJuego, @RequestParam("status") StatusPartido status) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByFechaJuegoEqualsAndStatus(fechaJuego, status).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante, @RequestParam("status") StatusPartido status) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByTorneoEquipoLocalAndTorneoEquipoVisitanteAndEquipoLocalAndEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitante", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitante(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitante(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("equipoLocal") Equipo equipoLocal, @RequestParam("equipoVisitante") Equipo equipoVisitante, @RequestParam("status") StatusPartido status) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndEquipoLocalOrEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, equipoLocal, equipoVisitante, status).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PartidoController.jsonFindPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus(@RequestParam("torneoEquipoLocal") Torneo torneoEquipoLocal, @RequestParam("torneoEquipoVisitante") Torneo torneoEquipoVisitante, @RequestParam("status") StatusPartido status) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Partido.toJsonArray(Partido.findPartidoesByTorneoEquipoLocalOrTorneoEquipoVisitanteAndStatus(torneoEquipoLocal, torneoEquipoVisitante, status).getResultList()), headers, HttpStatus.OK);
    }
    
}
