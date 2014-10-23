// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.catalog;

import com.raze.admingol.catalog.Posicion;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Posicion_Roo_Json {
    
    public String Posicion.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Posicion.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Posicion Posicion.fromJsonToPosicion(String json) {
        return new JSONDeserializer<Posicion>()
        .use(null, Posicion.class).deserialize(json);
    }
    
    public static String Posicion.toJsonArray(Collection<Posicion> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Posicion.toJsonArray(Collection<Posicion> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Posicion> Posicion.fromJsonArrayToPosicions(String json) {
        return new JSONDeserializer<List<Posicion>>()
        .use("values", Posicion.class).deserialize(json);
    }
    
}
