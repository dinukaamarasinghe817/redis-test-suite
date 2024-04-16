// Copyright (c) 2024 WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import Test_Suite.db;

@test:Config {
    groups: ["id-fields", "redis"]
}
function redisIntIdFieldTest() returns error? {
    db:Client testEntitiesClient = check new ();
    db:IntIdRecord intIdRecord1 = {
        id: 1,
        randomField: "test1"
    };
    db:IntIdRecord intIdRecord2 = {
        id: 2,
        randomField: "test2"
    };
    db:IntIdRecord intIdRecord3 = {
        id: 3,
        randomField: "test3"
    };
    db:IntIdRecord intIdRecord1Updated = {
        id: 1,
        randomField: "test1Updated"
    };

    // create
    int[] ids = check testEntitiesClient->/intidrecords.post([intIdRecord1, intIdRecord2, intIdRecord3]);
    test:assertEquals(ids, [intIdRecord1.id, intIdRecord2.id, intIdRecord3.id]);

    // read one
    db:IntIdRecord retrievedRecord1 = check testEntitiesClient->/intidrecords/[intIdRecord1.id];
    test:assertEquals(intIdRecord1, retrievedRecord1);

    // read one dependent
    IntIdRecordDependent retrievedRecord1Dependent = check testEntitiesClient->/intidrecords/[intIdRecord1.id];
    test:assertEquals({randomField: intIdRecord1.randomField}, retrievedRecord1Dependent);

    // read
    db:IntIdRecord[] intIdRecords = check from db:IntIdRecord intIdRecord in 
    testEntitiesClient->/intidrecords.get(db:IntIdRecord)
        order by intIdRecord.id ascending select intIdRecord;
    test:assertEquals(intIdRecords, [intIdRecord1, intIdRecord2, intIdRecord3]);

    // read dependent
    IntIdRecordDependent[] intIdRecordsDependent = check from IntIdRecordDependent intIdRecord in 
    testEntitiesClient->/intidrecords.get(IntIdRecordDependent)
        order by intIdRecord.randomField ascending select intIdRecord;
    test:assertEquals(intIdRecordsDependent, [{randomField: intIdRecord1.randomField}, 
    {randomField: intIdRecord2.randomField}, {randomField: intIdRecord3.randomField}]);

    // update
    retrievedRecord1 = check testEntitiesClient->/intidrecords/
    [intIdRecord1.id].put({randomField: intIdRecord1Updated.randomField});
    test:assertEquals(intIdRecord1Updated, retrievedRecord1);
    retrievedRecord1 = check testEntitiesClient->/intidrecords/[intIdRecord1.id];
    test:assertEquals(intIdRecord1Updated, retrievedRecord1);

    // delete
    db:IntIdRecord retrievedRecord2 = check testEntitiesClient->/intidrecords/[intIdRecord2.id].delete();
    test:assertEquals(intIdRecord2, retrievedRecord2);
    intIdRecords = check from db:IntIdRecord intIdRecord in testEntitiesClient->/intidrecords.get(db:IntIdRecord)
        order by intIdRecord.id ascending select intIdRecord;
    test:assertEquals(intIdRecords, [intIdRecord1Updated, intIdRecord3]);

    check testEntitiesClient.close();
}

