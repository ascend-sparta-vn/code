package com.webtrucking.util;

import org.apache.logging.log4j.LogManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by trankhai on 8/18/17.
 */
public class JsonMapConverter {
    static org.apache.logging.log4j.Logger log = LogManager.getLogger(JsonMapConverter.class);

    public static JSONObject toJson(Map<String, Object> map) {
        JSONObject jsonObject = new JSONObject();

        for (String key : map.keySet()) {
            try {
                Object obj = map.get(key);
                if (obj instanceof Map) {
                    jsonObject.put(key, toJson((Map) obj));
                }
                else if (obj instanceof List) {
                    jsonObject.put(key, toJson((List) obj));
                }
                else {
                    jsonObject.put(key, map.get(key));
                }
            }
            catch (JSONException jsone) {
                log.error("Failed to put value for " + key + " into JSONObject.", jsone);
            }
        }

        return jsonObject;
    }

    public static JSONArray toJson(List<Object> list) {
        JSONArray jsonArray = new JSONArray();

        for (Object obj : list) {
            if (obj instanceof Map) {
                jsonArray.put(toJson((Map) obj));
            }
            else if (obj instanceof List) {
                jsonArray.put(toJson((List) obj));
            }
            else {
                jsonArray.put(obj);
            }
        }

        return jsonArray;
    }

    public static Map<String, Object> fromJson(JSONObject jsonObject) {
        Map<String, Object> map = new HashMap<String, Object>();

        Iterator<String> keyIterator = jsonObject.keys();
        while (keyIterator.hasNext()) {
            String key = keyIterator.next();
            try {
                Object obj = jsonObject.get(key);

                if (obj instanceof JSONObject) {
                    map.put(key, fromJson((JSONObject) obj));
                }
                else if (obj instanceof JSONArray) {
                    map.put(key, fromJson((JSONArray) obj));
                }
                else {
                    map.put(key, obj);
                }
            }
            catch (JSONException jsone) {
                log.error("Failed to get value for " + key + " from JSONObject.", jsone);
            }
        }

        return map;
    }

    public static List<Object> fromJson(JSONArray jsonArray) {
        List<Object> list = new ArrayList<Object>();

        for (int i = 0; i < jsonArray.length(); i++) {
            try {
                Object obj = jsonArray.get(i);

                if (obj instanceof JSONObject) {
                    list.add(fromJson((JSONObject) obj));
                }
                else if (obj instanceof JSONArray) {
                    list.add(fromJson((JSONArray) obj));
                }
                else {
                    list.add(obj);
                }
            }
            catch (JSONException jsone) {
                log.error("Failed to get value at index " + i + " from JSONArray.", jsone);
            }
        }

        return list;
    }
}