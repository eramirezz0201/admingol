// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.Alineacion;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Alineacion_Roo_Json {
    
    public String Alineacion.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Alineacion.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Alineacion Alineacion.fromJsonToAlineacion(String json) {
        return new JSONDeserializer<Alineacion>()
        .use(null, Alineacion.class).deserialize(json);
    }
    
    public static String Alineacion.toJsonArray(Collection<Alineacion> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Alineacion.toJsonArray(Collection<Alineacion> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Alineacion> Alineacion.fromJsonArrayToAlineacions(String json) {
        return new JSONDeserializer<List<Alineacion>>()
        .use("values", Alineacion.class).deserialize(json);
    }
    
}
