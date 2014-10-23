// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.Accion;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Accion_Roo_Json {
    
    public String Accion.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Accion.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Accion Accion.fromJsonToAccion(String json) {
        return new JSONDeserializer<Accion>()
        .use(null, Accion.class).deserialize(json);
    }
    
    public static String Accion.toJsonArray(Collection<Accion> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Accion.toJsonArray(Collection<Accion> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Accion> Accion.fromJsonArrayToAccions(String json) {
        return new JSONDeserializer<List<Accion>>()
        .use("values", Accion.class).deserialize(json);
    }
    
}
