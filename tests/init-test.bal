import ballerina/time;

AllTypes allTypes1 = {
    id: 1,
    booleanType: false,
    intType: 5,
    floatType: 6.0,
    decimalType: 23.44,
    stringType: "test-2",
    dateType: {year: 1993, month: 11, day: 3},
    timeOfDayType: {hour: 12, minute: 32, second: 34},
    utcType: [1684493685, 0.998012],
    civilType: {
        utcOffset: {hours: 5, minutes: 30, seconds: 0},
        timeAbbrev: "Asia/Colombo",
        year: 2024,
        month: 2,
        day: 27,
        hour: 10,
        minute: 30,
        second: 21
    },
    booleanTypeOptional: false,
    intTypeOptional: 5,
    floatTypeOptional: 6.0,
    decimalTypeOptional: 23.44,
    stringTypeOptional: "test",
    dateTypeOptional: {year: 1993, month: 11, day: 3},
    timeOfDayTypeOptional: {hour: 12, minute: 32, second: 34},
    utcTypeOptional: [1684493685, 0.998012],
    civilTypeOptional: {
        utcOffset: {hours: 5, minutes: 30, seconds: 0},
        timeAbbrev: "Asia/Colombo",
        year: 2024,
        month: 2,
        day: 27,
        hour: 10,
        minute: 30,
        second: 21
    },
    enumType: "TYPE_3",
    enumTypeOptional: "TYPE_2"
};

AllTypes allTypes1Expected = {
    id: allTypes1.id,
    booleanType: allTypes1.booleanType,
    intType: allTypes1.intType,
    floatType: allTypes1.floatType,
    decimalType: allTypes1.decimalType,
    stringType: allTypes1.stringType,
    dateType: allTypes1.dateType,
    timeOfDayType: allTypes1.timeOfDayType,
    utcType: allTypes1.utcType,
    civilType: allTypes1.civilType,
    booleanTypeOptional: allTypes1.booleanTypeOptional,
    intTypeOptional: allTypes1.intTypeOptional,
    floatTypeOptional: allTypes1.floatTypeOptional,
    decimalTypeOptional: allTypes1.decimalTypeOptional,
    stringTypeOptional: allTypes1.stringTypeOptional,
    dateTypeOptional: allTypes1.dateTypeOptional,
    timeOfDayTypeOptional: allTypes1.timeOfDayTypeOptional,
    utcTypeOptional: allTypes1.utcTypeOptional,
    civilTypeOptional: allTypes1.civilTypeOptional,
    enumType: allTypes1.enumType,
    enumTypeOptional: allTypes1.enumTypeOptional
};

AllTypes allTypes2 = {
    id: 2,
    booleanType: true,
    intType: 34,
    floatType: 63.0,
    decimalType: 233.44,
    stringType: "test2",
    dateType: {year: 1996, month: 11, day: 3},
    timeOfDayType: {hour: 17, minute: 32, second: 34},
    utcType: [1684493685, 0.998012],
    civilType: {
        utcOffset: {hours: 5, minutes: 30, seconds: 0},
        timeAbbrev: "Asia/Colombo",
        year: 2024,
        month: 2,
        day: 27,
        hour: 10,
        minute: 30,
        second: 21
    },
    booleanTypeOptional: true,
    intTypeOptional: 6,
    floatTypeOptional: 66.0,
    decimalTypeOptional: 233.44,
    stringTypeOptional: "test2",
    dateTypeOptional: {year: 1293, month: 11, day: 3},
    timeOfDayTypeOptional: {hour: 19, minute: 32, second: 34},
    utcTypeOptional: [1684493685, 0.998012],
    civilTypeOptional: {
        utcOffset: {hours: 5, minutes: 30, seconds: 0},
        timeAbbrev: "Asia/Colombo",
        year: 2024,
        month: 2,
        day: 27,
        hour: 10,
        minute: 30,
        second: 21
    },
    enumType: "TYPE_1",
    enumTypeOptional: "TYPE_3"
};

