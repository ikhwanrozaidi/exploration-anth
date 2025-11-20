{
  "statusCode": 200,
  "message": "",
  "data": [
    {
      "id": 1,
      "uid": "91fea1cb-3468-49a6-9402-54cad06dea60",
      "name": "Road Furniture Cleaning - MRR2 Gombak",
      "notes": "Regular maintenance cleaning of guardrails, signboards, and kilometer posts along MRR2",
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 4,
      "roadID": 127,
      "totalWorkers": 10,
      "fromSection": "56",
      "toSection": "56",
      "longitude": "101.7414991",
      "latitude": "3.1307736",
      "createdByID": 1,
      "createdAt": "2025-09-22T20:01:55.752Z",
      "updatedAt": "2025-10-06T22:16:47.136Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Road Furnitures",
        "code": "R04",
        "uid": "d0819f60-5be7-4ae9-bccd-00f37f799491"
      },
      "road": {
        "id": 127,
        "uid": "fcceafd1-114f-4d8b-b263-13eee8544746",
        "name": "MRR2 - GREEN WOOD KE SRI GOMBAK",
        "roadNo": "FT0028",
        "districtID": 6,
        "district": {
          "id": 6,
          "name": "Gombak",
          "uid": "73e4465e-cc94-4a84-82f4-8bb83162040a",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry 3 Ton",
          "uid": "f6953c02-b0fd-4b12-8d93-20cc8d692f44"
        },
        {
          "name": "Lorry 1 Ton",
          "uid": "159020c0-bdda-40f4-abdd-5b380c4c1e08"
        },
        {
          "name": "Cone",
          "uid": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Guardrail & Penghadang",
            "code": "GUARDRAIL_BARRIERS",
            "uid": "d03a2bad-3348-457a-a962-0468a1dd7e1e",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "150.5",
              "quantityField": {
                "name": "Guardrail",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "aa3febbd-16af-4288-838b-0c8b74e63030",
                "dropdownOptions": []
              }
            },
            {
              "value": "150.5",
              "quantityField": {
                "name": "New Jersey Barrier (NJB)",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "b3254d91-f08f-45f0-8426-c88fa521a355",
                "dropdownOptions": []
              }
            },
            {
              "value": "150.5",
              "quantityField": {
                "name": "Roller Barrier",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a72dead6-af65-444d-b1b4-5318d2f4146c",
                "dropdownOptions": []
              }
            },
            {
              "value": "150.5",
              "quantityField": {
                "name": "Parapet / Railing Jambatan",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "8b63aa7d-ff29-4132-b37e-c91972707c9b",
                "dropdownOptions": []
              }
            }
          ]
        },
        {
          "quantityType": {
            "name": "Papan Tanda & Tiang",
            "code": "SIGNBOARDS_POLES",
            "uid": "696c1d0f-4383-493a-afd2-33bd1c8e7f23",
            "displayOrder": 2,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "15",
              "quantityField": {
                "name": "Papan Tanda",
                "fieldType": "NUMBER",
                "unit": "Nos",
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e999aeed-9783-449b-ae99-61647fc9ffa2",
                "dropdownOptions": []
              }
            },
            {
              "value": "3",
              "quantityField": {
                "name": "Papan Tanda Gantry",
                "fieldType": "NUMBER",
                "unit": "Nos",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ec03ce67-ce39-4f2e-ac23-fa190de5b503",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 2,
      "uid": "774413fd-5ac3-4083-87a9-22fe9a8e2a7a",
      "name": "Road Furniture Cleaning - MRR2 Gombak",
      "notes": "Regular maintenance cleaning of guardrails, signboards, and kilometer posts along MRR2",
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 4,
      "roadID": 97,
      "totalWorkers": 8,
      "fromSection": "5.2",
      "toSection": "8.5",
      "longitude": "101.7414991",
      "latitude": "3.1307736",
      "createdByID": 1,
      "createdAt": "2025-10-05T12:18:20.864Z",
      "updatedAt": "2025-10-05T12:18:20.864Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Road Furnitures",
        "code": "R04",
        "uid": "d0819f60-5be7-4ae9-bccd-00f37f799491"
      },
      "road": {
        "id": 97,
        "uid": "ee37b350-d9e4-4771-8e7e-3073f48ae5be",
        "name": "MRR2",
        "roadNo": "FT0028",
        "districtID": 6,
        "district": {
          "id": 6,
          "name": "Gombak",
          "uid": "73e4465e-cc94-4a84-82f4-8bb83162040a",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Lorry 3 Ton",
          "uid": "f6953c02-b0fd-4b12-8d93-20cc8d692f44"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Guardrail & Penghadang",
            "code": "GUARDRAIL_BARRIERS",
            "uid": "d03a2bad-3348-457a-a962-0468a1dd7e1e",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "250",
              "quantityField": {
                "name": "Guardrail",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "aa3febbd-16af-4288-838b-0c8b74e63030",
                "dropdownOptions": []
              }
            },
            {
              "value": "100",
              "quantityField": {
                "name": "New Jersey Barrier (NJB)",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "b3254d91-f08f-45f0-8426-c88fa521a355",
                "dropdownOptions": []
              }
            },
            {
              "value": "75",
              "quantityField": {
                "name": "Roller Barrier",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a72dead6-af65-444d-b1b4-5318d2f4146c",
                "dropdownOptions": []
              }
            },
            {
              "value": "50",
              "quantityField": {
                "name": "Parapet / Railing Jambatan",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "8b63aa7d-ff29-4132-b37e-c91972707c9b",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 3,
      "uid": "512bc323-88ee-4177-8b6c-78ceeb41d14a",
      "name": "Grass Cutting - 2025-10-07",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 3,
      "roadID": 544,
      "totalWorkers": null,
      "fromSection": "55",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-06T21:54:53.076Z",
      "updatedAt": "2025-10-06T21:54:53.076Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Grass Cutting",
        "code": "R03",
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2"
      },
      "road": {
        "id": 544,
        "uid": "b63a032c-4f9a-42a3-b8b1-bf8574e2e563",
        "name": "Jalan Kota Bharu - Kuala Terengganu",
        "roadNo": "FT0003",
        "districtID": 30,
        "district": {
          "id": 30,
          "name": "Bachok",
          "uid": "414e4ace-741c-4b93-9b82-3eb3b8b65f4d",
          "stateID": 3,
          "state": {
            "id": 3,
            "name": "Kelantan",
            "uid": "b3ed2960-6bce-4f6b-87e1-21da9d63d9f9",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Cangkul",
          "uid": "419825f7-7cc9-4906-b551-1dbe26690f42"
        },
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 4,
      "uid": "06dae601-d609-45f9-bea5-2d41a55106f5",
      "name": "Grass Cutting - 2025-10-07",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 3,
      "roadID": 544,
      "totalWorkers": null,
      "fromSection": "25",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-06T21:57:38.279Z",
      "updatedAt": "2025-10-06T21:57:38.279Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Grass Cutting",
        "code": "R03",
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2"
      },
      "road": {
        "id": 544,
        "uid": "b63a032c-4f9a-42a3-b8b1-bf8574e2e563",
        "name": "Jalan Kota Bharu - Kuala Terengganu",
        "roadNo": "FT0003",
        "districtID": 30,
        "district": {
          "id": 30,
          "name": "Bachok",
          "uid": "414e4ace-741c-4b93-9b82-3eb3b8b65f4d",
          "stateID": 3,
          "state": {
            "id": 3,
            "name": "Kelantan",
            "uid": "b3ed2960-6bce-4f6b-87e1-21da9d63d9f9",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        },
        {
          "name": "Plastik Sampah",
          "uid": "5de1fe0d-82b7-48f9-90ff-f0b7946d67c0"
        },
        {
          "name": "Skylift",
          "uid": "bfc9a264-6cea-438c-ad58-e44c361839ff"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 5,
      "uid": "caf4fad3-ada2-452c-b88b-fbb0fe4104fa",
      "name": "Grass Cutting - 2025-10-07",
      "notes": null,
      "weatherCondition": "CLOUDY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 3,
      "roadID": 13,
      "totalWorkers": null,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-10-07T04:39:42.948Z",
      "updatedAt": "2025-10-07T04:39:42.948Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Grass Cutting",
        "code": "R03",
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2"
      },
      "road": {
        "id": 13,
        "uid": "7381f593-3e4d-49f7-b5c9-42835e15849e",
        "name": "Industri Glenmarie",
        "roadNo": "FT3213",
        "districtID": 2,
        "district": {
          "id": 2,
          "name": "Petaling",
          "uid": "942a3068-a058-4aca-a46f-cf8a6e581db3",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 6,
      "uid": "e59e1a8b-0045-46ba-9867-86df7304e13e",
      "name": "Cleaning Road Furnitures - 2025-10-07",
      "notes": null,
      "weatherCondition": "CLOUDY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 4,
      "roadID": 15,
      "totalWorkers": null,
      "fromSection": "4.4",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-10-07T04:43:48.020Z",
      "updatedAt": "2025-10-07T04:43:48.020Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Road Furnitures",
        "code": "R04",
        "uid": "d0819f60-5be7-4ae9-bccd-00f37f799491"
      },
      "road": {
        "id": 15,
        "uid": "e18ed109-4c18-4517-9d02-ff89f55f25ce",
        "name": "Industri Hicom (F&N - Guthrie)",
        "roadNo": "FT3214",
        "districtID": 2,
        "district": {
          "id": 2,
          "name": "Petaling",
          "uid": "942a3068-a058-4aca-a46f-cf8a6e581db3",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Penyodok",
          "uid": "115f1f3c-2ded-43c4-a149-4c6a626843bb"
        },
        {
          "name": "Cangkul",
          "uid": "419825f7-7cc9-4906-b551-1dbe26690f42"
        },
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 7,
      "uid": "7c945d59-f799-42aa-8dd0-8d7b9e0e9841",
      "name": "Grass Cutting - 2025-10-07",
      "notes": null,
      "weatherCondition": "CLOUDY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 3,
      "roadID": 20,
      "totalWorkers": null,
      "fromSection": "0.8",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-10-07T07:10:08.100Z",
      "updatedAt": "2025-10-07T07:10:08.100Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Grass Cutting",
        "code": "R03",
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2"
      },
      "road": {
        "id": 20,
        "uid": "cb88990e-c79f-4304-8cf0-774833da6667",
        "name": "Kelana Link",
        "roadNo": "FT0015A",
        "districtID": 2,
        "district": {
          "id": 2,
          "name": "Petaling",
          "uid": "942a3068-a058-4aca-a46f-cf8a6e581db3",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Penyodok",
          "uid": "115f1f3c-2ded-43c4-a149-4c6a626843bb"
        },
        {
          "name": "Cangkul",
          "uid": "419825f7-7cc9-4906-b551-1dbe26690f42"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 8,
      "uid": "25a124d7-2f4f-4139-b8b5-d81311b9a4ac",
      "name": "Cleaning Road Furnitures - 2025-10-16",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 4,
      "roadID": 272,
      "totalWorkers": null,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-16T08:04:09.997Z",
      "updatedAt": "2025-10-16T08:04:09.997Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Road Furnitures",
        "code": "R04",
        "uid": "d0819f60-5be7-4ae9-bccd-00f37f799491"
      },
      "road": {
        "id": 272,
        "uid": "bc320b00-bfe3-4ce5-aef2-042bcadc310e",
        "name": "Batu Balek - Pekan",
        "roadNo": "FT0082",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry 3 Ton",
          "uid": "f6953c02-b0fd-4b12-8d93-20cc8d692f44"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Bahan Kimia",
          "uid": "9517b86e-aee7-41eb-acb9-a1366bc91f4a"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 9,
      "uid": "5d746b19-549f-4399-8408-b295de39382d",
      "name": "Cleaning Drains - 2025-10-21",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 271,
      "totalWorkers": null,
      "fromSection": "100",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-21T12:02:36.132Z",
      "updatedAt": "2025-10-21T12:02:36.132Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 271,
        "uid": "0d71793a-db29-45dd-b4f6-75aa3e0f5563",
        "name": "Segamat - Muadzam Shah - Gambang",
        "roadNo": "FT0012",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry",
          "uid": "f637669f-a4b0-4052-82bf-60aa6ef1276c"
        },
        {
          "name": "Van",
          "uid": "198047cd-fec8-4934-a652-266e4513116a"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 10,
      "uid": "9ae7e64a-1387-4980-9077-85ac16bff83f",
      "name": "Cleaning Drains - 2025-10-22",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 271,
      "totalWorkers": null,
      "fromSection": "100",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-22T14:17:55.568Z",
      "updatedAt": "2025-10-22T14:17:55.568Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 271,
        "uid": "0d71793a-db29-45dd-b4f6-75aa3e0f5563",
        "name": "Segamat - Muadzam Shah - Gambang",
        "roadNo": "FT0012",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 11,
      "uid": "d140cc73-335e-417d-8350-b6204e9347fc",
      "name": "Cleaning Drains - 2025-10-26",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 269,
      "totalWorkers": null,
      "fromSection": "289",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-26T15:48:50.542Z",
      "updatedAt": "2025-10-26T15:48:50.542Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 269,
        "uid": "80d950d2-7c1b-4687-8077-56cebd734736",
        "name": "Jalan Kuantan - Endau",
        "roadNo": "FT0003",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 12,
      "uid": "a8a3cefe-8c71-41b8-a524-2721c35a2a08",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 269,
      "totalWorkers": null,
      "fromSection": "289",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T03:58:18.560Z",
      "updatedAt": "2025-10-27T03:58:18.560Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 269,
        "uid": "80d950d2-7c1b-4687-8077-56cebd734736",
        "name": "Jalan Kuantan - Endau",
        "roadNo": "FT0003",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Van",
          "uid": "198047cd-fec8-4934-a652-266e4513116a"
        },
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        },
        {
          "name": "Plastik Sampah",
          "uid": "5de1fe0d-82b7-48f9-90ff-f0b7946d67c0"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 13,
      "uid": "34d52572-1dd4-4baf-95fe-3776697e28a0",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "CLOUDY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 271,
      "totalWorkers": null,
      "fromSection": "100",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T04:27:02.777Z",
      "updatedAt": "2025-10-27T04:27:02.777Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 271,
        "uid": "0d71793a-db29-45dd-b4f6-75aa3e0f5563",
        "name": "Segamat - Muadzam Shah - Gambang",
        "roadNo": "FT0012",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        },
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 14,
      "uid": "599a1d13-18c5-4384-b712-aca6702b294a",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 271,
      "totalWorkers": null,
      "fromSection": "100",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T04:32:49.469Z",
      "updatedAt": "2025-10-27T04:32:49.469Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 271,
        "uid": "0d71793a-db29-45dd-b4f6-75aa3e0f5563",
        "name": "Segamat - Muadzam Shah - Gambang",
        "roadNo": "FT0012",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 15,
      "uid": "089e8499-7ea8-45d8-b173-f90d1f8934ac",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 269,
      "totalWorkers": null,
      "fromSection": "289",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T04:36:42.306Z",
      "updatedAt": "2025-10-27T04:36:42.306Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 269,
        "uid": "80d950d2-7c1b-4687-8077-56cebd734736",
        "name": "Jalan Kuantan - Endau",
        "roadNo": "FT0003",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 16,
      "uid": "288f32c5-db80-4aef-b216-bdaac0cc3483",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 273,
      "totalWorkers": null,
      "fromSection": "0.1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T04:41:44.110Z",
      "updatedAt": "2025-10-27T04:41:44.110Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 273,
        "uid": "01449d8d-ee99-4087-9692-5ec161513d9a",
        "name": "Jalan Kilang Sawit (F) Chini 1A",
        "roadNo": "FT1557",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        },
        {
          "name": "Excavator",
          "uid": "f7d52d68-6780-4897-8003-fe8dde11e0dc"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 17,
      "uid": "766f9c00-4fa1-4977-af7f-416466d1c9f9",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 271,
      "totalWorkers": null,
      "fromSection": "100",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T04:58:36.206Z",
      "updatedAt": "2025-10-27T04:58:36.206Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 271,
        "uid": "0d71793a-db29-45dd-b4f6-75aa3e0f5563",
        "name": "Segamat - Muadzam Shah - Gambang",
        "roadNo": "FT0012",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Skylift",
          "uid": "bfc9a264-6cea-438c-ad58-e44c361839ff"
        },
        {
          "name": "Penyodok",
          "uid": "115f1f3c-2ded-43c4-a149-4c6a626843bb"
        }
      ],
      "reportQuantities": [],
      "files": [
        {
          "id": 1,
          "uid": "c6ff2547-ddf8-4fc4-a992-e1eefde10898",
          "fileName": "register_img.png",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/17/1761555872439_68adb972_register_img.png",
          "mimeType": "image/png",
          "size": 155866,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T09:04:32.510Z",
          "dailyReportID": 17
        },
        {
          "id": 2,
          "uid": "887afc45-b915-423c-a515-b8c607611fad",
          "fileName": "register_img.png",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/17/1761583461859_38919086_register_img.png",
          "mimeType": "image/png",
          "size": 155866,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T16:44:21.995Z",
          "dailyReportID": 17
        },
        {
          "id": 3,
          "uid": "cda1e482-eeb6-476c-9f84-f1e070e2741b",
          "fileName": "trellispact_logo_concept.png",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/17/1761583462003_fc7a56d9_trellispact_logo_concept.png",
          "mimeType": "image/png",
          "size": 957862,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T16:44:22.064Z",
          "dailyReportID": 17
        },
        {
          "id": 4,
          "uid": "01242f0e-4efb-4866-ac19-de54a2f02104",
          "fileName": "trellispact_logo_concept.png",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/17/1761583462070_37ada3ad_trellispact_logo_concept.png",
          "mimeType": "image/png",
          "size": 957862,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T16:44:22.128Z",
          "dailyReportID": 17
        },
        {
          "id": 5,
          "uid": "c016cc46-ba8e-4340-a716-5e45c0674343",
          "fileName": "trellispact_logo_concept.png",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/17/1761583462133_89e9e335_trellispact_logo_concept.png",
          "mimeType": "image/png",
          "size": 957862,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T16:44:22.188Z",
          "dailyReportID": 17
        },
        {
          "id": 6,
          "uid": "80eae966-a0ed-498c-894f-0639c9e37d2d",
          "fileName": "living_room_UHD_1MB.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/17/1761583462192_ae6570bc_living_room_UHD_1MB.jpg",
          "mimeType": "image/jpeg",
          "size": 838668,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T16:44:22.247Z",
          "dailyReportID": 17
        }
      ]
    },
    {
      "id": 18,
      "uid": "c3a4efba-97a1-4bcf-98d0-a9421c75f9da",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 272,
      "totalWorkers": null,
      "fromSection": "30",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T10:23:12.914Z",
      "updatedAt": "2025-10-27T10:23:12.914Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 272,
        "uid": "bc320b00-bfe3-4ce5-aef2-042bcadc310e",
        "name": "Batu Balek - Pekan",
        "roadNo": "FT0082",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 19,
      "uid": "f095e54b-3e47-4576-9a34-c9a7334340f2",
      "name": "Cleaning Drains - 2025-10-27",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 272,
      "totalWorkers": null,
      "fromSection": "30",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T10:27:10.326Z",
      "updatedAt": "2025-10-27T10:27:10.326Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 272,
        "uid": "bc320b00-bfe3-4ce5-aef2-042bcadc310e",
        "name": "Batu Balek - Pekan",
        "roadNo": "FT0082",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 20,
      "uid": "636d8379-7298-4647-8b9c-06384301610a",
      "name": "Cleaning Drains - 2025-10-28",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 274,
      "totalWorkers": null,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T16:31:47.650Z",
      "updatedAt": "2025-10-27T16:31:47.650Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 274,
        "uid": "bdcdab0b-3690-408f-b58a-25d3cb378257",
        "name": "Jalan Kilang Sawit (F) Chini 2",
        "roadNo": "FT1558",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Cone",
          "uid": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
        },
        {
          "name": "Blower",
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 21,
      "uid": "f2e40420-2955-4afd-af3e-d5abd1a0d9ab",
      "name": "Cleaning Drains - 2025-10-28",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 274,
      "totalWorkers": null,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T16:33:09.712Z",
      "updatedAt": "2025-10-27T16:33:09.712Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 274,
        "uid": "bdcdab0b-3690-408f-b58a-25d3cb378257",
        "name": "Jalan Kilang Sawit (F) Chini 2",
        "roadNo": "FT1558",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Cone",
          "uid": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
        },
        {
          "name": "Blower",
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 22,
      "uid": "95755ffb-04f3-4a1e-9f74-9e1f8edcdbac",
      "name": "Cleaning Drains - 2025-10-28",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 273,
      "totalWorkers": null,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T16:46:39.984Z",
      "updatedAt": "2025-10-27T16:46:39.984Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 273,
        "uid": "01449d8d-ee99-4087-9692-5ec161513d9a",
        "name": "Jalan Kilang Sawit (F) Chini 1A",
        "roadNo": "FT1557",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 23,
      "uid": "3491dcad-1b2b-4948-aa0f-3ec05d896a59",
      "name": "Cleaning Drains - 2025-10-28",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 274,
      "totalWorkers": null,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T17:00:03.785Z",
      "updatedAt": "2025-10-27T17:00:03.785Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 274,
        "uid": "bdcdab0b-3690-408f-b58a-25d3cb378257",
        "name": "Jalan Kilang Sawit (F) Chini 2",
        "roadNo": "FT1558",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        }
      ],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 24,
      "uid": "d8e58b45-fd36-4ccc-bd89-b2ff87663e1e",
      "name": "Cleaning Drains - 2025-10-28",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 273,
      "totalWorkers": null,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T17:04:35.135Z",
      "updatedAt": "2025-10-27T17:04:35.135Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 273,
        "uid": "01449d8d-ee99-4087-9692-5ec161513d9a",
        "name": "Jalan Kilang Sawit (F) Chini 1A",
        "roadNo": "FT1557",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        },
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        }
      ],
      "reportQuantities": [],
      "files": [
        {
          "id": 7,
          "uid": "4a191bac-b50d-4657-922f-4dc3d6dd7bdf",
          "fileName": "BEFORE_IMAGE_0_1761584673867.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/24/1761584675930_f0862986_BEFORE_IMAGE_0_1761584673867.jpg",
          "mimeType": "image/jpeg",
          "size": 1082575,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T17:04:36.073Z",
          "dailyReportID": 24
        },
        {
          "id": 8,
          "uid": "f01d148b-36c9-4d10-ad71-7149c7f1e73d",
          "fileName": "BEFORE_IMAGE_1_1761584673897.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/24/1761584676079_24bf38c8_BEFORE_IMAGE_1_1761584673897.jpg",
          "mimeType": "image/jpeg",
          "size": 1298969,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T17:04:36.149Z",
          "dailyReportID": 24
        },
        {
          "id": 9,
          "uid": "7cdb59df-7e55-4c82-a424-16e8cdcb60e7",
          "fileName": "BEFORE_IMAGE_2_1761584673915.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/24/1761584676153_8054b586_BEFORE_IMAGE_2_1761584673915.jpg",
          "mimeType": "image/jpeg",
          "size": 1426195,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T17:04:36.251Z",
          "dailyReportID": 24
        },
        {
          "id": 10,
          "uid": "cd2af249-0215-43bd-a367-0b3b0a11071e",
          "fileName": "BEFORE_IMAGE_3_1761584673956.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/24/1761584676255_c1f2dd76_BEFORE_IMAGE_3_1761584673956.jpg",
          "mimeType": "image/jpeg",
          "size": 1064602,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T17:04:36.343Z",
          "dailyReportID": 24
        }
      ]
    },
    {
      "id": 25,
      "uid": "542738a7-28dc-4c0c-a0c4-5e03a745a189",
      "name": "Cleaning Drains - 2025-10-28",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 272,
      "totalWorkers": null,
      "fromSection": "5",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-10-27T18:53:26.556Z",
      "updatedAt": "2025-10-27T18:53:26.556Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 272,
        "uid": "bc320b00-bfe3-4ce5-aef2-042bcadc310e",
        "name": "Batu Balek - Pekan",
        "roadNo": "FT0082",
        "districtID": 12,
        "district": {
          "id": 12,
          "name": "Pekan",
          "uid": "ee0f49ef-df86-4f04-b283-96563f51ea19",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        },
        {
          "name": "Excavator",
          "uid": "f7d52d68-6780-4897-8003-fe8dde11e0dc"
        }
      ],
      "reportQuantities": [],
      "files": [
        {
          "id": 11,
          "uid": "491a6f6c-edfb-4aeb-a7fe-122b93fed0e3",
          "fileName": "BEFORE_IMAGE_0_1761591205433.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/25/1761591207540_f4526bae_BEFORE_IMAGE_0_1761591205433.jpg",
          "mimeType": "image/jpeg",
          "size": 2210599,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T18:53:27.692Z",
          "dailyReportID": 25
        },
        {
          "id": 12,
          "uid": "328ec024-00d6-4233-a348-b4ddb8f26942",
          "fileName": "BEFORE_IMAGE_1_1761591205451.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/25/1761591207699_fe5bb94f_BEFORE_IMAGE_1_1761591205451.jpg",
          "mimeType": "image/jpeg",
          "size": 2190432,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T18:53:27.800Z",
          "dailyReportID": 25
        },
        {
          "id": 13,
          "uid": "aba3f7e5-fad4-466f-b16d-22a36a60411b",
          "fileName": "BEFORE_IMAGE_2_1761591205462.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/25/1761591207804_ae975b6e_BEFORE_IMAGE_2_1761591205462.jpg",
          "mimeType": "image/jpeg",
          "size": 2235714,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T18:53:27.910Z",
          "dailyReportID": 25
        },
        {
          "id": 14,
          "uid": "f5612a67-be4c-4d9e-b2e5-bcc2e02a839b",
          "fileName": "BEFORE_IMAGE_3_1761591205470.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/25/1761591207915_2fac07ed_BEFORE_IMAGE_3_1761591205470.jpg",
          "mimeType": "image/jpeg",
          "size": 2158327,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-10-27T18:53:28.019Z",
          "dailyReportID": 25
        }
      ]
    },
    {
      "id": 26,
      "uid": "df37a66f-4093-449f-a689-7bfe6e9f9a56",
      "name": "Grass Cutting - 2025-11-03",
      "notes": "test",
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 3,
      "roadID": 183,
      "totalWorkers": 15,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-03T08:43:52.518Z",
      "updatedAt": "2025-11-03T08:43:52.518Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Grass Cutting",
        "code": "R03",
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Blower",
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Memotong Rumput",
            "code": "GRASS_CUTTING",
            "uid": "33b372a1-16c9-413a-a620-c9d558d6ff27",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "M",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c7a09e4d-196e-4777-823e-ceea3ab0f80d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "125196a2-8321-49ba-9634-944a140224d2",
                    "displayOrder": 1
                  },
                  {
                    "value": "M",
                    "uid": "dee16bf6-8e7b-45cf-be19-40814f65e84c",
                    "displayOrder": 2
                  },
                  {
                    "value": "RHS",
                    "uid": "ebfa8fdf-e687-49c8-a51f-84630a4ec384",
                    "displayOrder": 3
                  },
                  {
                    "value": "Susur",
                    "uid": "ebf0cb00-5b85-462a-88b7-875db643bf9d",
                    "displayOrder": 4
                  },
                  {
                    "value": "Berm 1 & 2",
                    "uid": "d902e61d-d80f-4e27-9bd7-afa75f163871",
                    "displayOrder": 5
                  },
                  {
                    "value": "Berm 3 ke atas",
                    "uid": "2a6198b8-7769-494d-b149-e2648bde21fa",
                    "displayOrder": 6
                  }
                ]
              }
            },
            {
              "value": "15",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "67298e6d-7ecf-46c8-8a79-21628aa1060a",
                "dropdownOptions": []
              }
            },
            {
              "value": "50",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "55c90d1e-077e-4ef0-a654-b6e6836c2640",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 15,
          "uid": "cde44906-117a-4db3-8c30-4d8eb604fd88",
          "fileName": "BEFORE_IMAGE_0_1762159431144.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/26/1762159433465_d225e184_BEFORE_IMAGE_0_1762159431144.jpg",
          "mimeType": "image/jpeg",
          "size": 1235189,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-03T08:43:53.663Z",
          "dailyReportID": 26
        },
        {
          "id": 16,
          "uid": "2d2f8e7b-512b-4551-9423-794827e3e6c7",
          "fileName": "BEFORE_IMAGE_1_1762159431167.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/26/1762159433671_1a940f0b_BEFORE_IMAGE_1_1762159431167.jpg",
          "mimeType": "image/jpeg",
          "size": 884462,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-03T08:43:53.731Z",
          "dailyReportID": 26
        },
        {
          "id": 17,
          "uid": "b6717d0b-0e3a-4a22-9706-8e5234214804",
          "fileName": "BEFORE_IMAGE_2_1762159431178.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/26/1762159433737_7b0212ac_BEFORE_IMAGE_2_1762159431178.jpg",
          "mimeType": "image/jpeg",
          "size": 1230521,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-03T08:43:53.810Z",
          "dailyReportID": 26
        },
        {
          "id": 18,
          "uid": "3183d406-fb1f-4287-a4ca-1b876b63cf8c",
          "fileName": "BEFORE_IMAGE_3_1762159431188.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/26/1762159433815_7c1fa143_BEFORE_IMAGE_3_1762159431188.jpg",
          "mimeType": "image/jpeg",
          "size": 1314148,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-03T08:43:53.885Z",
          "dailyReportID": 26
        },
        {
          "id": 19,
          "uid": "6c8e038c-79c5-4f9f-9c69-20ba0c9442bf",
          "fileName": "WORKERS_IMAGE_0_1762159431195.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/26/1762159433890_00a43e0a_WORKERS_IMAGE_0_1762159431195.jpg",
          "mimeType": "image/jpeg",
          "size": 811693,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-03T08:43:53.941Z",
          "dailyReportID": 26
        }
      ]
    },
    {
      "id": 27,
      "uid": "04126350-f320-441f-9f4a-8641f8804184",
      "name": "Pavement / Patching Potholes - 2025-11-06",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": null,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-06T08:44:24.048Z",
      "updatedAt": "2025-11-06T08:44:24.048Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [],
      "reportQuantities": [],
      "files": []
    },
    {
      "id": 28,
      "uid": "02ee9bdf-2fd0-4fd9-813a-d3be51165ae5",
      "name": "Grass Cutting - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 3,
      "roadID": 182,
      "totalWorkers": 15,
      "fromSection": "373",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-13T18:47:17.202Z",
      "updatedAt": "2025-11-13T18:47:17.202Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Grass Cutting",
        "code": "R03",
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2"
      },
      "road": {
        "id": 182,
        "uid": "5183387d-5837-4f22-b2cd-c34f626eaa02",
        "name": "Jalan Kuantan - Cukai",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Blower",
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        },
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Memotong Rumput",
            "code": "GRASS_CUTTING",
            "uid": "33b372a1-16c9-413a-a620-c9d558d6ff27",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "M",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c7a09e4d-196e-4777-823e-ceea3ab0f80d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "125196a2-8321-49ba-9634-944a140224d2",
                    "displayOrder": 1
                  },
                  {
                    "value": "M",
                    "uid": "dee16bf6-8e7b-45cf-be19-40814f65e84c",
                    "displayOrder": 2
                  },
                  {
                    "value": "RHS",
                    "uid": "ebfa8fdf-e687-49c8-a51f-84630a4ec384",
                    "displayOrder": 3
                  },
                  {
                    "value": "Susur",
                    "uid": "ebf0cb00-5b85-462a-88b7-875db643bf9d",
                    "displayOrder": 4
                  },
                  {
                    "value": "Berm 1 & 2",
                    "uid": "d902e61d-d80f-4e27-9bd7-afa75f163871",
                    "displayOrder": 5
                  },
                  {
                    "value": "Berm 3 ke atas",
                    "uid": "2a6198b8-7769-494d-b149-e2648bde21fa",
                    "displayOrder": 6
                  }
                ]
              }
            },
            {
              "value": "10",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "67298e6d-7ecf-46c8-8a79-21628aa1060a",
                "dropdownOptions": []
              }
            },
            {
              "value": "10",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "55c90d1e-077e-4ef0-a654-b6e6836c2640",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 29,
      "uid": "e4a9f36f-edf9-436d-aec4-9674b7a1ba26",
      "name": "Cleaning Road Furnitures - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 4,
      "roadID": 183,
      "totalWorkers": 15,
      "fromSection": "0.1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-13T19:09:55.823Z",
      "updatedAt": "2025-11-13T19:09:55.823Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Road Furnitures",
        "code": "R04",
        "uid": "d0819f60-5be7-4ae9-bccd-00f37f799491"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry 3 Ton",
          "uid": "f6953c02-b0fd-4b12-8d93-20cc8d692f44"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Bahan Kimia",
          "uid": "9517b86e-aee7-41eb-acb9-a1366bc91f4a"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Guardrail & Penghadang",
            "code": "GUARDRAIL_BARRIERS",
            "uid": "d03a2bad-3348-457a-a962-0468a1dd7e1e",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "5",
              "quantityField": {
                "name": "Guardrail",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "aa3febbd-16af-4288-838b-0c8b74e63030",
                "dropdownOptions": []
              }
            },
            {
              "value": "5",
              "quantityField": {
                "name": "New Jersey Barrier (NJB)",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "b3254d91-f08f-45f0-8426-c88fa521a355",
                "dropdownOptions": []
              }
            },
            {
              "value": "5",
              "quantityField": {
                "name": "Roller Barrier",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a72dead6-af65-444d-b1b4-5318d2f4146c",
                "dropdownOptions": []
              }
            },
            {
              "value": "5",
              "quantityField": {
                "name": "Parapet / Railing Jambatan",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "8b63aa7d-ff29-4132-b37e-c91972707c9b",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 30,
      "uid": "d7fc8fc9-7566-46fd-aeb9-8b56efb04b1e",
      "name": "Cleaning Road Furnitures - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 4,
      "roadID": 183,
      "totalWorkers": 15,
      "fromSection": "0.1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-13T19:31:58.903Z",
      "updatedAt": "2025-11-13T19:31:58.903Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Road Furnitures",
        "code": "R04",
        "uid": "d0819f60-5be7-4ae9-bccd-00f37f799491"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Cone",
          "uid": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
        },
        {
          "name": "Berus",
          "uid": "92a31fab-0370-4774-95e4-b27e0948cba4"
        },
        {
          "name": "Water Jet",
          "uid": "eff37fb4-6feb-4d26-af82-01bc0ae8e02f"
        },
        {
          "name": "Tangga",
          "uid": "b79db221-7467-46c9-bae0-9421f03de426"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Guardrail & Penghadang",
            "code": "GUARDRAIL_BARRIERS",
            "uid": "d03a2bad-3348-457a-a962-0468a1dd7e1e",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "5",
              "quantityField": {
                "name": "Guardrail",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "aa3febbd-16af-4288-838b-0c8b74e63030",
                "dropdownOptions": []
              }
            },
            {
              "value": "5",
              "quantityField": {
                "name": "New Jersey Barrier (NJB)",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "b3254d91-f08f-45f0-8426-c88fa521a355",
                "dropdownOptions": []
              }
            },
            {
              "value": "5",
              "quantityField": {
                "name": "Roller Barrier",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a72dead6-af65-444d-b1b4-5318d2f4146c",
                "dropdownOptions": []
              }
            },
            {
              "value": "5",
              "quantityField": {
                "name": "Parapet / Railing Jambatan",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "8b63aa7d-ff29-4132-b37e-c91972707c9b",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 20,
          "uid": "4db052ac-4ecd-47b0-b969-cf71973abbf4",
          "fileName": "BEFORE_IMAGE_0_1763062317508.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/30/1763062319983_8812fb3d_BEFORE_IMAGE_0_1763062317508.jpg",
          "mimeType": "image/jpeg",
          "size": 2198578,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:32:00.318Z",
          "dailyReportID": 30
        },
        {
          "id": 21,
          "uid": "b4747b3a-c11d-40ae-9014-5d725b678208",
          "fileName": "BEFORE_IMAGE_0_1763062318086.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/30/1763062320331_cce6b0ae_BEFORE_IMAGE_0_1763062318086.jpg",
          "mimeType": "image/jpeg",
          "size": 2198578,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:32:00.459Z",
          "dailyReportID": 30
        },
        {
          "id": 22,
          "uid": "a890a6fc-378b-467e-bc22-0f284b815361",
          "fileName": "WORKERS_IMAGE_0_1763062317501.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/30/1763062320464_5fd6165c_WORKERS_IMAGE_0_1763062317501.jpg",
          "mimeType": "image/jpeg",
          "size": 2218410,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:32:00.589Z",
          "dailyReportID": 30
        },
        {
          "id": 23,
          "uid": "b6cccf57-1202-4457-9163-42f04d60547e",
          "fileName": "WORKERS_IMAGE_0_1763062318100.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/30/1763062320596_77e9d255_WORKERS_IMAGE_0_1763062318100.jpg",
          "mimeType": "image/jpeg",
          "size": 2218410,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:32:00.715Z",
          "dailyReportID": 30
        }
      ]
    },
    {
      "id": 31,
      "uid": "fedf0231-014b-4029-9c48-41fcefca7dd6",
      "name": "Cleaning Drains - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 183,
      "totalWorkers": 10,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-13T19:34:21.374Z",
      "updatedAt": "2025-11-13T19:34:21.374Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Skylift",
          "uid": "bfc9a264-6cea-438c-ad58-e44c361839ff"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Longkang Tanah",
            "code": "EARTH_DRAIN",
            "uid": "30215906-9714-4196-a0fc-d71698f5f6e6",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bfecdea3-fdd3-4e25-809a-6a96d9ba95de",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "3fdb147e-aad8-45fe-825f-8c28d40e07de",
                    "displayOrder": 1
                  },
                  {
                    "value": "M",
                    "uid": "5dd5789b-62af-49d1-9169-a002725e5195",
                    "displayOrder": 2
                  },
                  {
                    "value": "RHS",
                    "uid": "889b8ebd-02cc-447e-bdd5-cfa8a1da9958",
                    "displayOrder": 3
                  },
                  {
                    "value": "Susur",
                    "uid": "358d1f2c-b2c8-42a4-89a8-efcc5f8f6504",
                    "displayOrder": 4
                  }
                ]
              }
            },
            {
              "value": "50",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bedc39a5-fb88-44a1-b0ea-5d795300bd26",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 24,
          "uid": "0df2cf97-cd21-47a3-81a5-9b784c179345",
          "fileName": "BEFORE_IMAGE_0_1763062459660.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/31/1763062462469_96741708_BEFORE_IMAGE_0_1763062459660.jpg",
          "mimeType": "image/jpeg",
          "size": 2173822,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:34:22.671Z",
          "dailyReportID": 31
        },
        {
          "id": 25,
          "uid": "92591c0e-68cc-4fc5-8056-02a7421a8300",
          "fileName": "BEFORE_IMAGE_0_1763062460519.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/31/1763062462676_16c1f23e_BEFORE_IMAGE_0_1763062460519.jpg",
          "mimeType": "image/jpeg",
          "size": 2173822,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:34:22.775Z",
          "dailyReportID": 31
        },
        {
          "id": 26,
          "uid": "d0b0ea32-1fa6-464d-b2b1-46c1d503a7fb",
          "fileName": "WORKERS_IMAGE_0_1763062459653.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/31/1763062462780_8d2d1633_WORKERS_IMAGE_0_1763062459653.jpg",
          "mimeType": "image/jpeg",
          "size": 2171001,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:34:22.917Z",
          "dailyReportID": 31
        },
        {
          "id": 27,
          "uid": "d919b534-5608-4fe2-8dda-36c486fe9f47",
          "fileName": "WORKERS_IMAGE_0_1763062460528.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/31/1763062462922_00d2b4f4_WORKERS_IMAGE_0_1763062460528.jpg",
          "mimeType": "image/jpeg",
          "size": 2171001,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T19:34:23.021Z",
          "dailyReportID": 31
        }
      ]
    },
    {
      "id": 32,
      "uid": "3b579e64-956b-47cd-a421-f9dc047a42f6",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 1,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-11-13T23:08:40.699Z",
      "updatedAt": "2025-11-13T23:08:40.699Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Lorry 1 Ton",
          "uid": "159020c0-bdda-40f4-abdd-5b380c4c1e08"
        },
        {
          "name": "Plate Compactor",
          "uid": "41ba7341-9801-4fb1-a07a-dde0399764f4"
        },
        {
          "name": "Squeegee",
          "uid": "c74a9864-64ac-42a1-b51e-d97ed6e69539"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "q",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 33,
      "uid": "58cbc8ce-3177-48e4-aecb-0e932e1b2503",
      "name": "Road Shoulder - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 2,
      "roadID": 183,
      "totalWorkers": 1,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-11-13T23:15:04.481Z",
      "updatedAt": "2025-11-13T23:15:04.481Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Road Shoulder",
        "code": "R02",
        "uid": "81094b15-03b7-4648-bc35-1fd214c90031"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Backhoe",
          "uid": "934b604c-2213-44da-9991-d0ffbdf67e45"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Regrading",
            "code": "REGRADING",
            "uid": "1f10229c-e100-46d7-a11b-28e8f44ac073",
            "displayOrder": 1,
            "hasSegmentBreakdown": true,
            "segmentSize": 25,
            "maxSegmentLength": 1000
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Direction",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "5a1d6f49-4cbf-419e-821d-9c7d233d21de",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "c608012f-4ba1-4c7d-b189-0923ac1ae265",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "58e38d61-d9c1-4653-bee1-e1e244b63d89",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Segment Length",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": true,
                "defaultValue": null,
                "uid": "d2a46b5f-7cde-4a88-ad40-d32d78dad00e",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Total Length",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "90060baf-b835-4063-afb7-1b82bfda4641",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Segment Width",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": false,
                "isForSegment": true,
                "defaultValue": null,
                "uid": "cdbde58d-9d4d-4e6b-be7c-aeefd1ae9575",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Segment Depth",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": false,
                "isForSegment": true,
                "defaultValue": null,
                "uid": "1e9e0c40-d648-40b3-b4a5-a3996adaa689",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 34,
      "uid": "744efbc4-fb1e-4386-95f9-750b7ec8e0c7",
      "name": "Cleaning Drains - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 167,
      "totalWorkers": 15,
      "fromSection": "454.6",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-13T23:24:12.777Z",
      "updatedAt": "2025-11-13T23:24:12.777Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 167,
        "uid": "092775b2-3daa-4a6f-8a9f-1c31083b79fb",
        "name": "KUALA LUMPUR - TANJUNG MALIM",
        "roadNo": "FT0001",
        "districtID": 7,
        "district": {
          "id": 7,
          "name": "Hulu Selangor",
          "uid": "15b4cc5a-47ea-4fbc-aa2e-6ab26a528ff8",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry",
          "uid": "f637669f-a4b0-4052-82bf-60aa6ef1276c"
        },
        {
          "name": "Van",
          "uid": "198047cd-fec8-4934-a652-266e4513116a"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        },
        {
          "name": "Skylift",
          "uid": "bfc9a264-6cea-438c-ad58-e44c361839ff"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Longkang Tanah",
            "code": "EARTH_DRAIN",
            "uid": "30215906-9714-4196-a0fc-d71698f5f6e6",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bfecdea3-fdd3-4e25-809a-6a96d9ba95de",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "3fdb147e-aad8-45fe-825f-8c28d40e07de",
                    "displayOrder": 1
                  },
                  {
                    "value": "M",
                    "uid": "5dd5789b-62af-49d1-9169-a002725e5195",
                    "displayOrder": 2
                  },
                  {
                    "value": "RHS",
                    "uid": "889b8ebd-02cc-447e-bdd5-cfa8a1da9958",
                    "displayOrder": 3
                  },
                  {
                    "value": "Susur",
                    "uid": "358d1f2c-b2c8-42a4-89a8-efcc5f8f6504",
                    "displayOrder": 4
                  }
                ]
              }
            },
            {
              "value": "15",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bedc39a5-fb88-44a1-b0ea-5d795300bd26",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 28,
          "uid": "bda0b132-9cf9-4f4e-988f-8fb2447f4cce",
          "fileName": "BEFORE_IMAGE_0_1763076249892.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/34/1763076253611_17f8bc63_BEFORE_IMAGE_0_1763076249892.jpg",
          "mimeType": "image/jpeg",
          "size": 1714167,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:24:13.786Z",
          "dailyReportID": 34
        },
        {
          "id": 29,
          "uid": "ad0e9de1-d00d-4b7b-9b40-a7efa821c4f7",
          "fileName": "BEFORE_IMAGE_0_1763076251886.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/34/1763076253795_f6f0a117_BEFORE_IMAGE_0_1763076251886.jpg",
          "mimeType": "image/jpeg",
          "size": 1714167,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:24:13.886Z",
          "dailyReportID": 34
        },
        {
          "id": 30,
          "uid": "16f25568-c4fa-4a37-ae32-1a6a83139b13",
          "fileName": "WORKERS_IMAGE_0_1763076249886.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/34/1763076253892_5d2a0b6f_WORKERS_IMAGE_0_1763076249886.jpg",
          "mimeType": "image/jpeg",
          "size": 1774541,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:24:13.976Z",
          "dailyReportID": 34
        },
        {
          "id": 31,
          "uid": "c5749a1b-024a-4e86-aebc-0ec0283b9a88",
          "fileName": "WORKERS_IMAGE_0_1763076251895.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/34/1763076253981_9847c4f0_WORKERS_IMAGE_0_1763076251895.jpg",
          "mimeType": "image/jpeg",
          "size": 1774541,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:24:14.072Z",
          "dailyReportID": 34
        }
      ]
    },
    {
      "id": 35,
      "uid": "bc1ce0b7-3961-46e8-9ea3-5b7ea63b5cbe",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 1,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-11-13T23:28:13.646Z",
      "updatedAt": "2025-11-13T23:28:13.646Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Penyiram",
          "uid": "9a23b395-b1fc-4e28-8502-4a554bef9b53"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "W",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 36,
      "uid": "650d292c-e7fc-44b6-a483-235b355515f5",
      "name": "Cleaning Drains - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 167,
      "totalWorkers": 15,
      "fromSection": "454.6",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-13T23:28:28.088Z",
      "updatedAt": "2025-11-13T23:28:28.088Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 167,
        "uid": "092775b2-3daa-4a6f-8a9f-1c31083b79fb",
        "name": "KUALA LUMPUR - TANJUNG MALIM",
        "roadNo": "FT0001",
        "districtID": 7,
        "district": {
          "id": 7,
          "name": "Hulu Selangor",
          "uid": "15b4cc5a-47ea-4fbc-aa2e-6ab26a528ff8",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry",
          "uid": "f637669f-a4b0-4052-82bf-60aa6ef1276c"
        },
        {
          "name": "Van",
          "uid": "198047cd-fec8-4934-a652-266e4513116a"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Longkang Tanah",
            "code": "EARTH_DRAIN",
            "uid": "30215906-9714-4196-a0fc-d71698f5f6e6",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bfecdea3-fdd3-4e25-809a-6a96d9ba95de",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "3fdb147e-aad8-45fe-825f-8c28d40e07de",
                    "displayOrder": 1
                  },
                  {
                    "value": "M",
                    "uid": "5dd5789b-62af-49d1-9169-a002725e5195",
                    "displayOrder": 2
                  },
                  {
                    "value": "RHS",
                    "uid": "889b8ebd-02cc-447e-bdd5-cfa8a1da9958",
                    "displayOrder": 3
                  },
                  {
                    "value": "Susur",
                    "uid": "358d1f2c-b2c8-42a4-89a8-efcc5f8f6504",
                    "displayOrder": 4
                  }
                ]
              }
            },
            {
              "value": "15",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bedc39a5-fb88-44a1-b0ea-5d795300bd26",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 32,
          "uid": "b6949334-6d1e-4c87-9094-818dd7f63ffa",
          "fileName": "BEFORE_IMAGE_0_1763076505944.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/36/1763076508747_5f1c9be2_BEFORE_IMAGE_0_1763076505944.jpg",
          "mimeType": "image/jpeg",
          "size": 1711957,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:28:28.899Z",
          "dailyReportID": 36
        },
        {
          "id": 33,
          "uid": "1e069c14-675d-45be-a5ab-9f42fe136fbf",
          "fileName": "BEFORE_IMAGE_0_1763076507249.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/36/1763076508906_d1f645b7_BEFORE_IMAGE_0_1763076507249.jpg",
          "mimeType": "image/jpeg",
          "size": 1711957,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:28:28.987Z",
          "dailyReportID": 36
        },
        {
          "id": 34,
          "uid": "c1c78c26-fd14-41d9-801b-657aa8ba5679",
          "fileName": "WORKERS_IMAGE_0_1763076505939.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/36/1763076508992_b94fb50f_WORKERS_IMAGE_0_1763076505939.jpg",
          "mimeType": "image/jpeg",
          "size": 1699847,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:28:29.069Z",
          "dailyReportID": 36
        },
        {
          "id": 35,
          "uid": "c2f31a8c-d6d7-43f3-a76f-69868f29f7a5",
          "fileName": "WORKERS_IMAGE_0_1763076507254.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/36/1763076509074_e76aaacd_WORKERS_IMAGE_0_1763076507254.jpg",
          "mimeType": "image/jpeg",
          "size": 1699847,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-13T23:28:29.146Z",
          "dailyReportID": 36
        }
      ]
    },
    {
      "id": 37,
      "uid": "3e764968-fd86-48d4-8191-64317b2be29e",
      "name": "Cleaning Drains - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 183,
      "totalWorkers": 15,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T00:05:18.977Z",
      "updatedAt": "2025-11-14T00:05:18.977Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Skylift",
          "uid": "bfc9a264-6cea-438c-ad58-e44c361839ff"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Longkang Tanah",
            "code": "EARTH_DRAIN",
            "uid": "30215906-9714-4196-a0fc-d71698f5f6e6",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "M",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bfecdea3-fdd3-4e25-809a-6a96d9ba95de",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "3fdb147e-aad8-45fe-825f-8c28d40e07de",
                    "displayOrder": 1
                  },
                  {
                    "value": "M",
                    "uid": "5dd5789b-62af-49d1-9169-a002725e5195",
                    "displayOrder": 2
                  },
                  {
                    "value": "RHS",
                    "uid": "889b8ebd-02cc-447e-bdd5-cfa8a1da9958",
                    "displayOrder": 3
                  },
                  {
                    "value": "Susur",
                    "uid": "358d1f2c-b2c8-42a4-89a8-efcc5f8f6504",
                    "displayOrder": 4
                  }
                ]
              }
            },
            {
              "value": "11",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bedc39a5-fb88-44a1-b0ea-5d795300bd26",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 36,
          "uid": "f05458b3-0cbe-4b22-aeac-3055a3f46bec",
          "fileName": "BEFORE_IMAGE_0_1763078715796.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/37/1763078719832_ab53fc4a_BEFORE_IMAGE_0_1763078715796.jpg",
          "mimeType": "image/jpeg",
          "size": 1609661,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T00:05:19.973Z",
          "dailyReportID": 37
        },
        {
          "id": 37,
          "uid": "3065dab9-ce9f-4a2e-a1dc-5ffc6945c2f1",
          "fileName": "BEFORE_IMAGE_0_1763078716226.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/37/1763078719981_b2e67079_BEFORE_IMAGE_0_1763078716226.jpg",
          "mimeType": "image/jpeg",
          "size": 1609661,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T00:05:20.062Z",
          "dailyReportID": 37
        },
        {
          "id": 38,
          "uid": "d2ea990c-81a8-4f7c-a948-62581fc6c0fd",
          "fileName": "WORKERS_IMAGE_0_1763078715789.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/37/1763078720070_33771c38_WORKERS_IMAGE_0_1763078715789.jpg",
          "mimeType": "image/jpeg",
          "size": 1522114,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T00:05:20.148Z",
          "dailyReportID": 37
        },
        {
          "id": 39,
          "uid": "cd5cd39e-3cca-465e-8bc7-00e4d581c0f8",
          "fileName": "WORKERS_IMAGE_0_1763078716241.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/37/1763078720153_4bb84f33_WORKERS_IMAGE_0_1763078716241.jpg",
          "mimeType": "image/jpeg",
          "size": 1522114,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T00:05:20.231Z",
          "dailyReportID": 37
        }
      ]
    },
    {
      "id": 38,
      "uid": "ca8d9c44-4863-432e-ba5e-e3a1c9fae296",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 1,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-11-14T00:05:36.344Z",
      "updatedAt": "2025-11-14T00:05:36.344Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Penyiram",
          "uid": "9a23b395-b1fc-4e28-8502-4a554bef9b53"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "w",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 39,
      "uid": "b003f059-560f-49e0-843f-fc5967f0eaed",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 5,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-11-14T00:13:08.601Z",
      "updatedAt": "2025-11-14T00:13:08.601Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Breaker",
          "uid": "bc3a161a-3386-42a6-aa49-bf396511e36d"
        },
        {
          "name": "Plate Compactor",
          "uid": "41ba7341-9801-4fb1-a07a-dde0399764f4"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "w",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 40,
      "uid": "ac07d1b7-e6a8-42d0-80f3-ebe348eafa2a",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 1,
      "fromSection": "0.3",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 11,
      "createdAt": "2025-11-14T00:17:12.375Z",
      "updatedAt": "2025-11-14T00:17:12.375Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "First Name",
        "lastName": "Last name",
        "uid": "83486f99-0871-4f83-8b1a-a4de645f6bd4"
      },
      "equipments": [
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Penyiram",
          "uid": "9a23b395-b1fc-4e28-8502-4a554bef9b53"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.3",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "1",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "w",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 41,
      "uid": "7439d02b-b0b2-403d-bc0f-d5b520f64d26",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 5,
      "fromSection": "0.5",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T00:32:40.436Z",
      "updatedAt": "2025-11-14T00:32:40.436Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Penyiram",
          "uid": "9a23b395-b1fc-4e28-8502-4a554bef9b53"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "t",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 42,
      "uid": "38f37381-e543-49ce-9c58-b553a41ff5e0",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 5,
      "fromSection": "0.5",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T00:33:45.792Z",
      "updatedAt": "2025-11-14T00:33:45.792Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Penyiram",
          "uid": "9a23b395-b1fc-4e28-8502-4a554bef9b53"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "t",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 43,
      "uid": "b1cc617e-2b68-4cf5-a86a-1f1fafb2c601",
      "name": "Cleaning Culverts & Bridge - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 5,
      "roadID": 183,
      "totalWorkers": 15,
      "fromSection": "1",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T00:35:44.737Z",
      "updatedAt": "2025-11-14T00:35:44.737Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Culverts & Bridge",
        "code": "R05",
        "uid": "9711e5f9-cf3a-48a9-99e1-87dc1e82f3ec"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        },
        {
          "name": "Skylift",
          "uid": "bfc9a264-6cea-438c-ad58-e44c361839ff"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Membersih Atas Jambatan - Memotong Rumput / Membersih Lubang Laluan Air / Vegetation",
            "code": "CLEAN_BRIDGE_TOP",
            "uid": "0cb99da0-f3fe-43c6-b3ce-45c9c5f1ce0e",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "50",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "166022d1-9df5-43ad-b377-46da109e6d96",
                "dropdownOptions": []
              }
            },
            {
              "value": "50",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "7a762913-6ce1-4d23-a2e6-a36f7fb5771e",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 40,
          "uid": "2988f6fb-58d6-4c76-96d2-5ee09e4c5b55",
          "fileName": "BEFORE_IMAGE_0_1763080542309.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/43/1763080545430_ad6e7873_BEFORE_IMAGE_0_1763080542309.jpg",
          "mimeType": "image/jpeg",
          "size": 537923,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T00:35:45.570Z",
          "dailyReportID": 43
        },
        {
          "id": 41,
          "uid": "88a19ffe-2cbb-4d78-8ea9-0cd83126eaf1",
          "fileName": "WORKERS_IMAGE_0_1763080542300.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/43/1763080545578_c6e48e03_WORKERS_IMAGE_0_1763080542300.jpg",
          "mimeType": "image/jpeg",
          "size": 1241168,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T00:35:45.656Z",
          "dailyReportID": 43
        }
      ]
    },
    {
      "id": 44,
      "uid": "c3d3577b-3b06-4d88-ae0e-dc6330e0fa5d",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 182,
      "totalWorkers": 7,
      "fromSection": "372.53",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T03:07:07.495Z",
      "updatedAt": "2025-11-14T03:07:07.495Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 182,
        "uid": "5183387d-5837-4f22-b2cd-c34f626eaa02",
        "name": "Jalan Kuantan - Cukai",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Plate Compactor",
          "uid": "41ba7341-9801-4fb1-a07a-dde0399764f4"
        },
        {
          "name": "Compactor Roller 1 Ton",
          "uid": "57411046-91d2-45c2-86c8-1751e4a56b32"
        },
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Squeegee",
          "uid": "c74a9864-64ac-42a1-b51e-d97ed6e69539"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "pothole",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 45,
      "uid": "c6c31558-7b39-4ef2-8ae6-7d1df6a9edb6",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 182,
      "totalWorkers": 7,
      "fromSection": "372.53",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T03:08:44.873Z",
      "updatedAt": "2025-11-14T03:08:44.873Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 182,
        "uid": "5183387d-5837-4f22-b2cd-c34f626eaa02",
        "name": "Jalan Kuantan - Cukai",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Plate Compactor",
          "uid": "41ba7341-9801-4fb1-a07a-dde0399764f4"
        },
        {
          "name": "Compactor Roller 1 Ton",
          "uid": "57411046-91d2-45c2-86c8-1751e4a56b32"
        },
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Squeegee",
          "uid": "c74a9864-64ac-42a1-b51e-d97ed6e69539"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "pothole",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 46,
      "uid": "3e583cf1-aef6-42a2-a858-051ad134c4d3",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 167,
      "totalWorkers": 5,
      "fromSection": "454.5",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T03:20:30.020Z",
      "updatedAt": "2025-11-14T03:20:30.020Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 167,
        "uid": "092775b2-3daa-4a6f-8a9f-1c31083b79fb",
        "name": "KUALA LUMPUR - TANJUNG MALIM",
        "roadNo": "FT0001",
        "districtID": 7,
        "district": {
          "id": 7,
          "name": "Hulu Selangor",
          "uid": "15b4cc5a-47ea-4fbc-aa2e-6ab26a528ff8",
          "stateID": 12,
          "state": {
            "id": 12,
            "name": "Selangor",
            "uid": "04ee59ed-a8b2-47c4-95e8-6aa16c9681c4",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry 3 Ton",
          "uid": "f6953c02-b0fd-4b12-8d93-20cc8d692f44"
        },
        {
          "name": "Pavement Cutter",
          "uid": "3c2a2eb7-c711-4317-83e4-224e2029d587"
        },
        {
          "name": "Blower",
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
        },
        {
          "name": "Squeegee",
          "uid": "c74a9864-64ac-42a1-b51e-d97ed6e69539"
        },
        {
          "name": "Cone",
          "uid": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "10",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "20",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "25",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "ft55",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 42,
          "uid": "97b4fd03-d4c0-4479-ad53-108140d2a9bb",
          "fileName": "BEFORE_IMAGE_0_1763090426465.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/46/1763090430995_54ac3f36_BEFORE_IMAGE_0_1763090426465.jpg",
          "mimeType": "image/jpeg",
          "size": 559252,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T03:20:31.142Z",
          "dailyReportID": 46
        },
        {
          "id": 43,
          "uid": "0bfff3b2-91d4-4773-a6eb-4dd3cbe2b5d0",
          "fileName": "BEFORE_IMAGE_1_1763090426467.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/46/1763090431151_83c4fec3_BEFORE_IMAGE_1_1763090426467.jpg",
          "mimeType": "image/jpeg",
          "size": 926018,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T03:20:31.212Z",
          "dailyReportID": 46
        },
        {
          "id": 44,
          "uid": "d9f9b3b9-51a6-43a1-bc19-9a7da7ba1afe",
          "fileName": "BEFORE_IMAGE_2_1763090426470.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/46/1763090431218_99f94cda_BEFORE_IMAGE_2_1763090426470.jpg",
          "mimeType": "image/jpeg",
          "size": 860787,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T03:20:31.275Z",
          "dailyReportID": 46
        },
        {
          "id": 45,
          "uid": "8e62b723-8be6-457a-8cef-fc5b7588e9d7",
          "fileName": "BEFORE_IMAGE_3_1763090426473.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/46/1763090431280_52594f12_BEFORE_IMAGE_3_1763090426473.jpg",
          "mimeType": "image/jpeg",
          "size": 936845,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T03:20:31.335Z",
          "dailyReportID": 46
        },
        {
          "id": 46,
          "uid": "0f56b329-fcdc-4be9-9215-5aecb6dfabe9",
          "fileName": "WORKERS_IMAGE_0_1763090426476.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/46/1763090431339_da2f8e94_WORKERS_IMAGE_0_1763090426476.jpg",
          "mimeType": "image/jpeg",
          "size": 610243,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T03:20:31.384Z",
          "dailyReportID": 46
        }
      ]
    },
    {
      "id": 47,
      "uid": "f709aba0-ba9c-4e66-97b9-60c590ba8dc0",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 182,
      "totalWorkers": 3,
      "fromSection": "372.53",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T03:23:36.059Z",
      "updatedAt": "2025-11-14T03:23:36.059Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 182,
        "uid": "5183387d-5837-4f22-b2cd-c34f626eaa02",
        "name": "Jalan Kuantan - Cukai",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry 1 Ton",
          "uid": "159020c0-bdda-40f4-abdd-5b380c4c1e08"
        },
        {
          "name": "Pavement Cutter",
          "uid": "3c2a2eb7-c711-4317-83e4-224e2029d587"
        },
        {
          "name": "Penyodok",
          "uid": "115f1f3c-2ded-43c4-a149-4c6a626843bb"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            }
          ]
        },
        {
          "quantityType": {
            "name": "Pothole - Coldmix",
            "code": "POTHOLE_COLDMIX",
            "uid": "ff00b821-c4db-4b54-91f2-4cdcabb284b0",
            "displayOrder": 4,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c13a2b24-6fbc-4a77-8ee2-5b49510768ce",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "393ba2dc-0cb6-40c7-baeb-3939841f75dc",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "d0704958-9571-466e-8a0d-072475a61e1f",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "b733be85-7d5c-464d-9a63-fdff8098c4ae",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "acf97ae4-6333-4055-8d38-a1cef6c67a6b",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "cf5aa3ef-9aef-4b2c-b8b1-84ba61ab5666",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c5b028d7-00ea-4591-aebc-bbcd4d3a932e",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "52fbf439-2122-4c8d-9dca-27c1f9358266",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "9deb4788-b324-4a8a-9242-6dc49409e2a1",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": []
    },
    {
      "id": 48,
      "uid": "70edbd8d-eeb8-4c10-96f9-9955e7330809",
      "name": "Pavement / Patching Potholes - 2025-11-14",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 183,
      "totalWorkers": 2,
      "fromSection": "0",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-14T07:40:26.481Z",
      "updatedAt": "2025-11-14T07:40:26.481Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 183,
        "uid": "04619b3b-a096-4703-bea9-690b60562cba",
        "name": "Persimpangan Trumpet",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry 1 Ton",
          "uid": "159020c0-bdda-40f4-abdd-5b380c4c1e08"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Hotmix",
            "code": "POTHOLE_HOTMIX",
            "uid": "6a31e284-9288-4bbf-a44a-8c77c9492a2b",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "e3439da3-55f9-4586-96c5-c3bf643ccf8d",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "e94552cc-dc7a-44f2-947c-9e86ca5c873b",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "c0650076-8937-4120-87ec-fda4f0844a2a",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "25efd67d-4f0b-43a1-bc22-ec5a776bc74a",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "29fb963c-3c5a-45cd-9516-8f93b9841a57",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "e8926297-cb05-4c87-b7bb-d984e1d3daf8",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c843e412-a353-45e9-91cd-cc57f0179c70",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ceaca020-2790-409d-acc5-8e1febb3ca58",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.03",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "a9c67fbe-4a8e-4638-853f-9c73fd517f3d",
                "dropdownOptions": []
              }
            },
            {
              "value": "pothole",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bb0e47fe-02d0-4f72-9222-3131a690eb25",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 47,
          "uid": "bb3bcc8d-3a40-45ab-b7a9-3c8a5d6ecf7e",
          "fileName": "BEFORE_IMAGE_0_1763106021699.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/48/1763106027689_7b6b8269_BEFORE_IMAGE_0_1763106021699.jpg",
          "mimeType": "image/jpeg",
          "size": 1295268,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T07:40:27.866Z",
          "dailyReportID": 48
        },
        {
          "id": 48,
          "uid": "bb3bf106-11ee-430a-b70e-c806e0ad854a",
          "fileName": "BEFORE_IMAGE_1_1763106021702.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/48/1763106027874_5ae6070c_BEFORE_IMAGE_1_1763106021702.jpg",
          "mimeType": "image/jpeg",
          "size": 1018513,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T07:40:27.934Z",
          "dailyReportID": 48
        },
        {
          "id": 49,
          "uid": "8dec05a2-d4b6-43a4-be4f-bcaf0445dd04",
          "fileName": "BEFORE_IMAGE_2_1763106021707.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/48/1763106027938_c3226d64_BEFORE_IMAGE_2_1763106021707.jpg",
          "mimeType": "image/jpeg",
          "size": 1862340,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T07:40:28.028Z",
          "dailyReportID": 48
        },
        {
          "id": 50,
          "uid": "562e9e00-d605-4151-9fe8-db6f8a2972af",
          "fileName": "BEFORE_IMAGE_3_1763106021719.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/48/1763106028032_17a1ad97_BEFORE_IMAGE_3_1763106021719.jpg",
          "mimeType": "image/jpeg",
          "size": 1406284,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T07:40:28.106Z",
          "dailyReportID": 48
        },
        {
          "id": 51,
          "uid": "874314cd-16bf-4720-b6c3-692f02b50f5a",
          "fileName": "WORKERS_IMAGE_0_1763106021726.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/48/1763106028111_3074b6be_WORKERS_IMAGE_0_1763106021726.jpg",
          "mimeType": "image/jpeg",
          "size": 1058596,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-14T07:40:28.183Z",
          "dailyReportID": 48
        }
      ]
    },
    {
      "id": 49,
      "uid": "0ed653a5-4a58-450c-b5e3-a3f926169617",
      "name": "Pavement / Patching Potholes - 2025-11-15",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 1,
      "roadID": 182,
      "totalWorkers": 6,
      "fromSection": "375",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-15T07:14:01.374Z",
      "updatedAt": "2025-11-15T07:14:01.374Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Pavement / Patching Potholes",
        "code": "R01",
        "uid": "12d3908e-973f-4ccc-a321-598b18b804dc"
      },
      "road": {
        "id": 182,
        "uid": "5183387d-5837-4f22-b2cd-c34f626eaa02",
        "name": "Jalan Kuantan - Cukai",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Lorry 3 Ton",
          "uid": "f6953c02-b0fd-4b12-8d93-20cc8d692f44"
        },
        {
          "name": "Lorry 1 Ton",
          "uid": "159020c0-bdda-40f4-abdd-5b380c4c1e08"
        },
        {
          "name": "Pavement Cutter",
          "uid": "3c2a2eb7-c711-4317-83e4-224e2029d587"
        },
        {
          "name": "Breaker",
          "uid": "bc3a161a-3386-42a6-aa49-bf396511e36d"
        },
        {
          "name": "Blower",
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
        },
        {
          "name": "Plate Compactor",
          "uid": "41ba7341-9801-4fb1-a07a-dde0399764f4"
        },
        {
          "name": "Compactor Roller 1 Ton",
          "uid": "57411046-91d2-45c2-86c8-1751e4a56b32"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Pothole - Coldmix",
            "code": "POTHOLE_COLDMIX",
            "uid": "ff00b821-c4db-4b54-91f2-4cdcabb284b0",
            "displayOrder": 4,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c13a2b24-6fbc-4a77-8ee2-5b49510768ce",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "393ba2dc-0cb6-40c7-baeb-3939841f75dc",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "d0704958-9571-466e-8a0d-072475a61e1f",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "Tidak Potong",
              "quantityField": {
                "name": "Cara Tampalan",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "b733be85-7d5c-464d-9a63-fdff8098c4ae",
                "dropdownOptions": [
                  {
                    "value": "Potong",
                    "uid": "acf97ae4-6333-4055-8d38-a1cef6c67a6b",
                    "displayOrder": 1
                  },
                  {
                    "value": "Tidak Potong",
                    "uid": "cf5aa3ef-9aef-4b2c-b8b1-84ba61ab5666",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "0.3",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "c5b028d7-00ea-4591-aebc-bbcd4d3a932e",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.5",
              "quantityField": {
                "name": "Lebar",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 4,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "52fbf439-2122-4c8d-9dca-27c1f9358266",
                "dropdownOptions": []
              }
            },
            {
              "value": "0.4",
              "quantityField": {
                "name": "Tebal",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 5,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "9deb4788-b324-4a8a-9242-6dc49409e2a1",
                "dropdownOptions": []
              }
            },
            {
              "value": "rc/0003/ktn/4",
              "quantityField": {
                "name": "No Rujukan Pothole",
                "fieldType": "TEXT",
                "unit": null,
                "validationRules": null,
                "displayOrder": 6,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "1a878c00-8619-49fc-8c10-470c1b75dde7",
                "dropdownOptions": []
              }
            },
            {
              "value": "4",
              "quantityField": {
                "name": "Coldmix",
                "fieldType": "NUMBER",
                "unit": "bag",
                "validationRules": null,
                "displayOrder": 7,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "3a74570a-fab9-4531-99b7-d9fe507af534",
                "dropdownOptions": []
              }
            },
            {
              "value": "0",
              "quantityField": {
                "name": "Ultracrete",
                "fieldType": "NUMBER",
                "unit": "Tong",
                "validationRules": null,
                "displayOrder": 8,
                "isRequired": false,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "2b184548-8144-4c81-8984-1f49c2cd0a3b",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 52,
          "uid": "b00355c1-d224-4be1-9d04-89fac7531438",
          "fileName": "BEFORE_IMAGE_0_1763190838227.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190864556_aada196c_BEFORE_IMAGE_0_1763190838227.jpg",
          "mimeType": "image/jpeg",
          "size": 1297884,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:24.710Z",
          "dailyReportID": 49
        },
        {
          "id": 53,
          "uid": "b907b867-070b-4810-b338-0978b63e62af",
          "fileName": "BEFORE_IMAGE_1_1763190838230.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190864719_0f7ed29f_BEFORE_IMAGE_1_1763190838230.jpg",
          "mimeType": "image/jpeg",
          "size": 1340366,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:24.786Z",
          "dailyReportID": 49
        },
        {
          "id": 54,
          "uid": "b1dfe1aa-4c19-4c81-b5d1-5a8208cd68dd",
          "fileName": "BEFORE_IMAGE_2_1763190838234.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190864791_83ce6d6a_BEFORE_IMAGE_2_1763190838234.jpg",
          "mimeType": "image/jpeg",
          "size": 1269290,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:24.855Z",
          "dailyReportID": 49
        },
        {
          "id": 55,
          "uid": "d454791e-b6ef-42d0-9edc-2ab16c480c0b",
          "fileName": "BEFORE_IMAGE_3_1763190838237.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190864860_beec3d5c_BEFORE_IMAGE_3_1763190838237.jpg",
          "mimeType": "image/jpeg",
          "size": 1293922,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:24.929Z",
          "dailyReportID": 49
        },
        {
          "id": 60,
          "uid": "2694ad09-4026-4e2f-bf0a-043aa7a3215e",
          "fileName": "AFTER_IMAGE_0_1763190838256.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865228_8accaea4_AFTER_IMAGE_0_1763190838256.jpg",
          "mimeType": "image/jpeg",
          "size": 1402646,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "AFTER_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.294Z",
          "dailyReportID": 49
        },
        {
          "id": 61,
          "uid": "7e01a78e-784e-4fd9-b245-1738ac1c15c7",
          "fileName": "AFTER_IMAGE_1_1763190838261.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865299_ea3541e3_AFTER_IMAGE_1_1763190838261.jpg",
          "mimeType": "image/jpeg",
          "size": 1400652,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "AFTER_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.362Z",
          "dailyReportID": 49
        },
        {
          "id": 62,
          "uid": "356a03ea-4159-4794-83d1-8d1a3f42be9c",
          "fileName": "AFTER_IMAGE_2_1763190838265.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865367_91d911b5_AFTER_IMAGE_2_1763190838265.jpg",
          "mimeType": "image/jpeg",
          "size": 1399653,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "AFTER_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.437Z",
          "dailyReportID": 49
        },
        {
          "id": 63,
          "uid": "f1adef11-ae1e-4257-b7b4-03254aa435c4",
          "fileName": "AFTER_IMAGE_3_1763190838270.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865442_777fe321_AFTER_IMAGE_3_1763190838270.jpg",
          "mimeType": "image/jpeg",
          "size": 1446910,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "AFTER_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.511Z",
          "dailyReportID": 49
        },
        {
          "id": 64,
          "uid": "c2d2979d-8bb6-4d28-8bb3-12078aca8f2a",
          "fileName": "WORKERS_IMAGE_0_1763190838274.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865515_bcde014f_WORKERS_IMAGE_0_1763190838274.jpg",
          "mimeType": "image/jpeg",
          "size": 1217400,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "WORKERS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.577Z",
          "dailyReportID": 49
        },
        {
          "id": 56,
          "uid": "396f6fd5-059d-43b6-a289-c6837e5a15ad",
          "fileName": "INPROGRESS_IMAGE_0_1763190838240.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190864934_8ed8a52a_INPROGRESS_IMAGE_0_1763190838240.jpg",
          "mimeType": "image/jpeg",
          "size": 1358153,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.001Z",
          "dailyReportID": 49
        },
        {
          "id": 57,
          "uid": "05510ecf-bf96-4280-839d-c5c73555e345",
          "fileName": "INPROGRESS_IMAGE_1_1763190838244.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865007_b4d78eec_INPROGRESS_IMAGE_1_1763190838244.jpg",
          "mimeType": "image/jpeg",
          "size": 1426973,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.075Z",
          "dailyReportID": 49
        },
        {
          "id": 58,
          "uid": "a07083b5-e122-4997-8741-2351031d0345",
          "fileName": "INPROGRESS_IMAGE_2_1763190838248.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865081_3d45b6d4_INPROGRESS_IMAGE_2_1763190838248.jpg",
          "mimeType": "image/jpeg",
          "size": 1431758,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.152Z",
          "dailyReportID": 49
        },
        {
          "id": 59,
          "uid": "da8ebc8d-f5fd-4074-8619-1080a045b829",
          "fileName": "INPROGRESS_IMAGE_3_1763190838253.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/49/1763190865157_2b8ce236_INPROGRESS_IMAGE_3_1763190838253.jpg",
          "mimeType": "image/jpeg",
          "size": 1388021,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T07:14:25.223Z",
          "dailyReportID": 49
        }
      ]
    },
    {
      "id": 50,
      "uid": "c371f590-6e88-4f62-b378-cb090adb1cc6",
      "name": "Cleaning Drains - 2025-11-15",
      "notes": null,
      "weatherCondition": "SUNNY",
      "workPerformed": true,
      "companyID": 1,
      "status": "SUBMITTED",
      "contractRelationID": null,
      "approvedByID": null,
      "approvedAt": null,
      "rejectionReason": null,
      "workScopeID": 6,
      "roadID": 182,
      "totalWorkers": null,
      "fromSection": "375",
      "toSection": null,
      "longitude": null,
      "latitude": null,
      "createdByID": 1,
      "createdAt": "2025-11-15T14:41:17.668Z",
      "updatedAt": "2025-11-15T14:41:17.668Z",
      "deletedAt": null,
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      },
      "contractRelation": null,
      "workScope": {
        "name": "Cleaning Drains",
        "code": "R07",
        "uid": "501632f0-e6b5-4054-9d9e-ac349db0d749"
      },
      "road": {
        "id": 182,
        "uid": "5183387d-5837-4f22-b2cd-c34f626eaa02",
        "name": "Jalan Kuantan - Cukai",
        "roadNo": "FT0003",
        "districtID": 10,
        "district": {
          "id": 10,
          "name": "Kuantan",
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "stateID": 6,
          "state": {
            "id": 6,
            "name": "Pahang",
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "country": {
              "id": 1,
              "name": "Malaysia",
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c"
            }
          }
        }
      },
      "createdBy": {
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2"
      },
      "equipments": [
        {
          "name": "Blower",
          "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
        },
        {
          "name": "Penyapu",
          "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
        },
        {
          "name": "Cone",
          "uid": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
        },
        {
          "name": "Papan Tanda",
          "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
        },
        {
          "name": "Penyodok",
          "uid": "115f1f3c-2ded-43c4-a149-4c6a626843bb"
        },
        {
          "name": "Cangkul",
          "uid": "419825f7-7cc9-4906-b551-1dbe26690f42"
        },
        {
          "name": "Grass Machine",
          "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
        },
        {
          "name": "Kereta Sorong",
          "uid": "e9f36afd-1bd4-495f-8f2d-fb346360636f"
        }
      ],
      "reportQuantities": [
        {
          "quantityType": {
            "name": "Longkang Tanah",
            "code": "EARTH_DRAIN",
            "uid": "30215906-9714-4196-a0fc-d71698f5f6e6",
            "displayOrder": 1,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bfecdea3-fdd3-4e25-809a-6a96d9ba95de",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "3fdb147e-aad8-45fe-825f-8c28d40e07de",
                    "displayOrder": 1
                  },
                  {
                    "value": "M",
                    "uid": "5dd5789b-62af-49d1-9169-a002725e5195",
                    "displayOrder": 2
                  },
                  {
                    "value": "RHS",
                    "uid": "889b8ebd-02cc-447e-bdd5-cfa8a1da9958",
                    "displayOrder": 3
                  },
                  {
                    "value": "Susur",
                    "uid": "358d1f2c-b2c8-42a4-89a8-efcc5f8f6504",
                    "displayOrder": 4
                  }
                ]
              }
            },
            {
              "value": "100",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "bedc39a5-fb88-44a1-b0ea-5d795300bd26",
                "dropdownOptions": []
              }
            }
          ]
        },
        {
          "quantityType": {
            "name": "Longkang Konkrit",
            "code": "CONCRETE_DRAIN",
            "uid": "90c40b6e-0430-4007-a34c-691b021a9e3d",
            "displayOrder": 2,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "LHS",
              "quantityField": {
                "name": "Arah",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "be05a438-791d-4bc8-94f2-9d8a3058a726",
                "dropdownOptions": [
                  {
                    "value": "LHS",
                    "uid": "94debd2c-6b79-4838-820c-4d8675bdd1c6",
                    "displayOrder": 1
                  },
                  {
                    "value": "RHS",
                    "uid": "e7dfabfa-ed36-4cc4-837b-38ae64e37b70",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "U-shape",
              "quantityField": {
                "name": "Jenis",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "da400018-6a22-4963-a085-5e77a6be2680",
                "dropdownOptions": [
                  {
                    "value": "U-shape",
                    "uid": "d64c6a68-2a19-4dfc-9058-ee536b66caed",
                    "displayOrder": 1
                  },
                  {
                    "value": "V-shape",
                    "uid": "d912c71a-e049-411a-910d-e89299007e54",
                    "displayOrder": 2
                  },
                  {
                    "value": "Egg-shape",
                    "uid": "4263f3ba-511b-4c83-9427-3a1d1190533f",
                    "displayOrder": 3
                  },
                  {
                    "value": "Half-round",
                    "uid": "e99cc191-5daf-4b10-a290-9d4eb3559f8b",
                    "displayOrder": 4
                  }
                ]
              }
            },
            {
              "value": "100",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 3,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "ef7e809a-aa50-46e6-8e3b-c049400e00c6",
                "dropdownOptions": []
              }
            }
          ]
        },
        {
          "quantityType": {
            "name": "Longkang Berm 1 & 2",
            "code": "BERM_DRAIN_1_2",
            "uid": "5bda8cd2-4f8f-4cc8-b2d0-2b2556a450c4",
            "displayOrder": 3,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "Berm",
              "quantityField": {
                "name": "Tempat",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "331d31a4-e866-4a6f-b70e-712ff73c5131",
                "dropdownOptions": [
                  {
                    "value": "Berm",
                    "uid": "659a82c1-0464-477d-be01-f4c21facee61",
                    "displayOrder": 1
                  },
                  {
                    "value": "Bench",
                    "uid": "d7d7f0ba-0c80-4fc0-9514-44d7cbffbc57",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "100",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "fd98425f-c0bf-498d-aafd-9910a5137168",
                "dropdownOptions": []
              }
            }
          ]
        },
        {
          "quantityType": {
            "name": "Longkang Berm 3 ke atas",
            "code": "BERM_DRAIN_3_ABOVE",
            "uid": "1ea89498-8d31-49cb-955d-aaed45144d21",
            "displayOrder": 4,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "Berm",
              "quantityField": {
                "name": "Tempat",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "120a62bb-4455-46cb-88ac-d7384795c7d3",
                "dropdownOptions": [
                  {
                    "value": "Berm",
                    "uid": "4c64d244-afc7-40e5-bea2-467b57caafcf",
                    "displayOrder": 1
                  },
                  {
                    "value": "Bench",
                    "uid": "46d9ddf3-01da-4889-bd5b-59f6d533ee48",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "100",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "73ffa9bf-246d-43af-a307-6af7aa53ae2c",
                "dropdownOptions": []
              }
            }
          ]
        },
        {
          "quantityType": {
            "name": "Longkang Interceptor / Cascade",
            "code": "INTERCEPTOR_CASCADE_DRAIN",
            "uid": "bb4a6109-e0de-40e0-97ce-cb4476837b4e",
            "displayOrder": 5,
            "hasSegmentBreakdown": false,
            "segmentSize": null,
            "maxSegmentLength": null
          },
          "quantityValues": [
            {
              "value": "Berm",
              "quantityField": {
                "name": "Tempat",
                "fieldType": "DROPDOWN",
                "unit": null,
                "validationRules": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "93175bd5-0776-43b4-abcd-9f1016ce3894",
                "dropdownOptions": [
                  {
                    "value": "Berm",
                    "uid": "c5ce0cec-b7df-43a0-999f-59d5fbc574a1",
                    "displayOrder": 1
                  },
                  {
                    "value": "Bench",
                    "uid": "e3aedd11-6f89-427f-bd5a-f9e67cdfde7e",
                    "displayOrder": 2
                  }
                ]
              }
            },
            {
              "value": "100",
              "quantityField": {
                "name": "Panjang",
                "fieldType": "DECIMAL",
                "unit": "m",
                "validationRules": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "uid": "591596f7-3e44-4e7f-9642-b0de6adefac2",
                "dropdownOptions": []
              }
            }
          ]
        }
      ],
      "files": [
        {
          "id": 65,
          "uid": "de770112-2d43-4ec4-84d6-82a7d9d2285c",
          "fileName": "BEFORE_IMAGE_0_1763217675261.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682031_03a681ec_BEFORE_IMAGE_0_1763217675261.jpg",
          "mimeType": "image/jpeg",
          "size": 74728,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.113Z",
          "dailyReportID": 50
        },
        {
          "id": 66,
          "uid": "9a325730-3710-448d-ae51-724a028a97bc",
          "fileName": "BEFORE_IMAGE_1_1763217675263.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682121_d3fd96aa_BEFORE_IMAGE_1_1763217675263.jpg",
          "mimeType": "image/jpeg",
          "size": 74940,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.151Z",
          "dailyReportID": 50
        },
        {
          "id": 67,
          "uid": "267f954f-7d6f-4327-b622-9f66d371d36e",
          "fileName": "BEFORE_IMAGE_2_1763217675264.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682156_8bfb26ba_BEFORE_IMAGE_2_1763217675264.jpg",
          "mimeType": "image/jpeg",
          "size": 75777,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.186Z",
          "dailyReportID": 50
        },
        {
          "id": 68,
          "uid": "6cd9bc02-c6ae-4d08-b162-cbe66be9030c",
          "fileName": "BEFORE_IMAGE_3_1763217675266.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682191_e67b719c_BEFORE_IMAGE_3_1763217675266.jpg",
          "mimeType": "image/jpeg",
          "size": 75910,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "BEFORE_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.219Z",
          "dailyReportID": 50
        },
        {
          "id": 69,
          "uid": "2f4e64b1-ccf0-4cd9-ac0a-df3b2cdbb42e",
          "fileName": "INPROGRESS_IMAGE_0_1763217675269.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682225_b2098785_INPROGRESS_IMAGE_0_1763217675269.jpg",
          "mimeType": "image/jpeg",
          "size": 74965,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.257Z",
          "dailyReportID": 50
        },
        {
          "id": 70,
          "uid": "84310da4-aa76-44e8-875b-270ed1132c45",
          "fileName": "INPROGRESS_IMAGE_1_1763217675271.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682262_b3be8698_INPROGRESS_IMAGE_1_1763217675271.jpg",
          "mimeType": "image/jpeg",
          "size": 75641,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.290Z",
          "dailyReportID": 50
        },
        {
          "id": 71,
          "uid": "a28e189c-5aac-4ae3-bd6a-b0f89330a5d3",
          "fileName": "INPROGRESS_IMAGE_2_1763217675272.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682295_c6e2f468_INPROGRESS_IMAGE_2_1763217675272.jpg",
          "mimeType": "image/jpeg",
          "size": 74526,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.326Z",
          "dailyReportID": 50
        },
        {
          "id": 72,
          "uid": "f1b125ce-5ada-44b4-b865-91c7547afd4f",
          "fileName": "INPROGRESS_IMAGE_3_1763217675274.jpg",
          "s3Url": "https://cdn-staging.rclink.my/companies/1/daily-reports/50/1763217682330_6b4aad98_INPROGRESS_IMAGE_3_1763217675274.jpg",
          "mimeType": "image/jpeg",
          "size": 74454,
          "sequence": null,
          "companyID": 1,
          "contextType": "DAILY_REPORT",
          "contextField": "INPROGRESS_IMAGE",
          "uploadedByID": 1,
          "createdAt": "2025-11-15T14:41:22.359Z",
          "dailyReportID": 50
        }
      ]
    }
  ],
  "meta": {
    "page": 1,
    "limit": 50,
    "totalCount": 84,
    "totalPages": 2,
    "hasNext": true,
    "hasPrev": false
  }
}