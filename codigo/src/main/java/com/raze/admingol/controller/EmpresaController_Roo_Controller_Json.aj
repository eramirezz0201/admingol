// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.controller.EmpresaController;
import com.raze.admingol.domain.Empresa;
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

privileged aspect EmpresaController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> EmpresaController.showJson(@PathVariable("id") Long id) {
        Empresa empresa = Empresa.findEmpresa(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (empresa == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(empresa.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> EmpresaController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Empresa> result = Empresa.findAllEmpresas();
        return new ResponseEntity<String>(Empresa.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EmpresaController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        Empresa empresa = Empresa.fromJsonToEmpresa(json);
        empresa.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+empresa.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EmpresaController.createFromJsonArray(@RequestBody String json) {
        for (Empresa empresa: Empresa.fromJsonArrayToEmpresas(json)) {
            empresa.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> EmpresaController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Empresa empresa = Empresa.fromJsonToEmpresa(json);
        empresa.setId(id);
        if (empresa.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> EmpresaController.deleteFromJson(@PathVariable("id") Long id) {
        Empresa empresa = Empresa.findEmpresa(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (empresa == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        empresa.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> EmpresaController.jsonFindEmpresasByActivo(@RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Empresa.toJsonArray(Empresa.findEmpresasByActivo(activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByNombreComercialLikeAndActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> EmpresaController.jsonFindEmpresasByNombreComercialLikeAndActivo(@RequestParam("nombreComercial") String nombreComercial, @RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Empresa.toJsonArray(Empresa.findEmpresasByNombreComercialLikeAndActivo(nombreComercial, activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByNombreLikeAndActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> EmpresaController.jsonFindEmpresasByNombreLikeAndActivo(@RequestParam("nombre") String nombre, @RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Empresa.toJsonArray(Empresa.findEmpresasByNombreLikeAndActivo(nombre, activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
}