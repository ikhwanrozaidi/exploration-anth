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
      },
      {
        "uid": "d7430153-5839-4ed7-a4c8-a7644a230800",
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec"
      }
    ],



    "quantityTypes": [
      {
        "id": 16,
        "uid": "0cb99da0-f3fe-43c6-b3ce-45c9c5f1ce0e",
        "name": "Membersih Atas Jambatan - Memotong Rumput / Membersih Lubang Laluan Air / Vegetation",
        "code": "CLEAN_BRIDGE_TOP",
        "description": "Cleaning bridge top - grass cutting, clearing water passages and vegetation",
        "workScopeUID": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec",
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
        "id": 71,
        "uid": "c03a3554-c09d-4c54-995b-3e0330afd90b",
        "name": "Jenis",
        "code": "type",
        "fieldType": "DROPDOWN",
        "unit": null,
        "validationRules": null,
        "quantityTypeUID": "1fc5ef76-0a65-4b86-825a-fe3cf86cdc9f",
        "displayOrder": 1,
        "isRequired": true,
        "isForSegment": false,
        "defaultValue": null,
        "placeholder": null,
        "helpText": null
      },
      {
        "id": 72,
        "uid": "fe3814d7-a642-48e0-92d6-fd78f0988212",
        "name": "Saiz",
        "code": "size",
        "fieldType": "DECIMAL",
        "unit": "mm",
        "validationRules": null,
        "quantityTypeUID": "1fc5ef76-0a65-4b86-825a-fe3cf86cdc9f",
        "displayOrder": 2,
        "isRequired": true,
        "isForSegment": false,
        "defaultValue": null,
        "placeholder": null,
        "helpText": null
      },
     
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
      }
    ],

    "workEquipments": [],

    "workScopeEquipments": []
  }
}