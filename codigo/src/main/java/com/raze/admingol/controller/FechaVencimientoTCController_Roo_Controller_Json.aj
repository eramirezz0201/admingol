// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.FechaVencimientoTC;
import com.raze.admingol.controller.FechaVencimientoTCController;
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

privileged aspect FechaVencimientoTCController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FechaVencimientoTCController.showJson(@PathVariable("id") Long id) {
        FechaVencimientoTC fechaVencimientoTC = FechaVencimientoTC.findFechaVencimientoTC(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (fechaVencimientoTC == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(fechaVencimientoTC.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FechaVencimientoTCController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<FechaVencimientoTC> result = FechaVencimientoTC.findAllFechaVencimientoTCs();
        return new ResponseEntity<String>(FechaVencimientoTC.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> FechaVencimientoTCController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        FechaVencimientoTC fechaVencimientoTC = FechaVencimientoTC.fromJsonToFechaVencimientoTC(json);
        fechaVencimientoTC.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+fechaVencimientoTC.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> FechaVencimientoTCController.createFromJsonArray(@RequestBody String json) {
        for (FechaVencimientoTC fechaVencimientoTC: FechaVencimientoTC.fromJsonArrayToFechaVencimientoTCs(json)) {
            fechaVencimientoTC.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> FechaVencimientoTCController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        FechaVencimientoTC fechaVencimientoTC = FechaVencimientoTC.fromJsonToFechaVencimientoTC(json);
        fechaVencimientoTC.setId(id);
        if (fechaVencimientoTC.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> FechaVencimientoTCController.deleteFromJson(@PathVariable("id") Long id) {
        FechaVencimientoTC fechaVencimientoTC = FechaVencimientoTC.findFechaVencimientoTC(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (fechaVencimientoTC == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        fechaVencimientoTC.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FechaVencimientoTCController.jsonFindFechaVencimientoTCsByActivo(@RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(FechaVencimientoTC.toJsonArray(FechaVencimientoTC.findFechaVencimientoTCsByActivo(activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
}