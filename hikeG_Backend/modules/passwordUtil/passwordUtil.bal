import hikeG.org.mindrot.jbcrypt as bcrypt;

# Description.
#
# + password - password to be hashed
# + return - hashed password
public function hashPassword(string password) returns string {
    return bcrypt:BCrypt_hashpw(password, bcrypt:BCrypt_gensalt());
}

# Description.
#
# + password - plain text password  
# + hashedPassword - hashed password
# + return - boolean value indicating whether the password is correct
public function checkPassword(string password, string hashedPassword) returns boolean {
    return bcrypt:BCrypt_checkpw(password, hashedPassword);
}
