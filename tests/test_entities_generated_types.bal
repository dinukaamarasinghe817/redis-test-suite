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
// import ballerina/time;
// import Test_Suite.db;

// public enum EnumType {
//     TYPE_1,
//     TYPE_2,
//     TYPE_3,
//     TYPE_4
// }

// public enum OrderType {
//     ONLINE,
//     INSTORE
// }

// public type AllTypes record {|
//     readonly int id;
//     boolean booleanType;
//     int intType;
//     float floatType;
//     decimal decimalType;
//     string stringType;
//     time:Date dateType;
//     time:TimeOfDay timeOfDayType;
//     time:Utc utcType;
//     time:Civil civilType;
//     EnumType enumType;
//     boolean booleanTypeOptional?;
//     int intTypeOptional?;
//     float floatTypeOptional?;
//     decimal decimalTypeOptional?;
//     string stringTypeOptional?;
//     time:Date dateTypeOptional?;
//     time:TimeOfDay timeOfDayTypeOptional?;
//     time:Utc utcTypeOptional?;
//     time:Civil civilTypeOptional?;
//     EnumType enumTypeOptional?;
// |};

// public type AllTypesOptionalized record {|
//     int id?;
//     boolean booleanType?;
//     int intType?;
//     float floatType?;
//     decimal decimalType?;
//     string stringType?;
//     time:Date dateType?;
//     time:TimeOfDay timeOfDayType?;
//     time:Utc utcType?;
//     time:Civil civilType?;
//     EnumType enumType?;
//     boolean booleanTypeOptional?;
//     int intTypeOptional?;
//     float floatTypeOptional?;
//     decimal decimalTypeOptional?;
//     string stringTypeOptional?;
//     time:Date dateTypeOptional?;
//     time:TimeOfDay timeOfDayTypeOptional?;
//     time:Utc utcTypeOptional?;
//     time:Civil civilTypeOptional?;
//     EnumType enumTypeOptional?;
// |};

// public type AllTypesTargetType typedesc<AllTypesOptionalized>;

// public type AllTypesInsert AllTypes;

// public type AllTypesUpdate record {|
//     boolean booleanType?;
//     int intType?;
//     float floatType?;
//     decimal decimalType?;
//     string stringType?;
//     time:Date dateType?;
//     time:TimeOfDay timeOfDayType?;
//     time:Utc utcType?;
//     time:Civil civilType?;
//     EnumType enumType?;
//     boolean booleanTypeOptional?;
//     int intTypeOptional?;
//     float floatTypeOptional?;
//     decimal decimalTypeOptional?;
//     string stringTypeOptional?;
//     time:Date dateTypeOptional?;
//     time:TimeOfDay timeOfDayTypeOptional?;
//     time:Utc utcTypeOptional?;
//     time:Civil civilTypeOptional?;
//     EnumType enumTypeOptional?;
// |};

// public type StringIdRecord record {|
//     readonly string id;
//     string randomField;
// |};

// public type StringIdRecordOptionalized record {|
//     string id?;
//     string randomField?;
// |};

// public type StringIdRecordTargetType typedesc<StringIdRecordOptionalized>;

// public type StringIdRecordInsert StringIdRecord;

// public type StringIdRecordUpdate record {|
//     string randomField?;
// |};

// public type IntIdRecord record {|
//     readonly int id;
//     string randomField;
// |};

// public type IntIdRecordOptionalized record {|
//     int id?;
//     string randomField?;
// |};

// public type IntIdRecordTargetType typedesc<IntIdRecordOptionalized>;

// public type IntIdRecordInsert IntIdRecord;

// public type IntIdRecordUpdate record {|
//     string randomField?;
// |};

// public type FloatIdRecord record {|
//     readonly float id;
//     string randomField;
// |};

// public type FloatIdRecordOptionalized record {|
//     float id?;
//     string randomField?;
// |};

// public type FloatIdRecordTargetType typedesc<FloatIdRecordOptionalized>;

// public type FloatIdRecordInsert FloatIdRecord;

// public type FloatIdRecordUpdate record {|
//     string randomField?;
// |};

// public type DecimalIdRecord record {|
//     readonly decimal id;
//     string randomField;
// |};

// public type DecimalIdRecordOptionalized record {|
//     decimal id?;
//     string randomField?;
// |};

// public type DecimalIdRecordTargetType typedesc<DecimalIdRecordOptionalized>;

// public type DecimalIdRecordInsert DecimalIdRecord;

// public type DecimalIdRecordUpdate record {|
//     string randomField?;
// |};

// public type BooleanIdRecord record {|
//     readonly boolean id;
//     string randomField;
// |};

// public type BooleanIdRecordOptionalized record {|
//     boolean id?;
//     string randomField?;
// |};

// public type BooleanIdRecordTargetType typedesc<BooleanIdRecordOptionalized>;

// public type BooleanIdRecordInsert BooleanIdRecord;

// public type BooleanIdRecordUpdate record {|
//     string randomField?;
// |};

