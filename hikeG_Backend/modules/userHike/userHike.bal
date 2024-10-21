import hikeG.DBConnect;
import hikeG.models;

import ballerina/io;
import ballerinax/mongodb;

string COLLECTION = "userhike";


public function addUserHike(models:UserHike userHike) returns models:UserHike|error {
    mongodb:Database|mongodb:Error DB = DBConnect:Connection();
    userHike.approved = false;
    if DB is mongodb:Database {
        mongodb:Collection|mongodb:Error userHikeCollection = DB->getCollection(COLLECTION);
        if userHikeCollection is mongodb:Collection {
            var result = userHikeCollection->insertOne(userHike);
            io:print(result);
            if result is error {
                return result;
            } else {
                return userHike;
            }
        } else {
            return userHikeCollection;
        }
    } else {
        return error("DB Error");
    }
}