import hikeG.DBConnect;
import hikeG.models;

import ballerina/io;
import ballerinax/mongodb;

string COLLECTION = "hike";

public function addHike(models:Hike hike) returns models:Hike|error {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error hikeCollection = DB->getCollection(COLLECTION);
        if hikeCollection is mongodb:Collection {

            boolean hikeExists = findHikeByNameBool(hike.name);
            if (hikeExists) {
                return error("Hike already exists");
            }
            var result = hikeCollection->insertOne(hike);
            io:print(result);
            if result is error {
                return result;
            } else {
                return hike;
            }
        } else {
            return hikeCollection;
        }
    } else {
        return error("DB Error");
    }
}

public function findHikeByName(string name) returns models:Hike|error {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error hikeCollection = DB->getCollection(COLLECTION);
        if hikeCollection is mongodb:Collection {
            map<json> filter = {"name": name};
            var result = hikeCollection->findOne(filter, {}, (), models:Hike);
            io:print(result);
            if result is models:Hike {
                return result;
            } else {
                return error("Hike not found");
            }
        } else {
            return hikeCollection;
        }
    } else {
        return DB;
    }
}

public function findHikeByNameBool(string name) returns boolean {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error hikeCollection = DB->getCollection(COLLECTION);
        if hikeCollection is mongodb:Collection {
            map<json> filter = {"name": name};
            var result = hikeCollection->findOne(filter, {}, (), models:Hike);
            io:print(result);
            if result is models:Hike {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    } else {
        return false;
    }
}

public function deleteHike(string name) returns string|error {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error hikeCollection = DB->getCollection(COLLECTION);
        if hikeCollection is mongodb:Collection {
            map<json> filter = {"name": name};
            var result = hikeCollection->deleteOne(filter);
            io:print(result);
            if result is error {
                return result;
            } else {
                return "Hike deleted successfully";
            }
        } else {
            return hikeCollection;
        }
    } else {
        return DB;
    }
}

// public function updateHike(string name, models:Hike hike) returns string|error {
//     mongodb:Database|mongodb:Error DB = DBConnect:Connection();
//     if DB is mongodb:Database {
//         mongodb:Collection|mongodb:Error hikeCollection = DB->getCollection(COLLECTION);
//         if hikeCollection is mongodb:Collection {
//             map<json> filter = { "name": name };
//             map<json> hikeMap = check hike.toJson();
//             var result = hikeCollection->updateOne(filter, { "$set": hikeMap });
//             io:print(result);
//             if result is error {
//                 return result;
//             } else {
//                 return "Hike updated successfully";
//             }
//         } else {
//             return hikeCollection; 
//         }
//     } else {
//         return DB; 
//     }
// }

public function getAllHikes() returns json|error {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error hikeCollection = DB->getCollection(COLLECTION);
        if hikeCollection is mongodb:Collection {
            var result = hikeCollection->find({}, {}, (), models:Hike);
            io:print(result);
            if result is stream<models:Hike, error?> {
                json[] hikesJson = [];
                error? e = result.forEach(function(models:Hike hike) {
                    hikesJson.push(hike.toJson());
                });
                if e is error {
                    return e;
                }
                return hikesJson;
            } else {
                return result;
            }
        } else {
            return hikeCollection;
        }
    } else {
        return DB;
    }

}
