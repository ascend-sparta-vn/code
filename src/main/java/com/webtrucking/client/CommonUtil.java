package com.webtrucking.client;

import com.google.gson.Gson;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.StringReader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by ngocthanh on 8/18/17.
 */
public class CommonUtil {

    public static JsonObject jsonFromString2(String jsonObjectStr) {
        if (jsonObjectStr != null) {
            jsonObjectStr = jsonObjectStr.replaceAll("\"","\\\"");
        }
        System.out.println(jsonObjectStr);
        JsonReader jsonReader = Json.createReader(new StringReader(jsonObjectStr));

        JsonObject object = jsonReader.readObject();
        jsonReader.close();

        return object;
    }

    public static JsonObject jsonFromString(String jsonObjectStr) {

        System.out.println(jsonObjectStr);
        JsonReader jsonReader = Json.createReader(new StringReader(jsonObjectStr));

        JsonObject object = jsonReader.readObject();
        jsonReader.close();

        return object;
    }

    public static Map<String, String> mapFromJsonString(String jsonObjectStr) {

        JsonReader jsonReader = Json.createReader(new StringReader(jsonObjectStr));
        JsonObject jsonResult = jsonReader.readObject();
        jsonReader.close();
        Set<String> iterator = jsonResult.keySet();
        Map<String, String> response = new HashMap<>();
        for (String key: iterator) {
            response.put(key, String.valueOf(jsonResult.get(key)));
        }
        return response;
    }

    public static String toSHA1(byte[] convertme) {
        final char[] HEX_CHARS = "0123456789ABCDEF".toCharArray();
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-1");
        }
        catch(NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte[] buf = md.digest(convertme);
        char[] chars = new char[2 * buf.length];
        for (int i = 0; i < buf.length; ++i) {
            chars[2 * i] = HEX_CHARS[(buf[i] & 0xF0) >>> 4];
            chars[2 * i + 1] = HEX_CHARS[buf[i] & 0x0F];
        }
        return new String(chars);
    }

    public static String mapToJsonString(Map inputMap) {
        Gson gson = new Gson();
        String json = gson.toJson(inputMap);
        System.out.println(json);
        return json;
    }


//    public static void main(String[] args) {
//        System.out.println(toSHA1("0976686535Welcome1234".getBytes()));
//    }
}
