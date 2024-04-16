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
    groups: ["composite-key", "redis"]
}
function redisCompositeKeyCreateTest() returns error? {
    db:Client rainierClient = check new ();

    [string, string][] ids = check rainierClient->/orderitems.post([orderItem1, orderItem2]);
    test:assertEquals(ids, [[orderItem1.orderId, orderItem1.itemId], [orderItem2.orderId, orderItem2.itemId]]);

    db:OrderItem orderItemRetrieved = check rainierClient->/orderitems/[orderItem1.orderId]/[orderItem1.itemId];
    test:assertEquals(orderItemRetrieved, orderItem1);

    orderItemRetrieved = check rainierClient->/orderitems/[orderItem2.orderId]/[orderItem2.itemId];
    test:assertEquals(orderItemRetrieved, orderItem2);

    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyCreateTest]
}
function redisCompositeKeyCreateTestNegative() returns error? {
    db:Client rainierClient = check new ();

    [string, string][]|error ids = rainierClient->/orderitems.post([orderItem1]);
    if ids is persist:AlreadyExistsError {
        test:assertEquals(ids.message(), 
        "Record(s) already exist with the same key for the entity 'OrderItem'. Number of keys exists : 1");
    } else {
        test:assertFail("persist:AlreadyExistsError expected");
    }

    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyCreateTest]
}
function redisCompositeKeyReadManyTest() returns error? {
    db:Client rainierClient = check new ();

    stream<db:OrderItem, error?> orderItemStream = rainierClient->/orderitems;
    db:OrderItem[] orderitem = check from db:OrderItem orderItem in orderItemStream
        order by orderItem.orderId ascending select orderItem;

    test:assertEquals(orderitem, [orderItem1, orderItem2]);
    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyCreateTest]
}
function redisCompositeKeyReadOneTest() returns error? {
    db:Client rainierClient = check new ();
    db:OrderItem orderItem = check rainierClient->/orderitems/[orderItem1.orderId]/[orderItem1.itemId];
    test:assertEquals(orderItem, orderItem1);
    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key2"],
    dependsOn: [redisCompositeKeyCreateTest]
}
function redisCompositeKeyReadOneTest2() returns error? {
    db:Client rainierClient = check new ();
    db:OrderItem orderItem = check rainierClient->/orderitems/[orderItem1.orderId]/[orderItem1.itemId];
    test:assertEquals(orderItem, orderItem1);
    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyCreateTest]
}
function redisCompositeKeyReadOneTestNegative1() returns error? {
    db:Client rainierClient = check new ();
    db:OrderItem|error orderItem = rainierClient->/orderitems/["invalid-order-id"]/[orderItem1.itemId];

    if orderItem is persist:NotFoundError {
        test:assertEquals(orderItem.message(), 
        "A record with the key 'OrderItem:invalid-order-id:item-1' does not exist for the entity 'OrderItem'.");
    } else {
        test:assertFail("Error expected.");
    }

    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyCreateTest]
}
function redisCompositeKeyReadOneTestNegative2() returns error? {
    db:Client rainierClient = check new ();
    db:OrderItem|error orderItem = rainierClient->/orderitems/[orderItem1.orderId]/["invalid-item-id"];

    if orderItem is persist:NotFoundError {
        test:assertEquals(orderItem.message(), 
        "A record with the key 'OrderItem:order-1:invalid-item-id' does not exist for the entity 'OrderItem'.");
    } else {
        test:assertFail("Error expected.");
    }

    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyCreateTest, redisCompositeKeyReadOneTest, redisCompositeKeyReadManyTest, 
    redisCompositeKeyReadOneTest2]
}
function redisCompositeKeyUpdateTest() returns error? {
    db:Client rainierClient = check new ();

    db:OrderItem orderItem = check rainierClient->/orderitems/[orderItem2.orderId]/[orderItem2.itemId].put({
        quantity: orderItem2Updated.quantity,
        notes: orderItem2Updated.notes
    });
    test:assertEquals(orderItem, orderItem2Updated);

    orderItem = check rainierClient->/orderitems/[orderItem2.orderId]/[orderItem2.itemId];
    test:assertEquals(orderItem, orderItem2Updated);

    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyCreateTest, redisCompositeKeyReadOneTest, redisCompositeKeyReadManyTest, 
    redisCompositeKeyReadOneTest2]
}
function redisCompositeKeyUpdateTestNegative() returns error? {
    db:Client rainierClient = check new ();

    db:OrderItem|error orderItem = rainierClient->/orderitems/[orderItem1.orderId]/[orderItem2.itemId].put({
        quantity: 239,
        notes: "updated notes"
    });
    if orderItem is persist:NotFoundError {
        test:assertEquals(orderItem.message(), 
        "A record with the key 'OrderItem:order-1:item-2' does not exist for the entity 'OrderItem'.");
    } else {
        test:assertFail("Error expected.");
    }

    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyUpdateTest]
}
function redisCompositeKeyDeleteTest() returns error? {
    db:Client rainierClient = check new ();

    db:OrderItem orderItem = check rainierClient->/orderitems/[orderItem2.orderId]/[orderItem2.itemId].delete();
    test:assertEquals(orderItem, orderItem2Updated);

    db:OrderItem|error orderItemRetrieved = rainierClient->/orderitems/[orderItem2.orderId]/[orderItem2.itemId];
    test:assertTrue(orderItemRetrieved is persist:NotFoundError);

    check rainierClient.close();
}

@test:Config {
    groups: ["composite-key", "redis"],
    dependsOn: [redisCompositeKeyUpdateTest]
}
function redisCompositeKeyDeleteTestNegative() returns error? {
    db:Client rainierClient = check new ();

    db:OrderItem|error orderItem = rainierClient->/orderitems/["invalid-order-id"]/[orderItem2.itemId].delete();
    if orderItem is persist:NotFoundError {
        test:assertEquals(orderItem.message(), 
        "A record with the key 'OrderItem:invalid-order-id:item-2' does not exist for the entity 'OrderItem'.");
    } else {
        test:assertFail("Error expected.");
    }

    check rainierClient.close();
}
