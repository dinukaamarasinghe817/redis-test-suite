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

import ballerina/persist;
import ballerina/test;
import Test_Suite.db;

@test:Config {
    groups: ["department", "redis"]
}
function redisDepartmentCreateTest() returns error? {
    db:Client rainierClient = check new ();

    string[] deptNos = check rainierClient->/departments.post([department1]);
    test:assertEquals(deptNos, [department1.deptNo]);

    db:Department departmentRetrieved = check rainierClient->/departments/[department1.deptNo];
    test:assertEquals(departmentRetrieved, department1);
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"]
}
function redisDepartmentCreateTest2() returns error? {
    db:Client rainierClient = check new ();

    string[] deptNos = check rainierClient->/departments.post([department2, department3]);

    test:assertEquals(deptNos, [department2.deptNo, department3.deptNo]);

    db:Department departmentRetrieved = check rainierClient->/departments/[department2.deptNo];
    test:assertEquals(departmentRetrieved, department2);

    departmentRetrieved = check rainierClient->/departments/[department3.deptNo];
    test:assertEquals(departmentRetrieved, department3);
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"],
    dependsOn: [redisDepartmentCreateTest]
}
function redisDepartmentReadOneTest() returns error? {
    db:Client rainierClient = check new ();

    db:Department departmentRetrieved = check rainierClient->/departments/[department1.deptNo];
    test:assertEquals(departmentRetrieved, department1);
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"],
    dependsOn: [redisDepartmentCreateTest]
}
function redisDepartmentReadOneTestNegative() returns error? {
    db:Client rainierClient = check new ();

    db:Department|error departmentRetrieved = rainierClient->/departments/["invalid-department-id"];
    if departmentRetrieved is persist:NotFoundError {
        test:assertEquals(departmentRetrieved.message(), 
        "A record with the key 'Department:invalid-department-id' does not exist for the entity 'Department'.");
    } else {
        test:assertFail("NotFoundError expected.");
    }
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"],
    dependsOn: [redisDepartmentCreateTest, redisDepartmentCreateTest2]
}
function redisDepartmentReadManyTest() returns error? {
    db:Client rainierClient = check new ();
    stream<db:Department, error?> departmentStream = rainierClient->/departments;
    db:Department[] departments = check from db:Department department in departmentStream
        order by department.deptNo ascending select department;

    test:assertEquals(departments, [department1, department2, department3]);
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis", "dependent"],
    dependsOn: [redisDepartmentCreateTest, redisDepartmentCreateTest2]
}
function redisDepartmentReadManyTestDependent() returns error? {
    db:Client rainierClient = check new ();

    stream<DepartmentInfo2, persist:Error?> departmentStream = rainierClient->/departments;
    DepartmentInfo2[] departments = check from DepartmentInfo2 department in departmentStream
        order by department.deptName ascending select department;

    test:assertEquals(departments, [
        {deptName: department3.deptName},
        {deptName: department1.deptName},
        {deptName: department2.deptName}
    ]);
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"],
    dependsOn: [redisDepartmentReadOneTest, redisDepartmentReadManyTest, redisDepartmentReadManyTestDependent]
}
function redisDepartmentUpdateTest() returns error? {
    db:Client rainierClient = check new ();

    db:Department department = check rainierClient->/departments/[department1.deptNo].put({
        deptName: "Finance & Legalities"
    });

    test:assertEquals(department, updatedDepartment1);

    db:Department departmentRetrieved = check rainierClient->/departments/[department1.deptNo];
    test:assertEquals(departmentRetrieved, updatedDepartment1);
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"],
    dependsOn: [redisDepartmentReadOneTest, redisDepartmentReadManyTest, redisDepartmentReadManyTestDependent]
}
function redisDepartmentUpdateTestNegative1() returns error? {
    db:Client rainierClient = check new ();

    db:Department|error department = rainierClient->/departments/["invalid-department-id"].put({
        deptName: "Human Resources"
    });

    if department is persist:NotFoundError {
        test:assertEquals(department.message(), 
        "A record with the key 'Department:invalid-department-id' does not exist for the entity 'Department'.");
    } else {
        test:assertFail("NotFoundError expected.");
    }
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"],
    dependsOn: [redisDepartmentUpdateTest]
}
function redisDepartmentDeleteTest() returns error? {
    db:Client rainierClient = check new ();

    db:Department department = check rainierClient->/departments/[department1.deptNo].delete();
    test:assertEquals(department, updatedDepartment1);

    stream<db:Department, error?> departmentStream = rainierClient->/departments;
    db:Department[] departments = check from db:Department department2 in departmentStream
        order by department2.deptNo ascending select department2;

    test:assertEquals(departments, [department2, department3]);
    check rainierClient.close();
}

@test:Config {
    groups: ["department", "redis"],
    dependsOn: [redisDepartmentDeleteTest]
}
function redisDepartmentDeleteTestNegative() returns error? {
    db:Client rainierClient = check new ();

    db:Department|error department = rainierClient->/departments/[department1.deptNo].delete();

    if department is persist:NotFoundError {
        test:assertEquals(department.message(), 
        string `A record with the key 'Department:${department1.deptNo}' does not exist for the entity 'Department'.`);
    } else {
        test:assertFail("NotFoundError expected.");
    }
    check rainierClient.close();
}