// public type CompositeAssociationRecord record {|
//     readonly string id;
//     string randomField;
//     boolean alltypesidrecordBooleanType;
//     int alltypesidrecordIntType;
//     float alltypesidrecordFloatType;
//     decimal alltypesidrecordDecimalType;
//     string alltypesidrecordStringType;
// |};

// public type CompositeAssociationRecordOptionalized record {|
//     string id?;
//     string randomField?;
//     boolean alltypesidrecordBooleanType?;
//     int alltypesidrecordIntType?;
//     float alltypesidrecordFloatType?;
//     decimal alltypesidrecordDecimalType?;
//     string alltypesidrecordStringType?;
// |};

// public type CompositeAssociationRecordWithRelations record {|
//     *CompositeAssociationRecordOptionalized;
//     AllTypesIdRecordOptionalized allTypesIdRecord?;
// |};

// public type CompositeAssociationRecordTargetType typedesc<CompositeAssociationRecordWithRelations>;

// public type CompositeAssociationRecordInsert CompositeAssociationRecord;

// public type CompositeAssociationRecordUpdate record {|
//     string randomField?;
//     boolean alltypesidrecordBooleanType?;
//     int alltypesidrecordIntType?;
//     float alltypesidrecordFloatType?;
//     decimal alltypesidrecordDecimalType?;
//     string alltypesidrecordStringType?;
// |};

// public type AllTypesIdRecord record {|
//     readonly boolean booleanType;
//     readonly int intType;
//     readonly float floatType;
//     readonly decimal decimalType;
//     readonly string stringType;
//     string randomField;
// |};

// public type AllTypesIdRecordOptionalized record {|
//     boolean booleanType?;
//     int intType?;
//     float floatType?;
//     decimal decimalType?;
//     string stringType?;
//     string randomField?;
// |};

// public type AllTypesIdRecordWithRelations record {|
//     *AllTypesIdRecordOptionalized;
//     CompositeAssociationRecordOptionalized compositeAssociationRecord?;
// |};

// public type AllTypesIdRecordTargetType typedesc<AllTypesIdRecordWithRelations>;

// public type AllTypesIdRecordInsert AllTypesIdRecord;

// public type AllTypesIdRecordUpdate record {|
//     string randomField?;
// |};

// public type OrderItemExtended record {|
//     readonly string orderId;
//     readonly string itemId;
//     int CustomerId;
//     boolean paid;
//     float ammountPaid;
//     decimal ammountPaidDecimal;
//     time:Date arivalTimeDate;
//     time:TimeOfDay arivalTimeTimeOfDay;
//     db:OrderType orderType;
// |};

// public type OrderItemExtendedOptionalized record {|
//     string orderId?;
//     string itemId?;
//     int CustomerId?;
//     boolean paid?;
//     float ammountPaid?;
//     decimal ammountPaidDecimal?;
//     time:Date arivalTimeDate?;
//     time:TimeOfDay arivalTimeTimeOfDay?;
//     OrderType orderType?;
// |};

// public type OrderItemExtendedTargetType typedesc<OrderItemExtendedOptionalized>;

// public type OrderItemExtendedInsert OrderItemExtended;

// public type OrderItemExtendedUpdate record {|
//     int CustomerId?;
//     boolean paid?;
//     float ammountPaid?;
//     decimal ammountPaidDecimal?;
//     time:Date arivalTimeDate?;
//     time:TimeOfDay arivalTimeTimeOfDay?;
//     OrderType orderType?;
// |};

// public type Person record {|
//     readonly int id;
//     string name;

// |};

// public type PersonOptionalized record {|
//     int id?;
//     string name?;
// |};

// public type PersonWithRelations record {|
//     *PersonOptionalized;
//     ApartmentOptionalized[] soldBuildings?;
//     ApartmentOptionalized[] ownBuildings?;
// |};

// public type PersonTargetType typedesc<PersonWithRelations>;

// public type PersonInsert Person;

// public type PersonUpdate record {|
//     string name?;
// |};

// public type Apartment record {|
//     readonly string code;
//     string city;
//     string state;
//     string country;
//     string postalCode;
//     string 'type;
//     int soldpersonId;
//     int ownpersonId;
// |};

// public type ApartmentOptionalized record {|
//     string code?;
//     string city?;
//     string state?;
//     string country?;
//     string postalCode?;
//     string 'type?;
//     int soldpersonId?;
//     int ownpersonId?;
// |};

// public type ApartmentWithRelations record {|
//     *ApartmentOptionalized;
//     PersonOptionalized soldPerson?;
//     PersonOptionalized ownPerson?;
// |};

// public type ApartmentTargetType typedesc<ApartmentWithRelations>;

// public type ApartmentInsert Apartment;

// public type ApartmentUpdate record {|
//     string city?;
//     string state?;
//     string country?;
//     string postalCode?;
//     string 'type?;
//     int soldpersonId?;
//     int ownpersonId?;
// |};