AllTypes allTypes2Expected = {
    id: allTypes2.id,
    booleanType: allTypes2.booleanType,
    intType: allTypes2.intType,
    floatType: allTypes2.floatType,
    decimalType: allTypes2.decimalType,
    stringType: allTypes2.stringType,
    dateType: allTypes2.dateType,
    timeOfDayType: allTypes2.timeOfDayType,
    utcType: allTypes2.utcType,
    civilType: allTypes2.civilType,
    booleanTypeOptional: allTypes2.booleanTypeOptional,
    intTypeOptional: allTypes2.intTypeOptional,
    floatTypeOptional: allTypes2.floatTypeOptional,
    decimalTypeOptional: allTypes2.decimalTypeOptional,
    stringTypeOptional: allTypes2.stringTypeOptional,
    dateTypeOptional: allTypes2.dateTypeOptional,
    timeOfDayTypeOptional: allTypes2.timeOfDayTypeOptional,
    utcTypeOptional: allTypes2.utcTypeOptional,
    civilTypeOptional: allTypes2.civilTypeOptional,
    enumType: allTypes2.enumType,
    enumTypeOptional: allTypes2.enumTypeOptional
};

AllTypes allTypes3 = {
    id: 3,
    booleanType: true,
    intType: 35,
    floatType: 63.0,
    decimalType: 233.44,
    stringType: "test2",
    dateType: {year: 1996, month: 11, day: 3},
    timeOfDayType: {hour: 17, minute: 32, second: 34},
    utcType: [1684493685, 0.998012],
    civilType: {
        utcOffset: {hours: 5, minutes: 30, seconds: 0},
        timeAbbrev: "Asia/Colombo",
        year: 2024,
        month: 2,
        day: 27,
        hour: 10,
        minute: 30,
        second: 21
    },
    enumType: "TYPE_1"
};

AllTypes allTypes3Expected = {
    id: allTypes3.id,
    booleanType: allTypes3.booleanType,
    intType: allTypes3.intType,
    floatType: allTypes3.floatType,
    decimalType: allTypes3.decimalType,
    stringType: allTypes3.stringType,
    dateType: allTypes3.dateType,
    timeOfDayType: allTypes3.timeOfDayType,
    utcType: allTypes3.utcType,
    civilType: allTypes3.civilType,
    enumType: allTypes3.enumType
};

AllTypes allTypes1Updated = {
    id: 1,
    booleanType: true,
    intType: 99,
    floatType: 63.0,
    decimalType: 53.44,
    stringType: "testUpdate",
    dateType: {year: 1996, month: 12, day: 13},
    timeOfDayType: {hour: 16, minute: 12, second: 14},
    utcType: [1686493685, 0.996012],
    civilType: {
        utcOffset: {hours: 6, minutes: 0, seconds: 0},
        timeAbbrev: "Asia/Colombo",
        year: 2022,
        month: 12,
        day: 7,
        hour: 14,
        minute: 5,
        second: 43
    },
    booleanTypeOptional: true,
    intTypeOptional: 53,
    floatTypeOptional: 26.0,
    decimalTypeOptional: 223.44,
    stringTypeOptional: "testUpdate",
    dateTypeOptional: {year: 1923, month: 11, day: 3},
    timeOfDayTypeOptional: {hour: 18, minute: 32, second: 34},
    utcTypeOptional: [1686493685, 0.996012],
    civilTypeOptional: {
        utcOffset: {hours: 6, minutes: 0, seconds: 0},
        timeAbbrev: "Asia/Colombo",
        year: 2022,
        month: 12,
        day: 7,
        hour: 14,
        minute: 5,
        second: 43
    },
    enumType: "TYPE_4",
    enumTypeOptional: "TYPE_4"
};