@test:Config {
    groups: ["id-fields", "redis"]
}
function redisStringIdFieldTest() returns error? {
    db:Client testEntitiesClient = check new ();
    db:StringIdRecord stringIdRecord1 = {
        id: "id-1",
        randomField: "test1"
    };
    db:StringIdRecord stringIdRecord2 = {
        id: "id-2",
        randomField: "test2"
    };
    db:StringIdRecord stringIdRecord3 = {
        id: "id-3",
        randomField: "test3"
    };
    db:StringIdRecord stringIdRecord1Updated = {
        id: "id-1",
        randomField: "test1Updated"
    };

    // create
    string[] ids = check testEntitiesClient->/stringidrecords.post([stringIdRecord1, stringIdRecord2, stringIdRecord3]);
    test:assertEquals(ids, [stringIdRecord1.id, stringIdRecord2.id, stringIdRecord3.id]);

    // read one
    db:StringIdRecord retrievedRecord1 = check testEntitiesClient->/stringidrecords/[stringIdRecord1.id];
    test:assertEquals(stringIdRecord1, retrievedRecord1);

    // read one dependent
    StringIdRecordDependent retrievedRecord1Dependent = check testEntitiesClient->/stringidrecords/[stringIdRecord1.id];
    test:assertEquals({randomField: stringIdRecord1.randomField}, retrievedRecord1Dependent);

    // read
    db:StringIdRecord[] stringIdRecords = check from db:StringIdRecord stringIdRecord in 
    testEntitiesClient->/stringidrecords.get(db:StringIdRecord)
        order by stringIdRecord.id ascending select stringIdRecord;
    test:assertEquals(stringIdRecords, [stringIdRecord1, stringIdRecord2, stringIdRecord3]);

    // read dependent
    StringIdRecordDependent[] stringIdRecordsDependent = check from StringIdRecordDependent stringIdRecord in 
    testEntitiesClient->/stringidrecords.get(StringIdRecordDependent)
        order by stringIdRecord.randomField ascending select stringIdRecord;
    test:assertEquals(stringIdRecordsDependent, [{randomField: stringIdRecord1.randomField}, 
    {randomField: stringIdRecord2.randomField}, {randomField: stringIdRecord3.randomField}]);

    // update
    retrievedRecord1 = check testEntitiesClient->/stringidrecords/
    [stringIdRecord1.id].put({randomField: stringIdRecord1Updated.randomField});
    test:assertEquals(stringIdRecord1Updated, retrievedRecord1);
    retrievedRecord1 = check testEntitiesClient->/stringidrecords/[stringIdRecord1.id];
    test:assertEquals(stringIdRecord1Updated, retrievedRecord1);

    // delete
    db:StringIdRecord retrievedRecord2 = check testEntitiesClient->/stringidrecords/[stringIdRecord2.id].delete();
    test:assertEquals(stringIdRecord2, retrievedRecord2);
    stringIdRecords = check from db:StringIdRecord stringIdRecord in 
    testEntitiesClient->/stringidrecords.get(db:StringIdRecord)
        order by stringIdRecord.id ascending select stringIdRecord;
    test:assertEquals(stringIdRecords, [stringIdRecord1Updated, stringIdRecord3]);

    check testEntitiesClient.close();
}

