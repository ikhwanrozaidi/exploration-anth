{
  "statusCode": 200,
  "message": "",
  "data": {

    "package": {
      "id": 1,
      "uid": "3e4e818b-06ea-44de-8d1f-a61d1c930386",
      "name": "Test-Package-1",
      "description": "Road maintenance work covering northern highways",
      "createdAt": "2025-10-23T08:31:49.559Z",
      "updatedAt": "2025-10-23T08:31:49.559Z"
    },

    "workScopes": [
      {
        "id": 3,
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2",
        "name": "Grass Cutting",
        "code": "R03",
        "description": "Grass cutting and vegetation management",
        "allowMultipleQuantities": true
      },
      {
        "id": 4,
        "uid": "d0819f60-5be7-4ae9-bccd-00f37f799491",
        "name": "Cleaning Road Furnitures",
        "code": "R04",
        "description": "Cleaning and maintenance of road furniture (signs, barriers, etc.)",
        "allowMultipleQuantities": true
      },
      {
        "id": 5,
        "uid": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
        "name": "Cleaning Culverts & Bridge",
        "code": "R05",
        "description": "Cleaning and maintenance of culverts and bridges",
        "allowMultipleQuantities": true
      }
    ],

    "packageWorkScopes": [
      {
        "uid": "a61f9eb4-2fb1-4cf8-b46b-6fb44fa21082",
        "workScopeUID": "c603b5bc-7325-464d-85d6-5d71331543b2"
      },
      {
        "uid": "86f5d6c8-9a6b-4ded-9681-6630f8218ead",
        "workScopeUID": "d0819f60-5be7-4ae9-bccd-00f37f799491"
      }
    ],

    "quantityTypes": [
      {
        "id": 10,
        "uid": "33b372a1-16c9-413a-a620-c9d558d6ff27",
        "name": "Memotong Rumput",
        "code": "GRASS_CUTTING",
        "description": "Grass cutting work",
        "workScopeUID": "c603b5bc-7325-464d-85d6-5d71331543b2",
        "displayOrder": 1,
        "hasSegmentBreakdown": false,
        "segmentSize": null,
        "maxSegmentLength": null
      },
      {
        "id": 17,
        "uid": "1fc5ef76-0a65-4b86-825a-fe3cf86cdc9f",
        "name": "Membersih Pembetong",
        "code": "CLEAN_CULVERT",
        "description": "Cleaning culverts",
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
        "displayOrder": 2,
        "hasSegmentBreakdown": false,
        "segmentSize": null,
        "maxSegmentLength": null
      },
      {
        "id": 18,
        "uid": "2887412e-56d9-4c55-b1e7-c135698f3d57",
        "name": "Membersih Bawah Jambatan - Memotong Rumput / Membersih halangan laluan air",
        "code": "CLEAN_BRIDGE_BOTTOM",
        "description": "Cleaning under bridge - grass cutting and clearing water passage obstructions",
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
        "displayOrder": 3,
        "hasSegmentBreakdown": false,
        "segmentSize": null,
        "maxSegmentLength": null
      }
    ],


    "quantityFields": [
      {
        "id": 52,
        "uid": "c7a09e4d-196e-4777-823e-ceea3ab0f80d",
        "name": "Arah",
        "code": "direction",
        "fieldType": "DROPDOWN",
        "unit": null,
        "validationRules": null,
        "quantityTypeUID": "33b372a1-16c9-413a-a620-c9d558d6ff27",
        "displayOrder": 1,
        "isRequired": true,
        "isForSegment": false,
        "defaultValue": null,
        "placeholder": null,
        "helpText": null
      },
      {
        "id": 74,
        "uid": "70f454a2-9589-43dd-bca4-85840e615329",
        "name": "Panjang",
        "code": "length",
        "fieldType": "DECIMAL",
        "unit": "m",
        "validationRules": null,
        "quantityTypeUID": "2887412e-56d9-4c55-b1e7-c135698f3d57",
        "displayOrder": 1,
        "isRequired": true,
        "isForSegment": false,
        "defaultValue": null,
        "placeholder": null,
        "helpText": null
      },
      {
        "id": 75,
        "uid": "933d93fc-f1e4-4b14-827a-ea17e9813b20",
        "name": "Lebar",
        "code": "width",
        "fieldType": "DECIMAL",
        "unit": "m",
        "validationRules": null,
        "quantityTypeUID": "2887412e-56d9-4c55-b1e7-c135698f3d57",
        "displayOrder": 2,
        "isRequired": true,
        "isForSegment": false,
        "defaultValue": null,
        "placeholder": null,
        "helpText": null
      }
    ],


    "fieldOptions": [
      {
        "id": 32,
        "uid": "125196a2-8321-49ba-9634-944a140224d2",
        "value": "LHS",
        "quantityFieldUID": "c7a09e4d-196e-4777-823e-ceea3ab0f80d",
        "displayOrder": 1
      },
      {
        "id": 33,
        "uid": "dee16bf6-8e7b-45cf-be19-40814f65e84c",
        "value": "M",
        "quantityFieldUID": "c7a09e4d-196e-4777-823e-ceea3ab0f80d",
        "displayOrder": 2
      },
      {
        "id": 34,
        "uid": "ebfa8fdf-e687-49c8-a51f-84630a4ec384",
        "value": "RHS",
        "quantityFieldUID": "c7a09e4d-196e-4777-823e-ceea3ab0f80d",
        "displayOrder": 3
      },
      {
        "id": 51,
        "uid": "1b06c0ce-7cde-419a-adff-5b2e06496bec",
        "value": "TWIN BCR",
        "quantityFieldUID": "c03a3554-c09d-4c54-995b-3e0330afd90b",
        "displayOrder": 6
      }
    ],


    "workEquipments": [
      {
        "id": 5,
        "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c",
        "name": "Blower",
        "code": "BLOWER"
      },
      {
        "id": 29,
        "uid": "f0ea92c2-2b78-46dc-b754-e256d7619fc8",
        "name": "Span",
        "code": "SPONGE"
      },
      {
        "id": 30,
        "uid": "eff37fb4-6feb-4d26-af82-01bc0ae8e02f",
        "name": "Water Jet",
        "code": "WATER_JET"
      },
      {
        "id": 31,
        "uid": "7f59c31d-a929-4708-af04-d6f1eedcfd83",
        "name": "Tangki Air",
        "code": "WATER_TANK"
      },
      {
        "id": 32,
        "uid": "e2b434c6-e0b6-432b-88a0-f664fe9c601c",
        "name": "Baldi",
        "code": "BUCKET"
      },
      {
        "id": 33,
        "uid": "b79db221-7467-46c9-bae0-9421f03de426",
        "name": "Tangga",
        "code": "LADDER"
      }
    ],


    "workScopeEquipments": [
      {
        "workScopeUID": "c603b5bc-7325-464d-85d6-5d71331543b2",
        "workEquipmentUID": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
      },
      {
        "workScopeUID": "c603b5bc-7325-464d-85d6-5d71331543b2",
        "workEquipmentUID": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
      },
      {
        "workScopeUID": "c603b5bc-7325-464d-85d6-5d71331543b2",
        "workEquipmentUID": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
      },
      {
        "workScopeUID": "c603b5bc-7325-464d-85d6-5d71331543b2",
        "workEquipmentUID": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
      },
      {
        "workScopeUID": "d0819f60-5be7-4ae9-bccd-00f37f799491",
        "workEquipmentUID": "e2b434c6-e0b6-432b-88a0-f664fe9c601c"
      },
      {
        "workScopeUID": "d0819f60-5be7-4ae9-bccd-00f37f799491",
        "workEquipmentUID": "b79db221-7467-46c9-bae0-9421f03de426"
      },
      {
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
        "workEquipmentUID": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
      },
      {
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
        "workEquipmentUID": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
      },
      {
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
        "workEquipmentUID": "bfc9a264-6cea-438c-ad58-e44c361839ff"
      },
      {
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
        "workEquipmentUID": "f7d52d68-6780-4897-8003-fe8dde11e0dc"
      }
    ]
  }
}