AllTypes allTypes1UpdatedExpected = {
    id: allTypes1Updated.id,
    booleanType: allTypes1Updated.booleanType,
    intType: allTypes1Updated.intType,
    floatType: allTypes1Updated.floatType,
    decimalType: allTypes1Updated.decimalType,
    stringType: allTypes1Updated.stringType,
    dateType: allTypes1Updated.dateType,
    timeOfDayType: allTypes1Updated.timeOfDayType,
    utcType: allTypes1Updated.utcType,
    civilType: allTypes1Updated.civilType,
    booleanTypeOptional: allTypes1Updated.booleanTypeOptional,
    intTypeOptional: allTypes1Updated.intTypeOptional,
    floatTypeOptional: allTypes1Updated.floatTypeOptional,
    decimalTypeOptional: allTypes1Updated.decimalTypeOptional,
    stringTypeOptional: allTypes1Updated.stringTypeOptional,
    dateTypeOptional: allTypes1Updated.dateTypeOptional,
    timeOfDayTypeOptional: allTypes1Updated.timeOfDayTypeOptional,
    utcTypeOptional: allTypes1Updated.utcTypeOptional,
    civilTypeOptional: allTypes1Updated.civilTypeOptional,
    enumType: allTypes1Updated.enumType,
    enumTypeOptional: allTypes1Updated.enumTypeOptional
};

public type AllTypesDependent record {|
    boolean booleanType;
    int intType;
    float floatType;
    decimal decimalType;
    string stringType;
    time:Date dateType;
    time:TimeOfDay timeOfDayType;
    time:Utc utcType;
    time:Civil civilType;
    boolean booleanTypeOptional?;
    int intTypeOptional?;
    float floatTypeOptional?;
    decimal decimalTypeOptional?;
    string stringTypeOptional?;
    time:Date dateTypeOptional?;
    time:TimeOfDay timeOfDayTypeOptional?;
    time:Utc utcTypeOptional?;
    time:Civil civilTypeOptional?;
|};

OrderItemExtended orderItemExtended1 = {
    orderId: "order-1",
    itemId: "item-1",
    CustomerId: 1,
    paid: false,
    ammountPaid: 10.5f,
    ammountPaidDecimal: 10.5,
    arivalTimeDate: {year: 2021, month: 4, day: 12},
    arivalTimeTimeOfDay: {hour: 17, minute: 50, second: 50.52},
    orderType: INSTORE
};

OrderItemExtended orderItemExtendedRetrieved = {
    orderId: "order-1",
    itemId: "item-1",
    CustomerId: 1,
    paid: false,
    ammountPaid: 10.5f,
    ammountPaidDecimal: 10.5,
    arivalTimeDate: {year: 2021, month: 4, day: 12},
    arivalTimeTimeOfDay: {hour: 17, minute: 50, second: 50.52},
    orderType: INSTORE
};

OrderItemExtended orderItemExtended2 = {
    orderId: "order-2",
    itemId: "item-2",
    CustomerId: 1,
    paid: false,
    ammountPaid: 10.5f,
    ammountPaidDecimal: 10.5,
    arivalTimeDate: {year: 2021, month: 4, day: 12},
    arivalTimeTimeOfDay: {hour: 17, minute: 50, second: 50.52},
    orderType: ONLINE
};

OrderItemExtended orderItemExtended2Retrieved = {
    orderId: "order-2",
    itemId: "item-2",
    CustomerId: 1,
    paid: false,
    ammountPaid: 10.5f,
    ammountPaidDecimal: 10.5,
    arivalTimeDate: {year: 2021, month: 4, day: 12},
    arivalTimeTimeOfDay: {hour: 17, minute: 50, second: 50.52},
    orderType: ONLINE
};

OrderItemExtended orderItemExtended3 = {
    orderId: "order-3",
    itemId: "item-3",
    CustomerId: 4,
    paid: true,
    ammountPaid: 20.5f,
    ammountPaidDecimal: 20.5,
    arivalTimeDate: {year: 2021, month: 4, day: 12},
    arivalTimeTimeOfDay: {hour: 17, minute: 50, second: 50.52},
    orderType: INSTORE
};

OrderItemExtended orderItemExtended3Retrieved = {
    orderId: "order-2",
    itemId: "item-2",
    CustomerId: 1,
    paid: true,
    ammountPaid: 10.5f,
    ammountPaidDecimal: 10.5,
    arivalTimeDate: {year: 2021, month: 4, day: 12},
    arivalTimeTimeOfDay: {hour: 17, minute: 50, second: 50.52},
    orderType: ONLINE
};

public type DepartmentInfo record {|
    string deptNo;
    string deptName;
    record {|
        string firstName;
        string lastName;
    |}[] employees;
|};

public type IntIdRecordDependent record {|
    string randomField;
|};

