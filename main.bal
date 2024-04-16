import ballerina/http;
import Test_Suite.db;


# A service representing a network-accessible API
# bound to port `9090`.
service /workspace on new http:Listener(9090) {

    private final db:Client dbClient;

    function init() returns error? {
        self.dbClient = check new();
    }

}