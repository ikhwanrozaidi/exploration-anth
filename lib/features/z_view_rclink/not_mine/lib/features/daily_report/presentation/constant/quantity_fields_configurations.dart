// {
//           "id": 7,
//           "uid": "929f1391-b338-4f44-88ba-e201e5377aab",
//           "quantityTypeID": 2,
//           "name": "Arah",
//           "code": "direction",
//           "fieldType": "DROPDOWN",
//           "unit": null,
//           "validationRules": null,
//           "displayOrder": 1,
//           "isRequired": true,
//           "isForSegment": false,
//           "defaultValue": null,
//           "placeholder": null,
//           "helpText": null,
//           "createdAt": "2025-09-16T19:55:24.400Z",
//           "updatedAt": "2025-09-16T19:55:24.400Z",
//           "dropdownOptions": [
//             {
//               "id": 5,
//               "uid": "0515b64f-9585-4e41-998c-b76727dfa582",
//               "fieldID": 7,
//               "value": "LHS",
//               "displayOrder": 1,
//               "isActive": true,
//               "createdAt": "2025-09-16T19:55:24.428Z",
//               "updatedAt": "2025-09-16T19:55:24.428Z"
//             },
//             {
//               "id": 6,
//               "uid": "83001038-60a7-4fe1-91c0-3353873d62ce",
//               "fieldID": 7,
//               "value": "RHS",
//               "displayOrder": 2,
//               "isActive": true,
//               "createdAt": "2025-09-16T19:55:24.442Z",
//               "updatedAt": "2025-09-16T19:55:24.442Z"
//             }
//           ]
//         },


// // remapped
// id: uid,
// title: name,
// type: fieldtype, 
// dropdownOptions: dropdownOptions,
// units: unit,
// isRequired: isRequired,

// // not matching maps from FieldConfig
// hintText: String
// description: String, 
// icon: IconData,
// isTips: bool,
// pageNavigate: Widget,
// tipsTitle: String
// numericMin
// numericMax

// // not matching maps from response
// displayOrder // will use when inserting in the lists
// quantityTypeID
// code
// validationRules
// isForSegment: bool
// defaultValue:
// placeholder
// helpText

// // enchance dropdownOptions to save uid and value, then insert by displayOrder, only when isActive true







