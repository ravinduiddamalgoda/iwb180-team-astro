import ballerinax/mongodb;

configurable string DB_Conn = ?;  // Configurable MongoDB connection string
public string DB = "user";  // Name of the database

mongodb:Client mongoDb = check new ({
    connection: DB_Conn
});

// Function to return a connection to the database
public function Connection() returns  mongodb:Database|error {
    mongodb:Database|mongodb:Error userDB = check mongoDb->getDatabase(DB);
    if userDB is mongodb:Database {
        return userDB;
    } else {
        return userDB;
    }
}
