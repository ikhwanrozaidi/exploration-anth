import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:rclink_app/features/company/presentation/bloc/company_bloc.dart';

import 'package:rclink_app/features/daily_report/presentation/bloc/daily_report_create/daily_report_create_state.dart';
import 'package:rclink_app/features/daily_report/presentation/widgets/report_creation/equipment_page.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/custom_snackbar.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../../shared/widgets/gallery/gallery_widget.dart';
import '../../../../../shared/widgets/gallery/models/gallery_image.dart';
import '../../../../../shared/widgets/gallery/models/gallery_result.dart';
import '../../../../../shared/widgets/gallery/service/permission_service.dart';
import '../../../daily_report/presentation/widgets/report_creation/shared/custom_fields_tile_widget.dart';

class WarningDraftPage extends StatefulWidget {
  const WarningDraftPage({super.key});

  @override
  State<WarningDraftPage> createState() => _WarningDraftPageState();
}

class _WarningDraftPageState extends State<WarningDraftPage> {
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
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),

              Padding(
                padding: ResponsiveHelper.padding(context, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(5),
                          ),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: primaryColor,
                            size: 25,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // showTipsSelection(
                                //   context: context,
                                //   onTipSelected: (tipType) {
                                //     if (tipType ==
                                //         'traffic_management') {
                                //       print(
                                //         'Navigate to Traffic Management Plan',
                                //       );
                                //     } else if (tipType ==
                                //         'work_specification') {
                                //       print(
                                //         'Navigate to Work Specification',
                                //       );
                                //     }
                                //   },
                                // );
                              },

                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: primaryColor,
                                side: BorderSide(
                                  color: primaryColor,
                                  width: 1.5,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text('Tips'),
                            ),

                            SizedBox(width: 6),

                            TextButton(
                              onPressed: () {
                                // _handleRemoveData();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                                side: BorderSide(color: Colors.red, width: 1.5),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Remove',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Draft Site Warning',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Please fill in the information listed below',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  padding: ResponsiveHelper.padding(
                    context,
                    vertical: 30,
                    horizontal: 20,
                  ),
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
                  child: ListView(
                    children: [
                      SizedBox(height: 10),

                      // Scope of Work (keep existing code but add null safety)
                      if (scopeString != null) ...[
                        Padding(
                          padding: ResponsiveHelper.padding(
                            context,
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 214, 226, 255),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: 20,
                                    child: Image.asset(
                                      'assets/images/icons/scope_of_work.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Scope of Work'),

                                    Text(
                                      scopeString.toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.fontSize(
                                          context,
                                          base: 14,
                                        ),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        dividerConfig(),
                      ],

                      // Location (add null safety)
                      if (roadString != null) ...[
                        Padding(
                          padding: ResponsiveHelper.padding(
                            context,
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 214, 226, 255),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(Icons.sunny, color: primaryColor),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Location'),
                                    Text(
                                      roadString.toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.fontSize(
                                          context,
                                          base: 14,
                                        ),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        dividerConfig(),
                      ],

                      // Section (add null safety)
                      if (sectionString != null) ...[
                        Padding(
                          padding: ResponsiveHelper.padding(
                            context,
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 214, 226, 255),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.location_on,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Section'),
                                  Text(
                                    sectionString.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 14,
                                      ),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        dividerConfig(),
                      ],

                      // CustomFieldTile(
                      //   icon: Icons.business_center,
                      //   title: 'Equipment',
                      //   titleDetails: selectedEquipment.isEmpty
                      //       ? 'Choose tools'
                      //       : '${selectedEquipment.length} equipment added',
                      //   isFilled: selectedEquipment.isNotEmpty,
                      //   onTap: () async {},
                      //   isRequired: true,
                      // ),

                      // Submit Button
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // final companyState = _companyBloc.state;
                            // if (companyState is CompanyLoaded &&
                            //     companyState.selectedCompany != null) {
                            //   _dailyReportCreateBloc.add(
                            //     SubmitReport(
                            //       companyUID:
                            //           companyState.selectedCompany!.uid,
                            //     ),
                            //   );
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: ResponsiveHelper.padding(
                              context,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
