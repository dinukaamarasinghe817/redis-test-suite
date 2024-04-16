// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/jballerina.java;
import ballerina/persist;
import ballerinax/persist.redis as predis;
import ballerinax/redis;

const PERSON = "people";
const APARTMENT = "apartments";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final redis:Client dbClient;

    private final map<predis:RedisClient> persistClients;

    private final record {|predis:RedisMetadata...;|} & readonly metadata = {
        [PERSON]: {
            entityName: "Person",
            collectionName: "Person",
            fieldMetadata: {
                id: {fieldName: "id", fieldDataType: predis:INT},
                name: {fieldName: "name", fieldDataType: predis:STRING},
                "soldBuildings[].code": {relation: {entityName: "soldBuildings", refField: "code", refFieldDataType: predis:STRING}},
                "soldBuildings[].city": {relation: {entityName: "soldBuildings", refField: "city", refFieldDataType: predis:STRING}},
                "soldBuildings[].state": {relation: {entityName: "soldBuildings", refField: "state", refFieldDataType: predis:STRING}},
                "soldBuildings[].country": {relation: {entityName: "soldBuildings", refField: "country", refFieldDataType: predis:STRING}},
                "soldBuildings[].postalCode": {relation: {entityName: "soldBuildings", refField: "postalCode", refFieldDataType: predis:STRING}},
                "soldBuildings[].type": {relation: {entityName: "soldBuildings", refField: "type", refFieldDataType: predis:STRING}},
                "soldBuildings[].soldpersonId": {relation: {entityName: "soldBuildings", refField: "soldpersonId", refFieldDataType: predis:INT}},
                "soldBuildings[].ownpersonId": {relation: {entityName: "soldBuildings", refField: "ownpersonId", refFieldDataType: predis:INT}},
                "ownBuildings[].code": {relation: {entityName: "ownBuildings", refField: "code", refFieldDataType: predis:STRING}},
                "ownBuildings[].city": {relation: {entityName: "ownBuildings", refField: "city", refFieldDataType: predis:STRING}},
                "ownBuildings[].state": {relation: {entityName: "ownBuildings", refField: "state", refFieldDataType: predis:STRING}},
                "ownBuildings[].country": {relation: {entityName: "ownBuildings", refField: "country", refFieldDataType: predis:STRING}},
                "ownBuildings[].postalCode": {relation: {entityName: "ownBuildings", refField: "postalCode", refFieldDataType: predis:STRING}},
                "ownBuildings[].type": {relation: {entityName: "ownBuildings", refField: "type", refFieldDataType: predis:STRING}},
                "ownBuildings[].soldpersonId": {relation: {entityName: "ownBuildings", refField: "soldpersonId", refFieldDataType: predis:INT}},
                "ownBuildings[].ownpersonId": {relation: {entityName: "ownBuildings", refField: "ownpersonId", refFieldDataType: predis:INT}}
            },
            keyFields: ["id"],
            refMetadata: {
                soldBuildings: {entity: Apartment, fieldName: "soldBuildings", refCollection: "Apartment", refFields: ["soldpersonId"], joinFields: ["id"], 'type: predis:MANY_TO_ONE},
                ownBuildings: {entity: Apartment, fieldName: "ownBuildings", refCollection: "Apartment", refFields: ["ownpersonId"], joinFields: ["id"], 'type: predis:MANY_TO_ONE}
            }
        },
        [APARTMENT]: {
            entityName: "Apartment",
            collectionName: "Apartment",
            fieldMetadata: {
                code: {fieldName: "code", fieldDataType: predis:STRING},
                city: {fieldName: "city", fieldDataType: predis:STRING},
                state: {fieldName: "state", fieldDataType: predis:STRING},
                country: {fieldName: "country", fieldDataType: predis:STRING},
                postalCode: {fieldName: "postalCode", fieldDataType: predis:STRING},
                'type: {fieldName: "type", fieldDataType: predis:STRING},
                soldpersonId: {fieldName: "soldpersonId", fieldDataType: predis:INT},
                ownpersonId: {fieldName: "ownpersonId", fieldDataType: predis:INT},
                "soldPerson.id": {relation: {entityName: "soldPerson", refField: "id", refFieldDataType: predis:INT}},
                "soldPerson.name": {relation: {entityName: "soldPerson", refField: "name", refFieldDataType: predis:STRING}},
                "ownPerson.id": {relation: {entityName: "ownPerson", refField: "id", refFieldDataType: predis:INT}},
                "ownPerson.name": {relation: {entityName: "ownPerson", refField: "name", refFieldDataType: predis:STRING}}
            },
            keyFields: ["code"],
            refMetadata: {
                soldPerson: {entity: Person, fieldName: "soldPerson", refCollection: "Person", refMetaDataKey: "soldBuildings", refFields: ["id"], joinFields: ["soldpersonId"], 'type: predis:ONE_TO_MANY},
                ownPerson: {entity: Person, fieldName: "ownPerson", refCollection: "Person", refMetaDataKey: "ownBuildings", refFields: ["id"], joinFields: ["ownpersonId"], 'type: predis:ONE_TO_MANY}
            }
        }
    };

    public isolated function init() returns persist:Error? {
        redis:Client|error dbClient = new (connectionConfig);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [PERSON]: check new (dbClient, self.metadata.get(PERSON), cacheConfig.maxAge),
            [APARTMENT]: check new (dbClient, self.metadata.get(APARTMENT), cacheConfig.maxAge)
        };
    }

    isolated resource function get people(PersonTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "query"
    } external;

    isolated resource function get people/[int id](PersonTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "queryOne"
    } external;

    isolated resource function post people(PersonInsert[] data) returns int[]|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(PERSON);
        }
        _ = check redisClient.runBatchInsertQuery(data);
        return from PersonInsert inserted in data
            select inserted.id;
    }

    isolated resource function put people/[int id](PersonUpdate value) returns Person|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(PERSON);
        }
        _ = check redisClient.runUpdateQuery(id, value);
        return self->/people/[id].get();
    }

    isolated resource function delete people/[int id]() returns Person|persist:Error {
        Person result = check self->/people/[id].get();
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(PERSON);
        }
        _ = check redisClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get apartments(ApartmentTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "query"
    } external;

    isolated resource function get apartments/[string code](ApartmentTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.redis.datastore.RedisProcessor",
        name: "queryOne"
    } external;

    isolated resource function post apartments(ApartmentInsert[] data) returns string[]|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(APARTMENT);
        }
        _ = check redisClient.runBatchInsertQuery(data);
        return from ApartmentInsert inserted in data
            select inserted.code;
    }

    isolated resource function put apartments/[string code](ApartmentUpdate value) returns Apartment|persist:Error {
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(APARTMENT);
        }
        _ = check redisClient.runUpdateQuery(code, value);
        return self->/apartments/[code].get();
    }

    isolated resource function delete apartments/[string code]() returns Apartment|persist:Error {
        Apartment result = check self->/apartments/[code].get();
        predis:RedisClient redisClient;
        lock {
            redisClient = self.persistClients.get(APARTMENT);
        }
        _ = check redisClient.runDeleteQuery(code);
        return result;
    }

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

