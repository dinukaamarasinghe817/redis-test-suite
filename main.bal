import ballerina/http;
// import ballerina/persist;
import Test_Suite.db;


# A service representing a network-accessible API
# bound to port `9090`.
service /workspace on new http:Listener(9090) {

    private final db:Client dbClient;

    function init() returns error? {
        self.dbClient = check new();
    }

    // resource function post people(db:Person person) returns http:Created & readonly|persist:Error {
    //     int[]|persist:Error result = self.dbClient->/people.post([person]);
    //     if result is persist:Error {
    //         return result;
    //     }
    //     return http:CREATED;
    // }

    // resource function get people() returns Person[]|error {
    //     stream<Person, persist:Error?> people = self.dbClient->/people;
    //     return from Person person in people select person;
    // }

    // resource function get people/[int id]() returns db:Person|error {
    //     db:Person|persist:Error person = self.dbClient->/people/[id];
    //     return person;
    // }

    // resource function delete people/[int id]() returns http:NoContent|http:InternalServerError {
    //     db:Person|persist:Error result = self.dbClient->/people/[id].delete();
    //     if result is persist:Error {
    //         return http:INTERNAL_SERVER_ERROR;
    //     }
    //     return http:NO_CONTENT;
    // }

    // resource function post houses(db:HouseInsert house) returns http:InternalServerError & readonly|persist:AlreadyExistsError|persist:ConstraintViolationError|http:Created & readonly {
    //     string[]|persist:Error result = self.dbClient->/houses.post([house]);
    //     if result is persist:Error {
    //         if result is persist:AlreadyExistsError || result is persist:ConstraintViolationError {
    //             return result;
    //         }
    //         return http:INTERNAL_SERVER_ERROR;
    //     }
    //     return http:CREATED;
    // }

    // resource function get houses() returns db:House[]|error {
    //     stream<db:House, persist:Error?> houses = self.dbClient->/houses;
    //     return from db:House house in houses select house;
    // }

    // resource function get houses/[string id]() returns House|error {
    //     House|persist:Error house = self.dbClient->/houses/[id];
    //     return house;
    // }

    // resource function delete houses/[string id]() returns http:NoContent|http:InternalServerError {
    //     db:House|persist:Error result = self.dbClient->/houses/[id].delete();
    //     if result is persist:Error {
    //         return http:INTERNAL_SERVER_ERROR;
    //     }
    //     return http:NO_CONTENT;
    // }
}

// type Person record {|
//     readonly int id;
//     string name;
//     db:House[] rentHouses;
//     db:House[] saleHouses;
// |};

// type House record {|
//     readonly string id;
//     int price;
//     record {|
//         int id;
//         string name;
//     |} personRenting;
//     record {|
//         int id;
//         string name;
//     |} personSelling;
// |};