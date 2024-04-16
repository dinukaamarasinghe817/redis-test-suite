import ballerina/persist;
import ballerina/test;
import Test_Suite.db;

@test:Config {
    groups: ["person", "redis"],
    dependsOn: []
}
function redisPersonCreateTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    int[] ids = check manyAssociationsClient->/people.post([person1]);
    test:assertEquals(ids, [person1.id]);

    Person personRetrieved = check manyAssociationsClient->/people/[person1.id];
    test:assertEquals(personRetrieved, person1);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: []
}
function redisPersonCreateTest2() returns error? {
    db:Client manyAssociationsClient = check new ();

    int[] ids = check manyAssociationsClient->/people.post([person2]);

    test:assertEquals(ids, [person2.id]);

    Person personRetrieved = check manyAssociationsClient->/people/[person2.id];
    test:assertEquals(personRetrieved, person2);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: [redisPersonCreateTest]
}
function redisPersonReadOneTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    Person personRetrieved = check manyAssociationsClient->/people/[person1.id];
    test:assertEquals(personRetrieved, person1);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: [redisPersonCreateTest]
}
function redisPersonReadOneTestNegative() returns error? {
    db:Client manyAssociationsClient = check new ();

    Person|error personRetrieved = manyAssociationsClient->/people/[23];
    if personRetrieved is persist:NotFoundError {
        test:assertEquals(personRetrieved.message(),
                "A record with the key 'Person:23' does not exist for the entity 'Person'.");
    } else {
        test:assertFail("NotFoundError expected.");
    }
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: [redisPersonCreateTest, redisPersonCreateTest2]
}
function redisPersonReadManyTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    stream<Person, persist:Error?> personStream = manyAssociationsClient->/people;
    Person[] people = check from Person person in personStream
        order by person.id ascending
        select person;

    test:assertEquals(people, [person1, person2]);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["dependent", "person"],
    dependsOn: [redisPersonCreateTest, redisPersonCreateTest2, redisApartmentCreateTest]
}
function redisPersonReadManyDependentTest1() returns error? {
    db:Client manyAssociationsClient = check new ();

    stream<PersonWithAssociations, persist:Error?> personStream = manyAssociationsClient->/people;
    PersonWithAssociations[] people = check from PersonWithAssociations person in personStream
        order by person.id ascending
        select person;

    test:assertEquals(people, [
                {
                    id: 1,
                    name: "Jane",
                    soldBuildings: [{code: "B001"}],
                    ownBuildings: []
                },
                {
                    id: 2,
                    name: "Mike",
                    soldBuildings: [],
                    ownBuildings: [{code: "B001"}]
                }
            ]);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: [redisPersonReadOneTest, redisPersonReadManyTest, redisPersonReadManyDependentTest1]
}
function redisPersonUpdateTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    Person person = check manyAssociationsClient->/people/[person1.id].put({
        name: "Mary"
    });

    test:assertEquals(person, person1Updated);

    Person personRetrieved = check manyAssociationsClient->/people/[person1.id];
    test:assertEquals(personRetrieved, person1Updated);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: [redisPersonReadOneTest, redisPersonReadManyTest, redisPersonReadManyDependentTest1]
}
function redisPersonUpdateTestNegative1() returns error? {
    db:Client manyAssociationsClient = check new ();

    Person|error person = manyAssociationsClient->/people/[23].put({
        name: "Jane"
    });

    if person is persist:NotFoundError {
        test:assertEquals(person.message(),
                "A record with the key 'Person:23' does not exist for the entity 'Person'.");
    } else {
        test:assertFail("NotFoundError expected.");
    }
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: [redisPersonUpdateTest, redisApartmentDeleteTest]
}
function redisPersonDeleteTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    Person person = check manyAssociationsClient->/people/[person1.id].delete();
    test:assertEquals(person, person1Updated);

    stream<Person, error?> personStream = manyAssociationsClient->/people;
    Person[] people = check from Person person2 in personStream
        order by person2.id ascending
        select person2;

    test:assertEquals(people, [person2]);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["person", "redis"],
    dependsOn: [redisPersonDeleteTest]
}
function redisPersonDeleteTestNegative() returns error? {
    db:Client manyAssociationsClient = check new ();

    Person|error person = manyAssociationsClient->/people/[person1.id].delete();

    if person is persist:NotFoundError {
        test:assertEquals(person.message(),
                string `A record with the key 'Person:${person1.id}' does not exist for the entity 'Person'.`);
    } else {
        test:assertFail("NotFoundError expected.");
    }
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["apartment", "redis"],
    dependsOn: [redisPersonCreateTest, redisPersonCreateTest2]
}
function redisApartmentCreateTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    string[] apartmentCodes = check manyAssociationsClient->/apartments.post([apartment1]);
    test:assertEquals(apartmentCodes, [apartment1.code]);

    Apartment apartmentRetrieved = check manyAssociationsClient->/apartments/[apartment1.code];
    test:assertEquals(apartmentRetrieved, apartment1);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["apartment", "redis"],
    dependsOn: [redisApartmentCreateTest]
}
function redisApartmentReadOneTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    Apartment apartmentRetrieved = check manyAssociationsClient->/apartments/[apartment1.code];
    test:assertEquals(apartmentRetrieved, apartment1);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["apartment", "redis"],
    dependsOn: [redisApartmentCreateTest]
}
function redisApartmentReadOneTestNegative() returns error? {
    db:Client manyAssociationsClient = check new ();

    Apartment|error apartmentRetrieved = manyAssociationsClient->/apartments/["invalid-apartment-code"];
    if apartmentRetrieved is persist:NotFoundError {
        test:assertEquals(apartmentRetrieved.message(),
                "A record with the key 'Apartment:invalid-apartment-code' does not exist for the entity 'Apartment'.");
    } else {
        test:assertFail("persist:NotFoundError expected.");
    }
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["apartment", "redis"],
    dependsOn: [redisApartmentReadOneTest]
}
function redisApartmentUpdateTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    Apartment apartment = check manyAssociationsClient->/apartments/[apartment1.code].put({
        postalCode: "00002"
    });

    test:assertEquals(apartment, apartment1Updated);

    Apartment apartmentRetrieved = check manyAssociationsClient->/apartments/[apartment1.code];
    test:assertEquals(apartmentRetrieved, apartment1Updated);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["apartment", "redis"],
    dependsOn: [redisApartmentReadOneTest]
}
function redisApartmentUpdateTestNegative1() returns error? {
    db:Client manyAssociationsClient = check new ();

    Apartment|error apartment = manyAssociationsClient->/apartments/["invalid-apartment-code"].put({
        postalCode: "00002"
    });

    if apartment is persist:NotFoundError {
        test:assertEquals(apartment.message(),
                "A record with the key 'Apartment:invalid-apartment-code' does not exist for the entity 'Apartment'.");
    } else {
        test:assertFail("persist:NotFoundError expected.");
    }
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["apartment", "redis"],
    dependsOn: [redisApartmentUpdateTest, redisPersonReadManyDependentTest1]
}
function redisApartmentDeleteTest() returns error? {
    db:Client manyAssociationsClient = check new ();

    Apartment apartment = check manyAssociationsClient->/apartments/[apartment1.code].delete();
    test:assertEquals(apartment, apartment1Updated);

    stream<Apartment, error?> apartmentStream = manyAssociationsClient->/apartments;
    Apartment[] apartments = check from Apartment apartment2 in apartmentStream
        order by apartment2.code ascending
        select apartment2;

    test:assertEquals(apartments, []);
    check manyAssociationsClient.close();
}

@test:Config {
    groups: ["apartment", "redis"],
    dependsOn: [redisApartmentDeleteTest]
}
function redisApartmentDeleteTestNegative() returns error? {
    db:Client manyAssociationsClient = check new ();

    Apartment|error apartment = manyAssociationsClient->/apartments/[apartment1.code].delete();

    if apartment is error {
        test:assertEquals(apartment.message(),
                string `A record with the key 'Apartment:${apartment1.code}' does not exist for the entity 'Apartment'.`);
    } else {
        test:assertFail("persist:NotFoundError expected.");
    }
    check manyAssociationsClient.close();
}

type PersonWithAssoc record {|
    readonly int id;
    string name;
    record {|
        string code;
    |}[] soldBuildings;
|};

type ApartmentWithAssoc record {|
    string code;
    string city;
    string state;
    record {|
        int id;
        string name;
    |} soldPerson;
|};