@test:Config {
    groups: ["id-fields", "redis"]
}
function redisFloatIdFieldTest() returns error? {
    db:Client testEntitiesClient = check new ();
    db:FloatIdRecord floatIdRecord1 = {
        id: 1.0,
        randomField: "test1"
    };
    db:FloatIdRecord floatIdRecord2 = {
        id: 2.0,
        randomField: "test2"
    };
    db:FloatIdRecord floatIdRecord3 = {
        id: 3.0,
        randomField: "test3"
    };
    db:FloatIdRecord floatIdRecord1Updated = {
        id: 1.0,
        randomField: "test1Updated"
    };

    // create
    float[] ids = check testEntitiesClient->/floatidrecords.post([floatIdRecord1, floatIdRecord2, floatIdRecord3]);
    test:assertEquals(ids, [floatIdRecord1.id, floatIdRecord2.id, floatIdRecord3.id]);

    // read one
    db:FloatIdRecord retrievedRecord1 = check testEntitiesClient->/floatidrecords/[floatIdRecord1.id];
    test:assertEquals(floatIdRecord1, retrievedRecord1);

    // read one dependent
    FloatIdRecordDependent retrievedRecord1Dependent = check testEntitiesClient->/floatidrecords/[floatIdRecord1.id];
    test:assertEquals({randomField: floatIdRecord1.randomField}, retrievedRecord1Dependent);

    // read
    db:FloatIdRecord[] floatIdRecords = check from db:FloatIdRecord floatIdRecord in 
    testEntitiesClient->/floatidrecords.get(db:FloatIdRecord)
        order by floatIdRecord.id ascending select floatIdRecord;
    test:assertEquals(floatIdRecords, [floatIdRecord1, floatIdRecord2, floatIdRecord3]);

    // read dependent
    FloatIdRecordDependent[] floatIdRecordsDependent = check from FloatIdRecordDependent floatIdRecord in 
    testEntitiesClient->/floatidrecords.get(FloatIdRecordDependent)
        order by floatIdRecord.randomField ascending select floatIdRecord;
    test:assertEquals(floatIdRecordsDependent, [{randomField: floatIdRecord1.randomField}, 
    {randomField: floatIdRecord2.randomField}, {randomField: floatIdRecord3.randomField}]);

    // update
    retrievedRecord1 = check testEntitiesClient->/floatidrecords/
    [floatIdRecord1.id].put({randomField: floatIdRecord1Updated.randomField});
    test:assertEquals(floatIdRecord1Updated, retrievedRecord1);
    retrievedRecord1 = check testEntitiesClient->/floatidrecords/[floatIdRecord1.id];
    test:assertEquals(floatIdRecord1Updated, retrievedRecord1);

    // delete
    db:FloatIdRecord retrievedRecord2 = check testEntitiesClient->/floatidrecords/[floatIdRecord2.id].delete();
    test:assertEquals(floatIdRecord2, retrievedRecord2);
    floatIdRecords = check from db:FloatIdRecord floatIdRecord in testEntitiesClient->/floatidrecords.get(db:FloatIdRecord)
        order by floatIdRecord.id ascending select floatIdRecord;
    test:assertEquals(floatIdRecords, [floatIdRecord1Updated, floatIdRecord3]);
}

@test:Config {
    groups: ["id-fields", "redis"]
}
function redisDecimalIdFieldTest() returns error? {
    db:Client testEntitiesClient = check new ();
    db:DecimalIdRecord decimalIdRecord1 = {
        id: 1.1d,
        randomField: "test1"
    };
    db:DecimalIdRecord decimalIdRecord2 = {
        id: 2.2d,
        randomField: "test2"
    };
    db:DecimalIdRecord decimalIdRecord3 = {
        id: 3.3d,
        randomField: "test3"
    };
    db:DecimalIdRecord decimalIdRecord1Updated = {
        id: 1.1d,
        randomField: "test1Updated"
    };

    // create
    decimal[] ids = check testEntitiesClient->/decimalidrecords.post([decimalIdRecord1, decimalIdRecord2, 
    decimalIdRecord3]);
    test:assertEquals(ids, [decimalIdRecord1.id, decimalIdRecord2.id, decimalIdRecord3.id]);

    // read one
    db:DecimalIdRecord retrievedRecord1 = check testEntitiesClient->/decimalidrecords/[decimalIdRecord1.id];
    test:assertEquals(decimalIdRecord1, retrievedRecord1);

    // read one dependent
    DecimalIdRecordDependent retrievedRecord1Dependent = check testEntitiesClient->/decimalidrecords/
    [decimalIdRecord1.id];
    test:assertEquals({randomField: decimalIdRecord1.randomField}, retrievedRecord1Dependent);

    // read
    db:DecimalIdRecord[] decimalIdRecords = check from db:DecimalIdRecord decimalIdRecord in testEntitiesClient->/
    decimalidrecords.get(db:DecimalIdRecord)
        order by decimalIdRecord.id ascending select decimalIdRecord;
    test:assertEquals(decimalIdRecords, [decimalIdRecord1, decimalIdRecord2, decimalIdRecord3]);

    // read dependent
    DecimalIdRecordDependent[] decimalIdRecordsDependent = check from DecimalIdRecordDependent decimalIdRecord in 
    testEntitiesClient->/decimalidrecords.get(DecimalIdRecordDependent)
        order by decimalIdRecord.randomField ascending select decimalIdRecord;
    test:assertEquals(decimalIdRecordsDependent, [{randomField: decimalIdRecord1.randomField}, 
    {randomField: decimalIdRecord2.randomField}, {randomField: decimalIdRecord3.randomField}]);

    // update
    retrievedRecord1 = check testEntitiesClient->/decimalidrecords/
    [decimalIdRecord1.id].put({randomField: decimalIdRecord1Updated.randomField});
    test:assertEquals(decimalIdRecord1Updated, retrievedRecord1);
    retrievedRecord1 = check testEntitiesClient->/decimalidrecords/[decimalIdRecord1.id];
    test:assertEquals(decimalIdRecord1Updated, retrievedRecord1);

    // delete
    db:DecimalIdRecord retrievedRecord2 = check testEntitiesClient->/decimalidrecords/[decimalIdRecord2.id].delete();
    test:assertEquals(decimalIdRecord2, retrievedRecord2);
    decimalIdRecords = check from db:DecimalIdRecord decimalIdRecord in 
    testEntitiesClient->/decimalidrecords.get(db:DecimalIdRecord)
        order by decimalIdRecord.id ascending select decimalIdRecord;
    test:assertEquals(decimalIdRecords, [decimalIdRecord1Updated, decimalIdRecord3]);

    check testEntitiesClient.close();
}

