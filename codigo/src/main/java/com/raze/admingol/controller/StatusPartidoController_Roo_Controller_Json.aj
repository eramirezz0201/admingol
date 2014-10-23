// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.StatusPartido;
import com.raze.admingol.controller.StatusPartidoController;
import java.util.List;
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

privileged aspect StatusPartidoController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> StatusPartidoController.showJson(@PathVariable("id") Long id) {
        StatusPartido statusPartido = StatusPartido.findStatusPartido(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (statusPartido == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(statusPartido.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> StatusPartidoController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<StatusPartido> result = StatusPartido.findAllStatusPartidoes();
        return new ResponseEntity<String>(StatusPartido.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> StatusPartidoController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        StatusPartido statusPartido = StatusPartido.fromJsonToStatusPartido(json);
        statusPartido.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+statusPartido.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> StatusPartidoController.createFromJsonArray(@RequestBody String json) {
        for (StatusPartido statusPartido: StatusPartido.fromJsonArrayToStatusPartidoes(json)) {
            statusPartido.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> StatusPartidoController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        StatusPartido statusPartido = StatusPartido.fromJsonToStatusPartido(json);
        statusPartido.setId(id);
        if (statusPartido.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> StatusPartidoController.deleteFromJson(@PathVariable("id") Long id) {
        StatusPartido statusPartido = StatusPartido.findStatusPartido(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (statusPartido == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        statusPartido.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> StatusPartidoController.jsonFindStatusPartidoesByActivo(@RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(StatusPartido.toJsonArray(StatusPartido.findStatusPartidoesByActivo(activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
}