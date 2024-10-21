import hikeG.auth;
import hikeG.hikeService;
import hikeG.models;
import hikeG.passwordUtil;
import hikeG.userHike;
import hikeG.userService;
import hikeG.hikeLocation;

import ballerina/http;
import ballerina/io;
import ballerina/jwt;

service / on new http:Listener(9090) {

    resource function get .() returns string|error {
        return passwordUtil:hashPassword("password");
    }

    resource function post addUser(http:Request req) returns models:User|error {
        json payload = check req.getJsonPayload();
        models:User newUser = check payload.cloneWithType(models:User);
        newUser.password = passwordUtil:hashPassword(newUser.password);
        return userService:addUser(newUser);
    }

    resource function post login(http:Request req) returns json {
        json|error payload = req.getJsonPayload();
        if (payload is error) {
            io:println(payload);
            return {
                "error": "Invalid payload 1"
            };
        }
        models:Login|error newLogin = payload.cloneWithType(models:Login);
        if (newLogin is error) {
            io:println(newLogin);
            return {
                "error": "Invalid payload 2"
            };
        }
        string username = newLogin.username;
        string password = newLogin.password;

        string|error token = auth:login(username, password);

        if (token is error) {
            io:println(token);
            return {
                "error": "Invalid username or password"
            };
        }
        io:println(token);
        return {
            "token": token
        };
    }

    resource function get validate(http:Request req) returns jwt:Payload|json {
        string|error token = req.getHeader("Authorization");
        if (token is string) {
            string|error username = check req.getQueryParamValue("username") ?: "";
            if (username is error) {
                io:println(username);
                return <json>{
                    "error": "Invalid username"
                };
            }
            jwt:Payload|error payload = auth:validateToken(token, username);
            if (payload is error) {
                io:println(payload);
                return <json>{
                    "error": "Invalid token"
                };
            }
            io:println(payload);
            return payload;
        }
    }

    resource function get getUser(http:Caller caller, http:Request req) returns error? {
        // Use `getQueryParamValue` to retrieve the 'name' query parameter
        string? name = req.getQueryParamValue("name");

        if name is string {
            // Fetch the user using the userService module
            models:User|error result = userService:getUser(name);
            if result is models:User {
                // Respond with the user details if found
                check caller->respond(result);
            } else {
                // Respond with an error message if the user is not found
                check caller->respond({"error": "User not found"});
            }
        } else {
            // If 'name' query parameter is missing, return a bad request response
            check caller->respond({"error": "Query parameter 'name' is missing"});
        }
    }

    resource function post addHike(http:Request req) returns models:Hike|error {
        json payload = check req.getJsonPayload();
        models:Hike newHike = check payload.cloneWithType(models:Hike);
        return hikeService:addHike(newHike);
    }

    resource function get getHike(http:Caller caller, http:Request req) returns error? {
        // Use `getQueryParamValue` to retrieve the 'name' query parameter
        string? name = req.getQueryParamValue("name");

        if name is string {
            // Fetch the user using the userService module
            models:Hike|error result = hikeService:findHikeByName(name);
            if result is models:Hike {
                // Respond with the user details if found
                check caller->respond(result);
            } else {
                // Respond with an error message if the user is not found
                check caller->respond({"error": "Hike not found"});
            }
        } else {
            // If 'name' query parameter is missing, return a bad request response
            check caller->respond({"error": "Query parameter 'name' is missing"});
        }
    }

    resource function get hike/allHike(http:Request req) returns json|error {
            return hikeService:getAllHikes();     
    }

    resource function post addUserHike(http:Request req) returns models:UserHike|error {
        json payload = check req.getJsonPayload();
        // playload?.approved = false;
        models:UserHike newUserHike = check payload.cloneWithType(models:UserHike);
        return userHike:addUserHike(newUserHike);
    }

    resource function post addHikeLocation(http:Request req) returns models:Hikelocations|error {
        json payload = check req.getJsonPayload();
        models:Hikelocations newHikeLocation = check payload.cloneWithType(models:Hikelocations);
        return hikeLocation:addHikeLocation(newHikeLocation);
        
    }

    resource function get Hike/LocationByName(http:Request req) returns models:Hikelocations|error {
        string? name = req.getQueryParamValue("name");
        if name is string {
            models:Hikelocations|error result = hikeLocation:findHikeLocationByName(name);
            if result is models:Hikelocations {
                return result;
            } else {
                return error("Hike Location not found");
            }
        } else {
            return error("Query parameter 'name' is missing");
        }
        
    }

}