@test:Config {
    groups: ["id-fields", "redis"],
    enable: false
}
function redisBooleanIdFieldTest() returns error? {
    db:Client testEntitiesClient = check new ();
    db:BooleanIdRecord booleanIdRecord1 = {
        id: true,
        randomField: "test1"
    };
    db:BooleanIdRecord booleanIdRecord2 = {
        id: false,
        randomField: "test2"
    };
    db:BooleanIdRecord booleanIdRecord1Updated = {
        id: true,
        randomField: "test1Updated"
    };

    // create
    boolean[] ids = check testEntitiesClient->/booleanidrecords.post([booleanIdRecord1, booleanIdRecord2]);
    test:assertEquals(ids, [booleanIdRecord1.id, booleanIdRecord2.id]);

    // read one
    db:BooleanIdRecord retrievedRecord1 = check testEntitiesClient->/booleanidrecords/[booleanIdRecord1.id];
    test:assertEquals(booleanIdRecord1, retrievedRecord1);

    // read one dependent
    BooleanIdRecordDependent retrievedRecord1Dependent = 
    check testEntitiesClient->/booleanidrecords/[booleanIdRecord1.id];
    test:assertEquals({randomField: booleanIdRecord1.randomField}, retrievedRecord1Dependent);

    // read
    db:BooleanIdRecord[] booleanIdRecords = check from db:BooleanIdRecord booleanIdRecord in 
    testEntitiesClient->/booleanidrecords.get(db:BooleanIdRecord)
        order by booleanIdRecord.randomField ascending select booleanIdRecord;
    test:assertEquals(booleanIdRecords, [booleanIdRecord1, booleanIdRecord2]);

    // read dependent
    BooleanIdRecordDependent[] booleanIdRecordsDependent = check from BooleanIdRecordDependent booleanIdRecord in 
    testEntitiesClient->/booleanidrecords.get(BooleanIdRecordDependent)
        select booleanIdRecord;
    test:assertEquals(booleanIdRecordsDependent, [{randomField: booleanIdRecord2.randomField}, 
    {randomField: booleanIdRecord1.randomField}]);

    // update
    retrievedRecord1 = check testEntitiesClient->/booleanidrecords/
    [booleanIdRecord1.id].put({randomField: booleanIdRecord1Updated.randomField});
    test:assertEquals(booleanIdRecord1Updated, retrievedRecord1);
    retrievedRecord1 = check testEntitiesClient->/booleanidrecords/[booleanIdRecord1.id];
    test:assertEquals(booleanIdRecord1Updated, retrievedRecord1);

    // delete
    db:BooleanIdRecord retrievedRecord2 = check testEntitiesClient->/booleanidrecords/[booleanIdRecord2.id].delete();
    test:assertEquals(booleanIdRecord2, retrievedRecord2);
    booleanIdRecords = check from db:BooleanIdRecord booleanIdRecord in 
    testEntitiesClient->/booleanidrecords.get(db:BooleanIdRecord)
        select booleanIdRecord;
    test:assertEquals(booleanIdRecords, [booleanIdRecord1Updated]);

    check testEntitiesClient.close();
}

