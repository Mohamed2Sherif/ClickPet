# Database Schemas for NoSQL (MongoDB)

## 1. PetOwner Collection

```json
{
    "_id": ObjectId("auto_generated_id"),
    "name": "string",
    "phoneNumber": "string",
    "pets": [
        {

        }
    ]
}
```

## 2. User Collection (Doctor/Admin)

```json
{
    "_id": ObjectId("user_id"),
    "firstName": "string",
    "lastName": "string",
    "userName": "string",
    "email": "string",
    "phoneNumber": "string",
    "emailConfirmed": "boolean",
    "authenticityConfirmed": "boolean",
    "roles": [
            "roleName": "string"
    ]
}
```

## 3. Pet Collection

```json
 "petId": ObjectId("pet_id"),
            "petName": "string",
            "petAge": "int",
            "petGender": "string",
            "favoriteDryFood": "string",
            "favoriteSandType": "string",
            "weight": "decimal",
            "petTypeProperties":
                {
                    "typeId": ObjectId("type_id"),
                    "typeName": "string",
                    "barking/rate":"decimal"
                }

```

## 4. Visit Collection

```json
{
    "_id": ObjectId("visit_id"),
    "ownerId": ObjectId("owner_id"),
    "petId": ObjectId("pet_id"),
    "doctorId": ObjectId("doctor_id"),
    "VisitDate": "DateTime",
    "problem": "string",
    "vaccination": {
        "vaccinationId": ObjectId("vaccination_id"),
        "vaccinationName": "string",
        "petType": {
            "typeId": ObjectId("type_id"),
            "typeName": "string"
        }
    },
    "notes": "string",
    "scheduled": "boolean"
}
```

## 5. Vaccination Collection

```json
{
    "_id": ObjectId("vaccination_id"),
    "vaccinationName": "string",
    "petType": {
        "typeId": ObjectId("type_id"),
        "typeName": "string"
    }
}
```

## 6. PetTypes Collection

```json
{
    "_id": ObjectId("type_id"),
    "typeName": "string"
}
```
