// This is an empty Ballerina class autogenerated to represent the `java.lang.Class` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ bal bindgen [(-cp|--classpath) <classpath>...]
//               [(-mvn|--maven) <groupId>:<artifactId>:<version>]
//               [(-o|--output) <output-path>]
//               [--public]
//               (<class-name>...)
//
// E.g. $ bal bindgen java.lang.Class

import ballerina/jballerina.java;

# Ballerina class mapping for the Java `java.lang.Class` class.
@java:Binding {'class: "java.lang.Class"}
public distinct class Class {

    *java:JObject;

    # The `handle` field that stores the reference to the `java.lang.Class` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `java.lang.Class` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `java.lang.Class` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

}