@test:Config {
    groups: ["id-fields", "redis"],
    enable: false
}
function redisAllTypesIdFieldTest() returns error? {
    db:Client testEntitiesClient = check new ();
    db:AllTypesIdRecord allTypesIdRecord1 = {
        intType: 1,
        stringType: "id-1",
        floatType: 1.0,
        booleanType: true,
        decimalType: 1.1d,
        randomField: "test1"
    };
    db:AllTypesIdRecord allTypesIdRecord2 = {
        intType: 2,
        stringType: "id-2",
        floatType: 2.0,
        booleanType: false,
        decimalType: 2.2d,
        randomField: "test2"
    };
    db:AllTypesIdRecord allTypesIdRecord1Updated = {
        intType: 1,
        stringType: "id-1",
        floatType: 1.0,
        booleanType: true,
        decimalType: 1.1d,
        randomField: "test1Updated"
    };

    // create
    [boolean, int, float, decimal, string][] ids = 
    check testEntitiesClient->/alltypesidrecords.post([allTypesIdRecord1, allTypesIdRecord2]);
    test:assertEquals(ids, [
        [allTypesIdRecord1.booleanType, allTypesIdRecord1.intType, allTypesIdRecord1.floatType, 
        allTypesIdRecord1.decimalType, allTypesIdRecord1.stringType],
        [allTypesIdRecord2.booleanType, allTypesIdRecord2.intType, allTypesIdRecord2.floatType, 
        allTypesIdRecord2.decimalType, allTypesIdRecord2.stringType]
    ]);

    // read one
    db:AllTypesIdRecord retrievedRecord1 = check testEntitiesClient->/alltypesidrecords/[allTypesIdRecord1.booleanType]/
    [allTypesIdRecord1.intType]/[allTypesIdRecord1.floatType]/[allTypesIdRecord1.decimalType]/
    [allTypesIdRecord1.stringType];
    test:assertEquals(allTypesIdRecord1, retrievedRecord1);

    // read one dependent
    AllTypesIdRecordDependent retrievedRecord1Dependent = check testEntitiesClient->/alltypesidrecords/
    [allTypesIdRecord1.booleanType]/[allTypesIdRecord1.intType]/[allTypesIdRecord1.floatType]/
    [allTypesIdRecord1.decimalType]/[allTypesIdRecord1.stringType];
    test:assertEquals({randomField: allTypesIdRecord1.randomField}, retrievedRecord1Dependent);

    // read
    db:AllTypesIdRecord[] allTypesIdRecords = check from db:AllTypesIdRecord allTypesIdRecord in 
    testEntitiesClient->/alltypesidrecords.get(db:AllTypesIdRecord)
        select allTypesIdRecord;
    test:assertEquals(allTypesIdRecords, [allTypesIdRecord2, allTypesIdRecord1]);

    // read dependent
    AllTypesIdRecordDependent[] allTypesIdRecordsDependent = check from AllTypesIdRecordDependent allTypesIdRecord in 
    testEntitiesClient->/alltypesidrecords.get(AllTypesIdRecordDependent)
        select allTypesIdRecord;
    test:assertEquals(allTypesIdRecordsDependent, [{randomField: allTypesIdRecord2.randomField}, 
    {randomField: allTypesIdRecord1.randomField}]);

    // update
    retrievedRecord1 = check testEntitiesClient->/alltypesidrecords/[allTypesIdRecord1.booleanType]/
    [allTypesIdRecord1.intType]/[allTypesIdRecord1.floatType]/[allTypesIdRecord1.decimalType]/
    [allTypesIdRecord1.stringType].put({randomField: allTypesIdRecord1Updated.randomField});
    test:assertEquals(allTypesIdRecord1Updated, retrievedRecord1);
    retrievedRecord1 = check testEntitiesClient->/alltypesidrecords/[allTypesIdRecord1.booleanType]/
    [allTypesIdRecord1.intType]/[allTypesIdRecord1.floatType]/[allTypesIdRecord1.decimalType]/
    [allTypesIdRecord1.stringType];
    test:assertEquals(allTypesIdRecord1Updated, retrievedRecord1);

    // delete
    db:AllTypesIdRecord retrievedRecord2 = check testEntitiesClient->/alltypesidrecords/[allTypesIdRecord2.booleanType]/
    [allTypesIdRecord2.intType]/[allTypesIdRecord2.floatType]/[allTypesIdRecord2.decimalType]/
    [allTypesIdRecord2.stringType].delete();
    test:assertEquals(allTypesIdRecord2, retrievedRecord2);
    allTypesIdRecords = check from db:AllTypesIdRecord allTypesIdRecord in 
    testEntitiesClient->/alltypesidrecords.get(db:AllTypesIdRecord)
        select allTypesIdRecord;
    test:assertEquals(allTypesIdRecords, [allTypesIdRecord1Updated]);

    check testEntitiesClient.close();
}