// {
//   "statusCode": 200,
//   "message": "",
//   "data": [
//     {
//       "id": 7,
//       "uid": "1f10229c-e100-46d7-a11b-28e8f44ac073",
//       "name": "Regrading",
//       "code": "REGRADING",
//       "description": "Road shoulder regrading with 25m segment breakdown",
//       "workScopeID": 2,
//       "companyID": 1,
//       "displayOrder": 1,
//       "isActive": true,
//       "hasSegmentBreakdown": true,
//       "segmentSize": 25,
//       "maxSegmentLength": 1000,
//       "createdAt": "2025-09-16T19:55:25.770Z",
//       "updatedAt": "2025-09-16T19:55:25.770Z",
//       "deletedAt": null,
//       "quantityFields": [
//         {
//           "id": 37,
//           "uid": "5a1d6f49-4cbf-419e-821d-9c7d233d21de",
//           "quantityTypeID": 7,
//           "name": "Direction",
//           "code": "direction",
//           "fieldType": "DROPDOWN",
//           "unit": null,
//           "validationRules": null,
//           "displayOrder": 1,
//           "isRequired": true,
//           "isForSegment": false,
//           "defaultValue": null,
//           "placeholder": null,
//           "helpText": null,
//           "createdAt": "2025-09-16T19:55:25.800Z",
//           "updatedAt": "2025-09-16T19:55:25.800Z",
//           "dropdownOptions": [
//             {
//               "id": 26,
//               "uid": "c608012f-4ba1-4c7d-b189-0923ac1ae265",
//               "fieldID": 37,
//               "value": "LHS",
//               "displayOrder": 1,
//               "isActive": true,
//               "createdAt": "2025-09-16T19:55:25.827Z",
//               "updatedAt": "2025-09-16T19:55:25.827Z"
//             },
//             {
//               "id": 27,
//               "uid": "58e38d61-d9c1-4653-bee1-e1e244b63d89",
//               "fieldID": 37,
//               "value": "RHS",
//               "displayOrder": 2,
//               "isActive": true,
//               "createdAt": "2025-09-16T19:55:25.842Z",
//               "updatedAt": "2025-09-16T19:55:25.842Z"
//             }
//           ]
//         },
//         {
//           "id": 38,
//           "uid": "90060baf-b835-4063-afb7-1b82bfda4641",
//           "quantityTypeID": 7,
//           "name": "Total Length",
//           "code": "total_length",
//           "fieldType": "DECIMAL",
//           "unit": "m",
//           "validationRules": null,
//           "displayOrder": 2,
//           "isRequired": true,
//           "isForSegment": false,
//           "defaultValue": null,
//           "placeholder": null,
//           "helpText": null,
//           "createdAt": "2025-09-16T19:55:25.871Z",
//           "updatedAt": "2025-09-16T19:55:25.871Z",
//           "dropdownOptions": []
//         }
//       ]
//     },
//     {
//       "id": 8,
//       "uid": "0843d5b8-9ee5-4ce2-b245-167ae50fe586",
//       "name": "Topping up - Laterite",
//       "code": "TOPPING_UP_LATERITE",
//       "description": "Road shoulder topping up with laterite, 25m segment breakdown",
//       "workScopeID": 2,
//       "companyID": 1,
//       "displayOrder": 2,
//       "isActive": true,
//       "hasSegmentBreakdown": true,
//       "segmentSize": 25,
//       "maxSegmentLength": 1000,
//       "createdAt": "2025-09-16T19:55:25.983Z",
//       "updatedAt": "2025-09-16T19:55:25.983Z",
//       "deletedAt": null,
//       "quantityFields": [
//         {
//           "id": 42,
//           "uid": "f78e631b-24c6-43ad-a746-5a6982a336b9",
//           "quantityTypeID": 8,
//           "name": "Direction",
//           "code": "direction",
//           "fieldType": "DROPDOWN",
//           "unit": null,
//           "validationRules": null,
//           "displayOrder": 1,
//           "isRequired": true,
//           "isForSegment": false,
//           "defaultValue": null,
//           "placeholder": null,
//           "helpText": null,
//           "createdAt": "2025-09-16T19:55:26.011Z",
//           "updatedAt": "2025-09-16T19:55:26.011Z",
//           "dropdownOptions": [
//             {
//               "id": 28,
//               "uid": "b9ddd9ef-385c-4348-aef6-7e74d21ac88f",
//               "fieldID": 42,
//               "value": "LHS",
//               "displayOrder": 1,
//               "isActive": true,
//               "createdAt": "2025-09-16T19:55:26.039Z",
//               "updatedAt": "2025-09-16T19:55:26.039Z"
//             },
//             {
//               "id": 29,
//               "uid": "3111bb5d-958c-4ae9-8ab7-1b04232d9232",
//               "fieldID": 42,
//               "value": "RHS",
//               "displayOrder": 2,
//               "isActive": true,
//               "createdAt": "2025-09-16T19:55:26.063Z",
//               "updatedAt": "2025-09-16T19:55:26.063Z"
//             }
//           ]
//         },
//         {
//           "id": 43,
//           "uid": "10b8febc-3142-4d5e-8ecc-df9bb7716ebd",
//           "quantityTypeID": 8,
//           "name": "Total Length",
//           "code": "total_length",
//           "fieldType": "DECIMAL",
//           "unit": "m",
//           "validationRules": null,
//           "displayOrder": 2,
//           "isRequired": true,
//           "isForSegment": false,
//           "defaultValue": null,
//           "placeholder": null,
//           "helpText": null,
//           "createdAt": "2025-09-16T19:55:26.093Z",
//           "updatedAt": "2025-09-16T19:55:26.093Z",
//           "dropdownOptions": []
//         }
//       ]
//     },
//   ]
// }



// WorkQuantityType > QuantityField > DropdownOption