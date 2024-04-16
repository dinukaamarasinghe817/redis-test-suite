// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

public type Person record {|
    readonly int id;
    string name;

|};

public type PersonOptionalized record {|
    int id?;
    string name?;
|};

public type PersonWithRelations record {|
    *PersonOptionalized;
    ApartmentOptionalized[] soldBuildings?;
    ApartmentOptionalized[] ownBuildings?;
|};

public type PersonTargetType typedesc<PersonWithRelations>;

public type PersonInsert Person;

public type PersonUpdate record {|
    string name?;
|};

public type Apartment record {|
    readonly string code;
    string city;
    string state;
    string country;
    string postalCode;
    string 'type;
    int soldpersonId;
    int ownpersonId;
|};

public type ApartmentOptionalized record {|
    string code?;
    string city?;
    string state?;
    string country?;
    string postalCode?;
    string 'type?;
    int soldpersonId?;
    int ownpersonId?;
|};

public type ApartmentWithRelations record {|
    *ApartmentOptionalized;
    PersonOptionalized soldPerson?;
    PersonOptionalized ownPerson?;
|};

public type ApartmentTargetType typedesc<ApartmentWithRelations>;

public type ApartmentInsert Apartment;

public type ApartmentUpdate record {|
    string city?;
    string state?;
    string country?;
    string postalCode?;
    string 'type?;
    int soldpersonId?;
    int ownpersonId?;
|};

