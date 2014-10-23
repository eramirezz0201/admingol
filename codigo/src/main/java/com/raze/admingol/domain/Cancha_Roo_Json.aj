// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.admingol.domain;

import com.raze.admingol.domain.Cancha;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Cancha_Roo_Json {
    
    public String Cancha.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Cancha.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Cancha Cancha.fromJsonToCancha(String json) {
        return new JSONDeserializer<Cancha>()
        .use(null, Cancha.class).deserialize(json);
    }
    
    public static String Cancha.toJsonArray(Collection<Cancha> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Cancha.toJsonArray(Collection<Cancha> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Cancha> Cancha.fromJsonArrayToCanchas(String json) {
        return new JSONDeserializer<List<Cancha>>()
        .use("values", Cancha.class).deserialize(json);
    }
    
}
