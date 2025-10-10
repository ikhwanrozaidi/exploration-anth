import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../../company/presentation/bloc/company_bloc.dart';
import '../../../../../company/presentation/bloc/company_state.dart';
import '../../../../domain/entities/daily_report_response.dart';
import '../../../bloc/daily_report_bloc.dart';
import '../../../bloc/daily_report_event.dart';
import '../quantity_card.dart';

class QuantityEditPage extends StatefulWidget {
  final DailyReportResponse report;

  const QuantityEditPage({Key? key, required this.report}) : super(key: key);

  @override
  State<QuantityEditPage> createState() => _QuantityEditPageState();
}

class _QuantityEditPageState extends State<QuantityEditPage> {
  final Map<String, List<Map<String, String>>> _changes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),

              IconButton(
                style: IconButton.styleFrom(
                  elevation: 2,
                  shadowColor: Colors.black,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              SizedBox(height: 13),
              Text(
                'Quantity',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                'Update the information below if required.',
                style: TextStyle(fontSize: 13),
              ),

              SizedBox(height: 30),

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.report.reportQuantities?.length ?? 0,
                        itemBuilder: (context, index) {
                          final reportQuantity =
                              widget.report.reportQuantities![index];
                          return QuantityCard(
                            reportQuantity: reportQuantity,
                            onValueChanged: (quantityTypeUID, fieldUID, value) {
                              // store the changed values in a map
                              setState(() {
                                final existingList =
                                    _changes[quantityTypeUID] ?? [];
                                final index = existingList.indexWhere(
                                  (item) =>
                                      item["quantityFieldUID"] == fieldUID,
                                );

                                if (index != -1) {
                                  existingList[index]["value"] = value;
                                } else {
                                  existingList.add({
                                    "quantityFieldUID": fieldUID,
                                    "value": value,
                                  });
                                }

                                _changes[quantityTypeUID] = existingList;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: ResponsiveHelper.spacing(context, 2)),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final companyBloc = context.read<CompanyBloc>();
                          final companyState = companyBloc.state;

                          if (companyState is! CompanyLoaded ||
                              companyState.selectedCompany == null) {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text('Company not selected')),
                            // );
                            return;
                          }
                          final payload = {
                            "quantities": _changes.entries
                                .map(
                                  (entry) => {
                                    "quantityTypeUID": entry.key,
                                    "quantityValues": entry.value,
                                  },
                                )
                                .toList(),
                          };

                          context.read<DailyReportBloc>().add(
                            DailyReportEvent.updateDailyReport(
                              companyUID: companyState.selectedCompany!.uid,
                              dailyReportUID: widget.report.uid,
                              updateData: payload,
                            ),
                          );

                          // debugPrint(payload.toString());
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text(
                          //       "Changes saved! Check console output.",
                          //     ),
                          //   ),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          disabledBackgroundColor: Colors.grey[300],
                          padding: ResponsiveHelper.padding(
                            context,
                            vertical: 10,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: ResponsiveHelper.borderRadius(
                              context,
                              all: 14,
                            ),
                          ),
                          elevation: ResponsiveHelper.adaptive(
                            context,
                            mobile: 1,
                            tablet: 2,
                            desktop: 3,
                          ),
                        ),
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveHelper.spacing(context, 2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
