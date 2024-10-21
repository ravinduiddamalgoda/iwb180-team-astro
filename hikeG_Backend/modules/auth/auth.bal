import ballerina/jwt;

import hikeG.userService;
import hikeG.passwordUtil;
import hikeG.models;
import ballerina/io;

jwt:IssuerConfig issuerConfig = {
    issuer: "hikeG",
    expTime: 3600*24*7*52,
    signatureConfig: {
        algorithm: "HS256",
        config: "hikeG"
    }
};

jwt:ValidatorConfig validatorConfig = {
    issuer: "hikeG",    
    signatureConfig: {
        secret: "hikeG"
    }
};

function generateToken(string username) returns string | error {
    issuerConfig.username = username;
    return jwt:issue(issuerConfig);
}

public function validateToken(string token, string username) returns jwt:Payload | error {
    validatorConfig.username = username;
    return jwt:validate(token, validatorConfig);
}

public function login(string username, string password) returns string|error {
    models:User|error user = userService:findUserByUsername(username);
    if user is models:User {
        boolean passwordMatch = passwordUtil:checkPassword(password, user.password);
        if (passwordMatch) {
            return generateToken(username);
        } else {
            io:println("Invalid username or password (password mismatch)");
            return error("Invalid username or password");
        }
    } else {
        io:println("Invalid username or password (user not found)");
        return error("Invalid username or password");
    }
}