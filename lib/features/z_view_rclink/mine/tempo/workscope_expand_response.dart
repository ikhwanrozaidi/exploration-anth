{
  "statusCode": 200,
  "message": "",
  "data": [

    {
      "id": 7,
      "uid": "889289f5-6b63-4405-99ec-57e47758ce29",
      "name": "General Work / Flying Squad",
      "code": "GW",
      "description": "General maintenance work and emergency response",
      "allowMultipleQuantities": true,
      "createdAt": "2025-09-16T18:17:04.239Z",
      "updatedAt": "2025-09-16T18:17:04.239Z",
      "deletedAt": null,
      "companyID": 1,
      "workQuantityTypes": [],
      "workEquipments": [
        {
          "id": 2,
          "uid": "159020c0-bdda-40f4-abdd-5b380c4c1e08",
          "name": "Lorry 1 Ton",
          "code": "LORRY_1T"
        },
        {
          "id": 5,
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c",
          "name": "Blower",
          "code": "BLOWER"
        },
        {
          "id": 8,
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7",
          "name": "Penyapu",
          "code": "BROOM"
        }
      ]
    },

    {
      "id": 1,
      "uid": "12d3908e-973f-4ccc-a321-598b18b804dc",
      "name": "Pavement / Patching Potholes",
      "code": "R01",
      "description": "Road pavement maintenance and pothole patching works",
      "allowMultipleQuantities": true,
      "createdAt": "2025-09-16T18:17:03.982Z",
      "updatedAt": "2025-09-16T18:17:03.982Z",
      "deletedAt": null,
      "companyID": 1,


      "workQuantityTypes": [
        
        {
          "id": 1,
          "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
          "name": "Pothole - Hotmix",
          "code": "POTHOLE_HOTMIX",
          "displayOrder": 1,
          "hasSegmentBreakdown": false,
          "segmentSize": null,
          "maxSegmentLength": null,
          "quantityFields": [
            {
              "id": 1,
              "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
              "name": "Arah",
              "code": "direction",
              "fieldType": "DROPDOWN",
              "unit": null,
              "validationRules": null,
              "displayOrder": 1,
              "isRequired": true,
              "isForSegment": false,
              "defaultValue": null,
              "placeholder": null,
              "helpText": null,
              "dropdownOptions": [
                {
                  "id": 1,
                  "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                  "value": "LHS",
                  "displayOrder": 1
                },
                {
                  "id": 2,
                  "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                  "value": "RHS",
                  "displayOrder": 2
                }
              ]
            },
            {
              "id": 2,
              "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
              "name": "Cara Tampalan",
              "code": "patching_method",
              "fieldType": "DROPDOWN",
              "unit": null,
              "validationRules": null,
              "displayOrder": 2,
              "isRequired": true,
              "isForSegment": false,
              "defaultValue": null,
              "placeholder": null,
              "helpText": null,
              "dropdownOptions": [
                {
                  "id": 3,
                  "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                  "value": "Potong",
                  "displayOrder": 1
                },
                {
                  "id": 4,
                  "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                  "value": "Tidak Potong",
                  "displayOrder": 2
                }
              ]
            }
          ]
        },



        {
          "id": 2,
          "uid": "09571782-45f7-4205-8eb6-060c327bab1c",
          "name": "Crack Sealing",
          "code": "CRACK_SEALING",
          "displayOrder": 2,
          "hasSegmentBreakdown": false,
          "segmentSize": null,
          "maxSegmentLength": null,
          "quantityFields": [
            {
              "id": 7,
              "uid": "929f1391-b338-4f44-88ba-e201e5377aab",
              "name": "Arah",
              "code": "direction",
              "fieldType": "DROPDOWN",
              "unit": null,
              "validationRules": null,
              "displayOrder": 1,
              "isRequired": true,
              "isForSegment": false,
              "defaultValue": null,
              "placeholder": null,
              "helpText": null,
              "dropdownOptions": [
                {
                  "id": 5,
                  "uid": "0515b64f-9585-4e41-998c-b76727dfa582",
                  "value": "LHS",
                  "displayOrder": 1
                },
                {
                  "id": 6,
                  "uid": "83001038-60a7-4fe1-91c0-3353873d62ce",
                  "value": "RHS",
                  "displayOrder": 2
                }
              ]
            },
            {
              "id": 8,
              "uid": "8dc9fd2a-f7aa-493a-86e0-61d7ef5a488e",
              "name": "Panjang",
              "code": "length",
              "fieldType": "DECIMAL",
              "unit": "m",
              "validationRules": null,
              "displayOrder": 2,
              "isRequired": true,
              "isForSegment": false,
              "defaultValue": null,
              "placeholder": null,
              "helpText": null,
              "dropdownOptions": []
            },
            {
              "id": 9,
              "uid": "8d3fcd66-8969-4610-8f96-5c05878c9c4f",
              "name": "Lebar",
              "code": "width",
              "fieldType": "DECIMAL",
              "unit": "m",
              "validationRules": null,
              "displayOrder": 3,
              "isRequired": true,
              "isForSegment": false,
              "defaultValue": null,
              "placeholder": null,
              "helpText": null,
              "dropdownOptions": []
            },
            {
              "id": 10,
              "uid": "f80c286e-665e-4a7c-b271-6e7c818c629c",
              "name": "C.Sealant",
              "code": "sealant",
              "fieldType": "DECIMAL",
              "unit": "liter",
              "validationRules": null,
              "displayOrder": 4,
              "isRequired": false,
              "isForSegment": false,
              "defaultValue": null,
              "placeholder": null,
              "helpText": null,
              "dropdownOptions": []
            },
            {
              "id": 11,
              "uid": "82d5348c-5b22-48b1-bf13-167d34780343",
              "name": "Quary Dust / Pasir",
              "code": "quarry_dust",
              "fieldType": "DECIMAL",
              "unit": "kg",
              "validationRules": null,
              "displayOrder": 5,
              "isRequired": false,
              "isForSegment": false,
              "defaultValue": null,
              "placeholder": null,
              "helpText": null,
              "dropdownOptions": []
            }
          ]
        },
      ],



      "workEquipments": [
        {
          "id": 1,
          "uid": "f6953c02-b0fd-4b12-8d93-20cc8d692f44",
          "name": "Lorry 3 Ton",
          "code": "LORRY_3T"
        },
        {
          "id": 2,
          "uid": "159020c0-bdda-40f4-abdd-5b380c4c1e08",
          "name": "Lorry 1 Ton",
          "code": "LORRY_1T"
        },
        {
          "id": 3,
          "uid": "3c2a2eb7-c711-4317-83e4-224e2029d587",
          "name": "Pavement Cutter",
          "code": "PAVEMENT_CUTTER"
        }
      ]
    },
  ],
  "meta": {
    "page": 1,
    "limit": 8,
    "totalCount": 8,
    "totalPages": 1,
    "hasNext": false,
    "hasPrev": false
  }
}