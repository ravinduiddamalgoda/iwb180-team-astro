public type User record {
    string name;
    int age;
    string homeTown;
    string homeAddress;
    string email;
    string phone;
    string password;
    string username;
};

public type Login record {
    string username;
    string password;
};

public type Hike record {
    string name;
    string location;
    string difficulty;
    float avgDistance;
    float avgTime;
};


public type UserHike record {
    string username;
    string hikeName;
    string date;
    float time;
    boolean approved;
};

public type Hikelocations record {
    string name;
    LatLng[] location;      
}; 

public type LatLng record {
    float latitude;
    float longitude;
};
