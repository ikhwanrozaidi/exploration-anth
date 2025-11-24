import 'package:flutter/material.dart';
import 'package:rclink_app/shared/widgets/coming_soon_overlay.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/month_filter_widget.dart';
import '../../../../shared/widgets/custom_tab_widget.dart';
import '../../../../shared/widgets/year_filter_widget.dart';
import '../widgets/warning_list_widget.dart';

class WarningPage extends StatefulWidget {
  const WarningPage({Key? key}) : super(key: key);

  @override
  State<WarningPage> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  String _currentTab = 'Programs';

  void onMonthSelected(String from, String to) {
    setState(() {
      final fromDate = DateTime.parse(from);
      selectedMonth = fromDate.month;
      selectedYear = fromDate.year;
    });
    print('From: $from, To: $to');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Warning',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: ResponsiveHelper.fontSize(context, base: 18),
                  ),
                ),
              ),

              SizedBox(height: 30),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),

                        YearFilter(
                          onYearSelected: (from, to) {
                            // setState(() {
                            //   fromDate = from;
                            //   toDate = to;
                            // });

                            print('From: $from, To: $to');
                          },
                          primaryColor: primaryColor,
                        ),

                        SizedBox(height: 20),

                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: Colors.grey.shade200,
                          ),
                          onPressed: () {
                            CustomSnackBar.show(
                              context,
                              'This feature is coming soon...',
                              type: SnackBarType.comingsoon,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 11,
                              horizontal: 25,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Search contractor or district',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Expanded(
                          child: CustomTabWidget(
                            tabs: const ['Reports', 'Site Warning'],
                            initialIndex: 1,
                            onTabChanged: (index, tabLabel) {
                              setState(() {
                                _currentTab = tabLabel;
                              });
                              print(
                                'Tab changed to: $tabLabel (index: $index)',
                              );
                            },
                            tabContents: [
                              _buildReportsContent(),
                              _buildProgramsContent(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportsContent() {
    return Center(
      child: Text('Reports Content', style: TextStyle(fontSize: 12)),
    );
  }

  Widget _buildProgramsContent() {
    return SingleChildScrollView(child: WarningProgramListWidget());
  }
}













///---------------First api warnings


{
  "statusCode": 200,
  "message": "",
  "data": [
    {
      "id": 1,
      "uid": "3c599328-6e2e-4fe8-845c-3915b56a2f85",
      "warningType": "REPORT_WARNING",
      "dailyReportID": 84,
      "companyID": 1,
      "roadID": 183,
      "workScopeID": 3,
      "fromSection": "1",
      "toSection": null,
      "contractRelationID": null,
      "requiresAction": true,
      "isResolved": false,
      "resolvedByID": null,
      "resolvedAt": null,
      "resolutionNotes": null,
      "longitude": null,
      "latitude": null,
      "description": null,
      "createdByID": 1,
      "createdAt": "2025-11-19T07:55:44.336Z",
      "updatedAt": "2025-11-19T07:55:44.336Z",
      "deletedAt": null,
      "warningItems": [
        {
          "id": 1,
          "uid": "5ead8888-47db-46db-941c-ffa0cd522c5c",
          "warningID": 1,
          "warningReasonID": 3,
          "notes": null,
          "isCompleted": false,
          "completedAt": null,
          "createdAt": "2025-11-19T07:55:44.336Z",
          "updatedAt": "2025-11-19T07:55:44.336Z",
          "warningReason": {
            "id": 3,
            "uid": "376b5c75-ca90-4956-8d1b-3cd465f276e9",
            "name": "Perbezaan masa laporan dibuat berbanding masa laporan dimuatnaik melebihi 1 hari ( tidak pada hari yg sama )",
            "warningType": "REPORT_WARNING",
            "categoryID": 1,
            "workScopeID": 3,
            "requiresAction": true,
            "isActive": true,
            "displayOrder": 0,
            "createdAt": "2025-11-17T16:07:03.017Z",
            "updatedAt": "2025-11-17T16:07:03.017Z",
            "category": {
              "id": 1,
              "uid": "cda36957-ae99-43b9-94a7-8f882de62e13",
              "name": "Photos",
              "warningType": "REPORT_WARNING",
              "createdAt": "2025-11-17T16:07:02.612Z",
              "updatedAt": "2025-11-17T16:10:09.619Z"
            }
          }
        },


        {
          "id": 2,
          "uid": "96666f02-bb28-4d14-a818-10b0d0a52c81",
          "warningID": 1,
          "warningReasonID": 11,
          "notes": null,
          "isCompleted": false,
          "completedAt": null,
          "createdAt": "2025-11-19T07:55:44.336Z",
          "updatedAt": "2025-11-19T07:55:44.336Z",
          "warningReason": {
            "id": 11,
            "uid": "8d0b5f60-f2f5-4fae-ab64-92b47ed42bf6",
            "name": "Laporan tidak dibuat dilokasi sebenar ditapak",
            "warningType": "REPORT_WARNING",
            "categoryID": 1,
            "workScopeID": 3,
            "requiresAction": true,
            "isActive": true,
            "displayOrder": 0,
            "createdAt": "2025-11-17T16:07:03.451Z",
            "updatedAt": "2025-11-17T16:07:03.451Z",
            "category": {
              "id": 1,
              "uid": "cda36957-ae99-43b9-94a7-8f882de62e13",
              "name": "Photos",
              "warningType": "REPORT_WARNING",
              "createdAt": "2025-11-17T16:07:02.612Z",
              "updatedAt": "2025-11-17T16:10:09.619Z"
            }
          }
        }
      ],
      "workScope": {
        "id": 3,
        "uid": "c603b5bc-7325-464d-85d6-5d71331543b2",
        "code": "R03",
        "name": "Grass Cutting"
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
      "contractRelation": null,
      "files": [],
      "createdBy": {
        "id": 1,
        "uid": "83a0562d-9561-4fbd-8bd1-73ccc87fb9e2",
        "firstName": "Ee Fong",
        "lastName": "Foong",
        "phone": "+60173555706"
      },
      "company": {
        "name": "ROADCARE (M) SDN BHD",
        "uid": "5e390f69-56da-4fd4-8c28-307fe0f28102"
      }
    }
  ],
  "meta": {
    "page": 1,
    "limit": 50,
    "totalCount": 1,
    "totalPages": 1,
    "hasNext": false,
    "hasPrev": false
  }
}



/// 2nd api warnings
{
  "statusCode": 200,
  "message": "",
  "data": {
    "id": 1,
    "uid": "3c599328-6e2e-4fe8-845c-3915b56a2f85",
    "warningType": "REPORT_WARNING",
    "dailyReportID": 84,
    "companyID": 1,
    "roadID": 183,
    "workScopeID": 3,
    "fromSection": "1",
    "toSection": null,
    "contractRelationID": null,
    "requiresAction": true,
    "isResolved": false,
    "resolvedByID": null,
    "resolvedAt": null,
    "resolutionNotes": null,
    "longitude": null,
    "latitude": null,
    "description": null,
    "createdByID": 1,
    "createdAt": "2025-11-19T07:55:44.336Z",
    "updatedAt": "2025-11-19T07:55:44.336Z",
    "deletedAt": null,
    "warningItems": [
      {
        "id": 1,
        "uid": "5ead8888-47db-46db-941c-ffa0cd522c5c",
        "warningID": 1,
        "warningReasonID": 3,
        "notes": null,
        "isCompleted": false,
        "completedAt": null,
        "createdAt": "2025-11-19T07:55:44.336Z",
        "updatedAt": "2025-11-19T07:55:44.336Z",
        "warningReason": {
          "id": 3,
          "uid": "376b5c75-ca90-4956-8d1b-3cd465f276e9",
          "name": "Perbezaan masa laporan dibuat berbanding masa laporan dimuatnaik melebihi 1 hari ( tidak pada hari yg sama )",
          "warningType": "REPORT_WARNING",
          "categoryID": 1,
          "workScopeID": 3,
          "requiresAction": true,
          "isActive": true,
          "displayOrder": 0,
          "createdAt": "2025-11-17T16:07:03.017Z",
          "updatedAt": "2025-11-17T16:07:03.017Z",
          "category": {
            "id": 1,
            "uid": "cda36957-ae99-43b9-94a7-8f882de62e13",
            "name": "Photos",
            "warningType": "REPORT_WARNING",
            "createdAt": "2025-11-17T16:07:02.612Z",
            "updatedAt": "2025-11-17T16:10:09.619Z"
          }
        }
      },
      {
        "id": 2,
        "uid": "96666f02-bb28-4d14-a818-10b0d0a52c81",
        "warningID": 1,
        "warningReasonID": 11,
        "notes": null,
        "isCompleted": false,
        "completedAt": null,
        "createdAt": "2025-11-19T07:55:44.336Z",
        "updatedAt": "2025-11-19T07:55:44.336Z",
        "warningReason": {
          "id": 11,
          "uid": "8d0b5f60-f2f5-4fae-ab64-92b47ed42bf6",
          "name": "Laporan tidak dibuat dilokasi sebenar ditapak",
          "warningType": "REPORT_WARNING",
          "categoryID": 1,
          "workScopeID": 3,
          "requiresAction": true,
          "isActive": true,
          "displayOrder": 0,
          "createdAt": "2025-11-17T16:07:03.451Z",
          "updatedAt": "2025-11-17T16:07:03.451Z",
          "category": {
            "id": 1,
            "uid": "cda36957-ae99-43b9-94a7-8f882de62e13",
            "name": "Photos",
            "warningType": "REPORT_WARNING",
            "createdAt": "2025-11-17T16:07:02.612Z",
            "updatedAt": "2025-11-17T16:10:09.619Z"
          }
        }
      }
    ],

    
    "dailyReport": {
      "id": 84,
      "uid": "22dd83f1-ad8c-4b88-86f6-7b562cb56fa4",
      "name": "Grass Cutting - 2025-11-18",
      "createdAt": "2025-11-18T07:56:50.128Z",
      "status": "SUBMITTED",
      "workPerformed": true,
      "reportEquipments": [
        {
          "workEquipment": {
            "name": "Blower",
            "uid": "fc461c7a-7ea4-4341-883b-bd874ddc1b9c"
          }
        },
        {
          "workEquipment": {
            "name": "Penyapu",
            "uid": "bdc24e9d-a5ac-4b31-bbcf-f88699b711b7"
          }
        },
        {
          "workEquipment": {
            "name": "Cone",
            "uid": "9fc390a2-522e-4f7f-a9be-4a2cdfd55e1e"
          }
        },
        {
          "workEquipment": {
            "name": "Papan Tanda",
            "uid": "a1ec864e-1f6b-4206-ad17-5c4da752622d"
          }
        },
        {
          "workEquipment": {
            "name": "Lorry",
            "uid": "f637669f-a4b0-4052-82bf-60aa6ef1276c"
          }
        },
        {
          "workEquipment": {
            "name": "Grass Machine",
            "uid": "d95c1119-073e-4bce-9ddd-f4e5ebc8c660"
          }
        },
        {
          "workEquipment": {
            "name": "Plastik Sampah",
            "uid": "5de1fe0d-82b7-48f9-90ff-f0b7946d67c0"
          }
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
              "value": "2",
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
              "value": "30",
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
        },
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
              "value": "2",
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
              "value": "2",
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
        },
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
              "value": "2",
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
              "value": "2",
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
      ]
    },
    "resolvedBy": null
  }
}



    