@test:Config {
    groups: ["id-fields", "redis", "associations"],
    dependsOn: [redisAllTypesIdFieldTest],
    enable: false
}
function redisCompositeAssociationsTest() returns error? {
    db:Client testEntitiesClient = check new ();

    db:CompositeAssociationRecord compositeAssociationRecord1 = {
        id: "id-1",
        randomField: "test1",
        alltypesidrecordIntType: 1,
        alltypesidrecordStringType: "id-1",
        alltypesidrecordFloatType: 1.0,
        alltypesidrecordBooleanType: true,
        alltypesidrecordDecimalType: 1.10
    };

    db:CompositeAssociationRecord compositeAssociationRecord2 = {
        id: "id-2",
        randomField: "test2",
        alltypesidrecordIntType: 1,
        alltypesidrecordStringType: "id-1",
        alltypesidrecordFloatType: 1.0,
        alltypesidrecordBooleanType: true,
        alltypesidrecordDecimalType: 1.10
    };

    db:CompositeAssociationRecord compositeAssociationRecordUpdated1 = {
        id: "id-1",
        randomField: "test1Updated",
        alltypesidrecordIntType: 1,
        alltypesidrecordStringType: "id-1",
        alltypesidrecordFloatType: 1.0,
        alltypesidrecordBooleanType: true,
        alltypesidrecordDecimalType: 1.10
    };

    db:AllTypesIdRecordOptionalized allTypesIdRecord1 = {
        intType: 1,
        stringType: "id-1",
        floatType: 1.0,
        booleanType: true,
        decimalType: 1.10,
        randomField: "test1Updated"
    };

    // create
    string[] ids = check testEntitiesClient->/compositeassociationrecords.post([compositeAssociationRecord1, 
    compositeAssociationRecord2]);
    test:assertEquals(ids, [compositeAssociationRecord1.id, compositeAssociationRecord2.id]);

    // read one
    db:CompositeAssociationRecord retrievedRecord1 = 
    check testEntitiesClient->/compositeassociationrecords/[compositeAssociationRecord1.id];
    test:assertEquals(compositeAssociationRecord1, retrievedRecord1);

    // read one dependent
    CompositeAssociationRecordDependent retrievedRecord1Dependent = 
    check testEntitiesClient->/compositeassociationrecords/[compositeAssociationRecord1.id];
    test:assertEquals({
        randomField: compositeAssociationRecord1.randomField,
        alltypesidrecordIntType: compositeAssociationRecord1.alltypesidrecordIntType,
        alltypesidrecordDecimalType: compositeAssociationRecord1.alltypesidrecordDecimalType,
        allTypesIdRecord: {intType: allTypesIdRecord1.intType, stringType: allTypesIdRecord1.stringType, 
        booleanType: allTypesIdRecord1.booleanType, randomField: allTypesIdRecord1.randomField}
    }, retrievedRecord1Dependent);

    // read
    db:CompositeAssociationRecord[] compositeAssociationRecords = check from 
    db:CompositeAssociationRecord compositeAssociationRecord in 
    testEntitiesClient->/compositeassociationrecords.get(db:CompositeAssociationRecord)
        order by compositeAssociationRecord.id ascending select compositeAssociationRecord;
    test:assertEquals(compositeAssociationRecords, [compositeAssociationRecord1, compositeAssociationRecord2]);

    // read dependent
    CompositeAssociationRecordDependent[] compositeAssociationRecordsDependent = 
    check from CompositeAssociationRecordDependent compositeAssociationRecord in 
    testEntitiesClient->/compositeassociationrecords.get(CompositeAssociationRecordDependent)
        order by compositeAssociationRecord.randomField ascending select compositeAssociationRecord;
    test:assertEquals(compositeAssociationRecordsDependent, [
        {randomField: compositeAssociationRecord1.randomField, 
        alltypesidrecordIntType: compositeAssociationRecord1.alltypesidrecordIntType, 
        alltypesidrecordDecimalType: compositeAssociationRecord1.alltypesidrecordDecimalType, 
        allTypesIdRecord: {intType: allTypesIdRecord1.intType, stringType: allTypesIdRecord1.stringType, 
        booleanType: allTypesIdRecord1.booleanType, randomField: allTypesIdRecord1.randomField}},
        {randomField: compositeAssociationRecord2.randomField, 
        alltypesidrecordIntType: compositeAssociationRecord2.alltypesidrecordIntType, 
        alltypesidrecordDecimalType: compositeAssociationRecord2.alltypesidrecordDecimalType, 
        allTypesIdRecord: {intType: allTypesIdRecord1.intType, stringType: allTypesIdRecord1.stringType, 
        booleanType: allTypesIdRecord1.booleanType, randomField: allTypesIdRecord1.randomField}}
    ]);

    // update
    retrievedRecord1 = check testEntitiesClient->/compositeassociationrecords
    /[compositeAssociationRecord1.id].put({randomField: "test1Updated"});
    test:assertEquals(compositeAssociationRecordUpdated1, retrievedRecord1);
    retrievedRecord1 = check testEntitiesClient->/compositeassociationrecords/[compositeAssociationRecord1.id];
    test:assertEquals(compositeAssociationRecordUpdated1, retrievedRecord1);

    // delete
    db:CompositeAssociationRecord retrievedRecord2 = 
    check testEntitiesClient->/compositeassociationrecords/[compositeAssociationRecord2.id].delete();
    test:assertEquals(compositeAssociationRecord2, retrievedRecord2);
    compositeAssociationRecords = check from db:CompositeAssociationRecord compositeAssociationRecord in 
    testEntitiesClient->/compositeassociationrecords.get(db:CompositeAssociationRecord)
        select compositeAssociationRecord;
    test:assertEquals(compositeAssociationRecords, [compositeAssociationRecordUpdated1]);

    check testEntitiesClient.close();
}
