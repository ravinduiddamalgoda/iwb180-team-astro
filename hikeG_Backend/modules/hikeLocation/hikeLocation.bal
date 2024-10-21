import hikeG.DBConnect;
import hikeG.models;
import ballerina/io;
import ballerinax/mongodb;

string COLLECTION = "hikeLocation";

public function addHikeLocation(models:Hikelocations hikeLocation) returns models:Hikelocations|error {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error hikeLocationCollection = DB->getCollection(COLLECTION);
        if hikeLocationCollection is mongodb:Collection {
            var result = hikeLocationCollection->insertOne(hikeLocation);
            io:print(result);
            if result is error {
                return result;
            } else {
                return hikeLocation;
            }
        } else {
            return hikeLocationCollection;
        }
    } else {
        return error("DB Error");
    }
}

public function findHikeLocationByName(string name) returns models:Hikelocations|error {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error hikeLocationCollection = DB->getCollection(COLLECTION);
        if hikeLocationCollection is mongodb:Collection {
            map<json> filter = {"name": name};
            var result = hikeLocationCollection->findOne(filter, {}, (), models:Hikelocations);
            io:print(result);
            if result is models:Hikelocations {
                return result;
            } else {
                return error("Hike Location not found");
            }
        } else {
            return hikeLocationCollection;
        }
    } else {
        return DB;
    }
}