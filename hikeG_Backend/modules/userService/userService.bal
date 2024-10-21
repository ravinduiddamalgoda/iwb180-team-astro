import ballerinax/mongodb;
import hikeG.DBConnect;
import ballerina/io;
import hikeG.models;

string COLLECTION = "user";

public function addUser(models:User user) returns models:User|error {
    mongodb:Database|mongodb:Error userDB = DBConnect:Connection();

    if userDB is mongodb:Database {
        mongodb:Collection|mongodb:Error userCollection = userDB->getCollection(COLLECTION);
        if userCollection is mongodb:Collection {
            models:User|error existingUser = findUserByEmail(user.email);
            if existingUser is models:User {
                return error("User already exists with the email: " + user.email);
            }
            // io:println(existingUser);
            models:User|error existingUser2 = findUserByUsername(user.username);
            if existingUser2 is models:User {
                return error("User already exists with the username: " + user.username);
            }
            // io:println(existingUser2);
            var result = userCollection->insertOne(user);
            if result is error {
                return result;
            } else {
                io:println("User added successfully");
                return user; // Return the error if inserting the document fails
            }
        } else {
            return userCollection; // Return the error if getting the collection fails
        }
    } else {
        return userDB; // Return the error if getting the database fails
    }
}

public function getUser(string name) returns models:User|error {
    mongodb:Database|mongodb:Error userDB = DBConnect:Connection();
    if userDB is mongodb:Database {
        mongodb:Collection|mongodb:Error userCollection = userDB->getCollection("userCollection");
        if userCollection is mongodb:Collection {
            map<json> filter = { "name": name };
            var result = userCollection->findOne(filter, {}, (), models:User);
            if result is models:User {
                return result;
            } else {
                return error("User not found");
            }
        } else {
            return userCollection; // Return the error if getting the collection fails
        }
    } else {
        return userDB; // Return the error if getting the database fails
    }
}


public function updateUser(string name, int age, string homeTown, string homeAddress, string email, string phone, string username, string password) returns string|error {
    mongodb:Database|mongodb:Error userDB = DBConnect:Connection();
    if userDB is mongodb:Database {
        mongodb:Collection|mongodb:Error userCollection = userDB->getCollection("userCollection");
        if userCollection is mongodb:Collection {
            map<json> filter = { "name": name };

            // Create an update using the correct mongodb:Update type
            mongodb:Update updateDoc = {
                "$set": {
                    "age": age,
                    "homeTown": homeTown,
                    "homeAddress": homeAddress,
                    "email": email,
                    "phone": phone,
                    "username": username,
                    "password": password
                }
            };

            // Apply the update
            var result = userCollection->updateOne(filter, updateDoc, {});
            if result is mongodb:UpdateResult {
                if result.matchedCount > 0 {
                    return "User updated successfully";
                } else {
                    return "User not found";
                }
            } else {
                return result; // Return the error if the update operation fails
            }
        } else {
            return userCollection; // Return the error if getting the collection fails
        }
    } else {
        return userDB; // Return the error if getting the database fails
    }
}

public function deleteUser(string name) returns string|error {
    mongodb:Database|mongodb:Error userDB = DBConnect:Connection();
    if userDB is mongodb:Database {
        mongodb:Collection|mongodb:Error userCollection = userDB->getCollection(COLLECTION);
        if userCollection is mongodb:Collection {
            map<json> filter = { "name": name };
            var result = userCollection->deleteOne(filter);
            if result is mongodb:DeleteResult {
                if result.deletedCount > 0 {
                    return "User deleted successfully";
                } else {
                    return "User not found";
                }
            } else {
                return result; // Return the error if the delete operation fails
            }
        } else {
            return userCollection; // Return the error if getting the collection fails
        }
    } else {
        return userDB; // Return the error if getting the database fails
    }
}

public function findUserByEmail(string email) returns models:User|error {
    mongodb:Database|mongodb:Error userDB = DBConnect:Connection();
    if userDB is mongodb:Database {
        mongodb:Collection|mongodb:Error userCollection = userDB->getCollection(COLLECTION);
        if userCollection is mongodb:Collection {
            map<json> filter = { "email": email };
            var result = userCollection->findOne(filter, {}, (), models:User);
            io:print(result);
            if result is models:User {
                return result;
            } else {
                return error("User not found");
            }
        } else {
            return userCollection; // Return the error if getting the collection fails
        }
    } else {
        return userDB; // Return the error if getting the database fails
    }
}

public function findUserByUsername(string username) returns models:User|error {
    mongodb:Database|mongodb:Error userDB = DBConnect:Connection();
    if userDB is mongodb:Database {
        mongodb:Collection|mongodb:Error userCollection = userDB->getCollection(COLLECTION);
        if userCollection is mongodb:Collection {
            map<json> filter = { "username": username };
            var result = userCollection->findOne(filter, {}, (), models:User);
            io:print(result);
            if result is models:User {
                return result;
            } else {
                return error("User not found");
            }
        } else {
            return userCollection; // Return the error if getting the collection fails
        }
    } else {
        return userDB; // Return the error if getting the database fails
    }
}






