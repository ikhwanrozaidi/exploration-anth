{
  "workScopeUID": "81094b15-03b7-4648-bc35-1fd214c90031",
  "roadUIDs": [
    "b77a503a-1f1a-4a16-b310-8c8b815f1670"
  ],
  "periods": [
    {
      "periodStart": "2026-01-01",
      "periodEnd": "2026-02-28"
    },
    {
      "periodStart": "2026-03-01",
      "periodEnd": "2026-03-31"
    },
    {
      "periodStart": "2026-04-01",
      "periodEnd": "2026-04-20"
    }
  ],
  "contractRelationUID": "39cf3bb1-ea7d-48a9-a125-cf7bac889639",
  "name": "R02 - Road Shoulder - January 2026",
  "description": "Road shoulder cleaning",
}



--------------------------------------------------


{
  "statusCode": 201,
  "message": "",
  "data": [
    {
      "id": 1,
      "uid": "73a13c3e-e747-4eda-8204-ea2fb95b4773",
      "name": "R02 - Road Shoulder - January 2026",
      "description": "Road shoulder cleaning",
      "companyID": 1,
      "workScopeID": 2,
      "roadID": 203,
      "periodStart": "2026-01-01T00:00:00.000Z",
      "periodEnd": "2026-02-28T00:00:00.000Z",
      "contractRelationID": 4,
      "requiredReportsCount": 24,
      "totalReports": 0,
      "calculationType": "SECTION_BASED",
      "fromSection": "0",
      "toSection": "2.45",
      "dividerValue": "100",
      "inputValue": null,
      "status": "DRAFT",
      "createdByID": 1,
      "createdAt": "2026-01-08T10:06:53.852Z",
      "updatedAt": "2026-01-08T10:06:53.852Z",
      "deletedAt": null,
      "workScope": {
        "id": 2,
        "uid": "81094b15-03b7-4648-bc35-1fd214c90031",
        "name": "Road Shoulder",
        "code": "R02",
        "description": "Road shoulder maintenance and repairs",
        "allowMultipleQuantities": false,
        "companyID": 1,
        "createdAt": "2025-09-16T18:17:04.035Z",
        "updatedAt": "2025-09-16T19:45:09.158Z",
        "deletedAt": null
      },
      "road": {
        "id": 203,
        "uid": "b77a503a-1f1a-4a16-b310-8c8b815f1670",
        "name": "Jalan Pelabuhan Kuantan",
        "roadNo": "V0421",
        "sectionStart": "0",
        "sectionFinish": "2.45",
        "mainCategoryID": 1,
        "secondaryCategoryID": null,
        "districtID": 10,
        "createdAt": "2025-08-29T17:13:28.677Z",
        "updatedAt": "2025-08-30T09:17:25.989Z",
        "district": {
          "id": 10,
          "uid": "df3ae453-1f8f-4739-9d17-54db2355e17f",
          "name": "Kuantan",
          "stateID": 6,
          "state": {
            "id": 6,
            "uid": "c4ce6ab7-ba1c-4cbe-a6da-722016e9b9b2",
            "name": "Pahang",
            "countryID": 1,
            "createdAt": "2025-08-29T16:35:48.280Z",
            "updatedAt": "2025-08-29T16:35:48.280Z",
            "country": {
              "id": 1,
              "uid": "81b08280-ffb2-47e6-8945-c000fca5f95c",
              "name": "Malaysia",
              "createdAt": "2025-08-29T16:35:36.170Z",
              "updatedAt": "2025-08-29T16:35:36.170Z"
            }
          }
        }
      },
      "contractRelation": {
        "id": 4,
        "uid": "39cf3bb1-ea7d-48a9-a125-cf7bac889639",
        "principalCompanyID": 1,
        "contractorCompanyID": 3,
        "contractNumber": "Test-Con-1",
        "description": "",
        "startDate": "2025-01-01T00:00:00.000Z",
        "endDate": "2025-12-31T00:00:00.000Z",
        "status": "ACTIVE",
        "invitedAt": "2025-10-23T08:38:52.222Z",
        "acceptedAt": null,
        "suspendedAt": null,
        "terminatedAt": null,
        "terminationReason": null,
        "createdAt": "2025-10-23T08:38:52.222Z",
        "updatedAt": "2025-10-23T16:16:47.136Z",
        "deletedAt": null,
        "packageID": 1,
        "contractorCompany": {
          "id": 3,
          "uid": "5a6051d4-159d-48cd-bf08-cc55433de85c",
          "name": "Test SDN BHD",
          "regNo": "1211241134",
          "bumiputera": false,
          "einvoiceTinNo": null,
          "registrationDate": null,
          "cidbNo": "0120191119-SL12",
          "cidbGrade": null,
          "address": "07-06, Uno Promenade, Jalan 1/108D, Taman Sungai Besi, 57100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur\nUno Promenade",
          "postalCode": "57100",
          "city": "Kuala Lumpur",
          "state": "Kuala Lumpur",
          "country": "Malaysia",
          "phone": "+60311223212",
          "email": "test@test.com",
          "website": null,
          "defaultBankAcc": "123123123123",
          "defaultBankAccType": "AMBANK",
          "companyType": "PRIVATE_LIMITED_COMPANY",
          "createdAt": "2025-08-27T09:26:45.360Z",
          "updatedAt": "2025-10-24T04:20:22.889Z",
          "deletedAt": null,
          "ownerID": 1,
          "status": "PENDING",
          "statusReason": null,
          "statusUpdatedAt": null,
          "statusUpdatedByID": null
        }
      },
      "createdBy": {
        "id": 1,
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2",
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "phone": "+60173555706",
        "email": "foongef@gmail.com"
      },
      "quantities": [
        {
          "id": 1,
          "uid": "a6d1763d-0c23-4378-a8f0-21c81ab78db8",
          "programID": 1,
          "quantityTypeID": 7,
          "sequenceNo": 1,
          "totalLength": "100.5",
          "notes": "Additional notes",
          "createdAt": "2026-01-08T10:06:53.870Z",
          "updatedAt": "2026-01-08T10:06:53.870Z",
          "quantityType": {
            "id": 7,
            "uid": "1f10229c-e100-46d7-a11b-28e8f44ac073",
            "name": "Regrading",
            "code": "REGRADING",
            "description": "Road shoulder regrading with 25m segment breakdown",
            "workScopeID": 2,
            "companyID": 1,
            "displayOrder": 1,
            "isActive": true,
            "hasSegmentBreakdown": true,
            "segmentSize": 25,
            "maxSegmentLength": 1000,
            "createdAt": "2025-09-16T19:55:25.770Z",
            "updatedAt": "2025-09-16T19:55:25.770Z",
            "deletedAt": null,
            "quantityFields": [
              {
                "id": 37,
                "uid": "5a1d6f49-4cbf-419e-821d-9c7d233d21de",
                "quantityTypeID": 7,
                "name": "Direction",
                "code": "direction",
                "fieldType": "DROPDOWN",
                "unit": null,
                "unitMeasurement": null,
                "minValue": null,
                "maxValue": null,
                "minLength": null,
                "maxLength": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "placeholder": null,
                "helpText": null,
                "createdAt": "2025-09-16T19:55:25.800Z",
                "updatedAt": "2025-09-16T19:55:25.800Z"
              },
              {
                "id": 39,
                "uid": "d2a46b5f-7cde-4a88-ad40-d32d78dad00e",
                "quantityTypeID": 7,
                "name": "Segment Length",
                "code": "segment_length",
                "fieldType": "DECIMAL",
                "unit": "m",
                "unitMeasurement": null,
                "minValue": null,
                "maxValue": null,
                "minLength": null,
                "maxLength": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": true,
                "defaultValue": null,
                "placeholder": null,
                "helpText": null,
                "createdAt": "2025-09-16T19:55:25.901Z",
                "updatedAt": "2025-09-16T19:55:25.901Z"
              },
              {
                "id": 38,
                "uid": "90060baf-b835-4063-afb7-1b82bfda4641",
                "quantityTypeID": 7,
                "name": "Total Length",
                "code": "total_length",
                "fieldType": "DECIMAL",
                "unit": "m",
                "unitMeasurement": null,
                "minValue": null,
                "maxValue": null,
                "minLength": null,
                "maxLength": null,
                "displayOrder": 2,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "placeholder": null,
                "helpText": null,
                "createdAt": "2025-09-16T19:55:25.871Z",
                "updatedAt": "2025-09-16T19:55:25.871Z"
              },
              {
                "id": 40,
                "uid": "cdbde58d-9d4d-4e6b-be7c-aeefd1ae9575",
                "quantityTypeID": 7,
                "name": "Segment Width",
                "code": "segment_width",
                "fieldType": "DECIMAL",
                "unit": "m",
                "unitMeasurement": null,
                "minValue": null,
                "maxValue": null,
                "minLength": null,
                "maxLength": null,
                "displayOrder": 2,
                "isRequired": false,
                "isForSegment": true,
                "defaultValue": null,
                "placeholder": null,
                "helpText": null,
                "createdAt": "2025-09-16T19:55:25.929Z",
                "updatedAt": "2025-09-16T19:55:25.929Z"
              },
              {
                "id": 41,
                "uid": "1e9e0c40-d648-40b3-b4a5-a3996adaa689",
                "quantityTypeID": 7,
                "name": "Segment Depth",
                "code": "segment_depth",
                "fieldType": "DECIMAL",
                "unit": "m",
                "unitMeasurement": null,
                "minValue": null,
                "maxValue": null,
                "minLength": null,
                "maxLength": null,
                "displayOrder": 3,
                "isRequired": false,
                "isForSegment": true,
                "defaultValue": null,
                "placeholder": null,
                "helpText": null,
                "createdAt": "2025-09-16T19:55:25.956Z",
                "updatedAt": "2025-09-16T19:55:25.956Z"
              }
            ]
          },
          "quantityValues": [
            {
              "id": 1,
              "programQuantityID": 1,
              "segmentID": null,
              "quantityFieldID": 37,
              "value": "LHS",
              "createdAt": "2026-01-08T10:06:53.886Z",
              "updatedAt": "2026-01-08T10:06:53.886Z",
              "quantityField": {
                "id": 37,
                "uid": "5a1d6f49-4cbf-419e-821d-9c7d233d21de",
                "quantityTypeID": 7,
                "name": "Direction",
                "code": "direction",
                "fieldType": "DROPDOWN",
                "unit": null,
                "unitMeasurement": null,
                "minValue": null,
                "maxValue": null,
                "minLength": null,
                "maxLength": null,
                "displayOrder": 1,
                "isRequired": true,
                "isForSegment": false,
                "defaultValue": null,
                "placeholder": null,
                "helpText": null,
                "createdAt": "2025-09-16T19:55:25.800Z",
                "updatedAt": "2025-09-16T19:55:25.800Z"
              }
            }
          ],
          "segments": [
            {
              "id": 1,
              "programQuantityID": 1,
              "segmentNumber": 1,
              "startDistance": "0",
              "endDistance": "0.5",
              "createdAt": "2026-01-08T10:06:53.899Z",
              "updatedAt": "2026-01-08T10:06:53.899Z",
              "segmentValues": [
                {
                  "id": 2,
                  "programQuantityID": null,
                  "segmentID": 1,
                  "quantityFieldID": 37,
                  "value": "LHS",
                  "createdAt": "2026-01-08T10:06:53.909Z",
                  "updatedAt": "2026-01-08T10:06:53.909Z",
                  "quantityField": {
                    "id": 37,
                    "uid": "5a1d6f49-4cbf-419e-821d-9c7d233d21de",
                    "quantityTypeID": 7,
                    "name": "Direction",
                    "code": "direction",
                    "fieldType": "DROPDOWN",
                    "unit": null,
                    "unitMeasurement": null,
                    "minValue": null,
                    "maxValue": null,
                    "minLength": null,
                    "maxLength": null,
                    "displayOrder": 1,
                    "isRequired": true,
                    "isForSegment": false,
                    "defaultValue": null,
                    "placeholder": null,
                    "helpText": null,
                    "createdAt": "2025-09-16T19:55:25.800Z",
                    "updatedAt": "2025-09-16T19:55:25.800Z"
                  }
                }
              ]
            }
          ]
        }
      ],
      "_count": {
        "dailyReports": 0
      }
    }
  ]
}



-------------------------------------------------