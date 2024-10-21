import hikeG.java.lang as javalang;
import hikeG.java.security as javasecurity;

import ballerina/jballerina.java;
import ballerina/jballerina.java.arrays as jarrays;

# Ballerina class mapping for the Java `org.mindrot.jbcrypt.BCrypt` class.
@java:Binding {'class: "org.mindrot.jbcrypt.BCrypt"}
public distinct class BCrypt {

    *java:JObject;
    *javalang:Object;

    # The `handle` field that stores the reference to the `org.mindrot.jbcrypt.BCrypt` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `org.mindrot.jbcrypt.BCrypt` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `org.mindrot.jbcrypt.BCrypt` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `crypt_raw` method of `org.mindrot.jbcrypt.BCrypt`.
    #
    # + arg0 - The `byte[]` value required to map with the Java method parameter.
    # + arg1 - The `byte[]` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `int[]` value required to map with the Java method parameter.
    # + return - The `byte[]` value returning from the Java mapping.
    public function crypt_raw(byte[] arg0, byte[] arg1, int arg2, int[] arg3) returns byte[]|error {
        handle externalObj = org_mindrot_jbcrypt_BCrypt_crypt_raw(self.jObj, check jarrays:toHandle(arg0, "byte"), check jarrays:toHandle(arg1, "byte"), arg2, check jarrays:toHandle(arg3, "int"));
        return <byte[]>check jarrays:fromHandle(externalObj, "byte");
    }

    # The function that maps to the `equals` method of `org.mindrot.jbcrypt.BCrypt`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(javalang:Object arg0) returns boolean {
        return org_mindrot_jbcrypt_BCrypt_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `getClass` method of `org.mindrot.jbcrypt.BCrypt`.
    #
    # + return - The `javalang:Class` value returning from the Java mapping.
    public function getClass() returns javalang:Class {
        handle externalObj = org_mindrot_jbcrypt_BCrypt_getClass(self.jObj);
        javalang:Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `hashCode` method of `org.mindrot.jbcrypt.BCrypt`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return org_mindrot_jbcrypt_BCrypt_hashCode(self.jObj);
    }

    # The function that maps to the `notify` method of `org.mindrot.jbcrypt.BCrypt`.
    public function notify() {
        org_mindrot_jbcrypt_BCrypt_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `org.mindrot.jbcrypt.BCrypt`.
    public function notifyAll() {
        org_mindrot_jbcrypt_BCrypt_notifyAll(self.jObj);
    }

    # The function that maps to the `wait` method of `org.mindrot.jbcrypt.BCrypt`.
    #
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function 'wait() returns javalang:InterruptedException? {
        error|() externalObj = org_mindrot_jbcrypt_BCrypt_wait(self.jObj);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.mindrot.jbcrypt.BCrypt`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait2(int arg0) returns javalang:InterruptedException? {
        error|() externalObj = org_mindrot_jbcrypt_BCrypt_wait2(self.jObj, arg0);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.mindrot.jbcrypt.BCrypt`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait3(int arg0, int arg1) returns javalang:InterruptedException? {
        error|() externalObj = org_mindrot_jbcrypt_BCrypt_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# The constructor function to generate an object of `org.mindrot.jbcrypt.BCrypt`.
#
# + return - The new `BCrypt` class generated.
public function newBCrypt1() returns BCrypt {
    handle externalObj = org_mindrot_jbcrypt_BCrypt_newBCrypt1();
    BCrypt newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `checkpw` method of `org.mindrot.jbcrypt.BCrypt`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `string` value required to map with the Java method parameter.
# + return - The `boolean` value returning from the Java mapping.
public function BCrypt_checkpw(string arg0, string arg1) returns boolean {
    return org_mindrot_jbcrypt_BCrypt_checkpw(java:fromString(arg0), java:fromString(arg1));
}

# The function that maps to the `gensalt` method of `org.mindrot.jbcrypt.BCrypt`.
#
# + return - The `string` value returning from the Java mapping.
public function BCrypt_gensalt() returns string {
    return java:toString(org_mindrot_jbcrypt_BCrypt_gensalt()) ?: "";
}

# The function that maps to the `gensalt` method of `org.mindrot.jbcrypt.BCrypt`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `string` value returning from the Java mapping.
public function BCrypt_gensalt2(int arg0) returns string {
    return java:toString(org_mindrot_jbcrypt_BCrypt_gensalt2(arg0)) ?: "";
}

# The function that maps to the `gensalt` method of `org.mindrot.jbcrypt.BCrypt`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `javasecurity:SecureRandom` value required to map with the Java method parameter.
# + return - The `string` value returning from the Java mapping.
public function BCrypt_gensalt3(int arg0, javasecurity:SecureRandom arg1) returns string {
    return java:toString(org_mindrot_jbcrypt_BCrypt_gensalt3(arg0, arg1.jObj)) ?: "";
}

# The function that maps to the `hashpw` method of `org.mindrot.jbcrypt.BCrypt`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `string` value required to map with the Java method parameter.
# + return - The `string` value returning from the Java mapping.
public function BCrypt_hashpw(string arg0, string arg1) returns string {
    return java:toString(org_mindrot_jbcrypt_BCrypt_hashpw(java:fromString(arg0), java:fromString(arg1))) ?: "";
}

function org_mindrot_jbcrypt_BCrypt_checkpw(handle arg0, handle arg1) returns boolean = @java:Method {
    name: "checkpw",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function org_mindrot_jbcrypt_BCrypt_crypt_raw(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) returns handle = @java:Method {
    name: "crypt_raw",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["[B", "[B", "int", "[I"]
} external;

function org_mindrot_jbcrypt_BCrypt_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["java.lang.Object"]
} external;

function org_mindrot_jbcrypt_BCrypt_gensalt() returns handle = @java:Method {
    name: "gensalt",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: []
} external;

function org_mindrot_jbcrypt_BCrypt_gensalt2(int arg0) returns handle = @java:Method {
    name: "gensalt",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["int"]
} external;

function org_mindrot_jbcrypt_BCrypt_gensalt3(int arg0, handle arg1) returns handle = @java:Method {
    name: "gensalt",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["int", "java.security.SecureRandom"]
} external;

function org_mindrot_jbcrypt_BCrypt_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: []
} external;

function org_mindrot_jbcrypt_BCrypt_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: []
} external;

function org_mindrot_jbcrypt_BCrypt_hashpw(handle arg0, handle arg1) returns handle = @java:Method {
    name: "hashpw",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function org_mindrot_jbcrypt_BCrypt_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: []
} external;

function org_mindrot_jbcrypt_BCrypt_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: []
} external;

function org_mindrot_jbcrypt_BCrypt_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: []
} external;

function org_mindrot_jbcrypt_BCrypt_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["long"]
} external;

function org_mindrot_jbcrypt_BCrypt_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: ["long", "int"]
} external;

function org_mindrot_jbcrypt_BCrypt_newBCrypt1() returns handle = @java:Constructor {
    'class: "org.mindrot.jbcrypt.BCrypt",
    paramTypes: []
} external;

