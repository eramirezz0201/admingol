// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.controller;

import com.raze.admingol.catalog.Rol;
import com.raze.admingol.controller.UsuarioController;
import com.raze.admingol.domain.Empresa;
import com.raze.admingol.domain.Usuario;
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

privileged aspect UsuarioController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UsuarioController.showJson(@PathVariable("id") Long id) {
        Usuario usuario = Usuario.findUsuario(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (usuario == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(usuario.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UsuarioController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Usuario> result = Usuario.findAllUsuarios();
        return new ResponseEntity<String>(Usuario.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> UsuarioController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        Usuario usuario = Usuario.fromJsonToUsuario(json);
        usuario.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+usuario.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> UsuarioController.createFromJsonArray(@RequestBody String json) {
        for (Usuario usuario: Usuario.fromJsonArrayToUsuarios(json)) {
            usuario.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> UsuarioController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Usuario usuario = Usuario.fromJsonToUsuario(json);
        usuario.setId(id);
        if (usuario.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> UsuarioController.deleteFromJson(@PathVariable("id") Long id) {
        Usuario usuario = Usuario.findUsuario(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (usuario == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        usuario.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByApellidoPaternoLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UsuarioController.jsonFindUsuariosByApellidoPaternoLike(@RequestParam("apellidoPaterno") String apellidoPaterno) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Usuario.toJsonArray(Usuario.findUsuariosByApellidoPaternoLike(apellidoPaterno).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByEmpresaAndActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UsuarioController.jsonFindUsuariosByEmpresaAndActivo(@RequestParam("empresa") Empresa empresa, @RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Usuario.toJsonArray(Usuario.findUsuariosByEmpresaAndActivo(empresa, activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByEmpresaAndNombreLikeAndActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UsuarioController.jsonFindUsuariosByEmpresaAndNombreLikeAndActivo(@RequestParam("empresa") Empresa empresa, @RequestParam("nombre") String nombre, @RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Usuario.toJsonArray(Usuario.findUsuariosByEmpresaAndNombreLikeAndActivo(empresa, nombre, activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByRolAndActivo", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UsuarioController.jsonFindUsuariosByRolAndActivo(@RequestParam("rol") Rol rol, @RequestParam(value = "activo", required = false) Boolean activo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Usuario.toJsonArray(Usuario.findUsuariosByRolAndActivo(rol, activo == null ? Boolean.FALSE : activo).getResultList()), headers, HttpStatus.OK);
    }
    
}