public type StringIdRecordDependent record {|
    string randomField;
|};

public type FloatIdRecordDependent record {|
    string randomField;
|};

public type DecimalIdRecordDependent record {|
    string randomField;
|};

public type BooleanIdRecordDependent record {|
    string randomField;
|};

public type AllTypesIdRecordDependent record {|
    string randomField;
|};

public type CompositeAssociationRecordDependent record {|
    string randomField;
    int alltypesidrecordIntType;
    decimal alltypesidrecordDecimalType;
    record {|
        int intType;
        string stringType;
        boolean booleanType;
        string randomField;
    |} allTypesIdRecord;
|};

public type EmployeeName record {|
    string firstName;
    string lastName;
|};

public type EmployeeInfo2 record {|
    readonly string empNo;
    time:Date birthDate;
    string departmentDeptNo;
    string workspaceWorkspaceId;
|};

public type WorkspaceInfo2 record {|
    string workspaceType;
    string locationBuildingCode;
|};

public type DepartmentInfo2 record {|
    string deptName;
|};

public type BuildingInfo2 record {|
    string city;
    string state;
    string country;
    string postalCode;
    string 'type;
|};

public type PersonWithAssociations record {|
    int id;
    string name;
    record {|
        string code;
    |}[] soldBuildings;
    record {|
        string code;
    |}[] ownBuildings;
|};

Person person1 = {
    id: 1,
    name: "Jane"
};

Person person2 = {
    id: 2,
    name: "Mike"
};

PersonUpdate person1Update = {
    name: "Mary"
};

Person person1Updated = {
    id: 1,
    name: "Mary"
};

Apartment apartment1 = {
    code: "B001",
    city: "New York",
    state: "New York",
    country: "USA",
    postalCode: "10001",
    'type: "Studio",
    soldpersonId: 1,
    ownpersonId: 2
};

Apartment apartment2 = {
    code: "B002",
    city: "New Jursey",
    state: "New Jursey",
    country: "USA",
    postalCode: "10010",
    'type: "Office",
    soldpersonId: 1,
    ownpersonId: 2
};

ApartmentUpdate apartmentUpdate = {
    postalCode: "00002"
};

Apartment apartment1Updated = {
    code: "B001",
    city: "New York",
    state: "New York",
    country: "USA",
    postalCode: "00002",
    'type: "Studio",
    soldpersonId: 1,
    ownpersonId: 2
};

PersonWithAssociations person1WithAssociations = {
    id: 1,
    name: "Jane",
    soldBuildings: [
        {
            code: "B001"
        }
    ],
    ownBuildings: [
        {
            code: "B002"
        }
    ]
};

PersonWithAssoc person1WithAssoc = {
    id: 1,
    name: "Jane",
    soldBuildings: [{code: "B001"}]
};

PersonWithAssoc person1WithoutAssoc = {
    id: 1,
    name: "Jane",
    soldBuildings: []
};

PersonWithAssoc[] peopleWithAssoc = [
    {
        id: 1,
        name: "Jane",
        soldBuildings: [{code: "B001"}]
    },
    {
        id: 2,
        name: "Mike",
        soldBuildings: []
    }
];

ApartmentWithAssoc[] apartmentsWithAssoc = [
    {
        code: "B001",
        city: "New York",
        state: "New York",
        soldPerson: {id: 1, name: "Jane"}
    }
];

ApartmentWithAssoc apartment1WithPerson = {
    code: "B001",
    city: "New York",
    state: "New York",
    soldPerson: {id: 1, name: "Jane"}
};

ApartmentWithAssoc apartment1WithPersonUpdated = {
    code: "B001",
    city: "New Jursey",
    state: "New York",
    soldPerson: {id: 1, name: "Mike"}
};

PersonWithAssoc person1OnlyPerson = {
    id: 1,
    name: "Jane",
    soldBuildings: []
};

PersonWithAssoc person1WithAssocUpdated = {
    id: 1,
    name: "Mike",
    soldBuildings: []
};

PersonWithAssoc person1WithAssocUpdated2 = {
    id: 1,
    name: "Mike",
    soldBuildings: [{code: "B001"}]
};
