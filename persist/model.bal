import ballerina/persist as _;

type Person record {|
    readonly int id;
    string name;

    Apartment[] soldBuildings;
    Apartment[] ownBuildings;
|};

type Apartment record {|
    readonly string code;
    string city;
    string state;
    string country;
    string postalCode;
    string 'type;

    Person soldPerson;
    Person ownPerson;
|};