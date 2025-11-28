import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/widgets/custom_snackbar.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../daily_report/presentation/bloc/daily_report_create/daily_report_create_bloc.dart';
import '../../../daily_report/presentation/bloc/daily_report_create/daily_report_create_event.dart';
import '../../../daily_report/presentation/bloc/daily_report_create/daily_report_create_state.dart';
import '../../../daily_report/presentation/constant/field_enhancements.dart';
import '../../../daily_report/presentation/widgets/report_creation/selection_field_card.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/pages/road_field_tile.dart';
import '../../../work_scope/presentation/pages/work_scope_field_tile.dart';

/// Form container with all selection fields
class WarningCreationForm extends StatefulWidget {
  const WarningCreationForm({Key? key}) : super(key: key);

  @override
  State<WarningCreationForm> createState() => _WarningCreationFormState();
}

class _WarningCreationFormState extends State<WarningCreationForm> {
  final TextEditingController _sectionController = TextEditingController();

  String selectedScopeDisplay = '';
  String selectedWeatherDisplay = '';
  String selectedLocationDisplay = '';

  @override
  void dispose() {
    _sectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Scope of Work
        WorkScopeFieldTile(
          onScopeSelected: (selectedData) {
            print(
              'Allow Multiple Quantities: ${selectedData['allowMultipleQuantities']}',
            );
            // context.read<DailyReportCreateBloc>().add(
            //   SelectScope(selectedData['uid']),
            // );

            setState(() {
              selectedScopeDisplay = selectedData['displayText'];
            });
          },
        ),

        // Roads
        RoadFieldTile(
          startFrom: RoadLevel.provinces,
          endAt: RoadLevel.roads,
          onRoadSelected: (RoadSelectionResult result) {
            // context.read<DailyReportCreateBloc>().add(
            //   DailyReportCreateEvent.selectLocationFromResult(
            //     province: result.selectedProvince!,
            //     district: result.selectedDistrict!,
            //     road: result.selectedRoad!,
            //   ),
            // );

            setState(() {
              selectedLocationDisplay = result.selectedRoad?.roadNo != null
                  ? '${result.selectedRoad!.name!} (${result.selectedRoad!.roadNo!})'
                  : result.selectedRoad!.name!;
            });
          },
        ),

        // // Sections
        // Container(
        //   margin: const EdgeInsets.only(bottom: 15),
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       color: hasError ? Colors.red : Colors.grey.shade400,
        //       width: 0.5,
        //     ),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Expanded(
        //         child: Row(
        //           children: [
        //             Container(
        //               padding: const EdgeInsets.all(12),
        //               decoration: BoxDecoration(
        //                 color: hasError
        //                     ? Colors.red.shade50
        //                     : const Color.fromARGB(255, 214, 226, 255),
        //                 shape: BoxShape.circle,
        //               ),
        //               child: Center(
        //                 child: Icon(
        //                   Icons.swap_calls,
        //                   color: hasError ? Colors.red : primaryColor,
        //                 ),
        //               ),
        //             ),
        //             const SizedBox(width: 20),
        //             Expanded(
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     'Section',
        //                     style: TextStyle(
        //                       color: hasError
        //                           ? Colors.red.shade600
        //                           : Colors.black,
        //                     ),
        //                   ),
        //                   const SizedBox(height: 5),
        //                   TextField(
        //                     controller: _sectionController,
        //                     onChanged: (value) {
        //                       context.read<DailyReportCreateBloc>().add(
        //                         UpdateSection(value),
        //                       );
        //                     },
        //                     keyboardType: const TextInputType.numberWithOptions(
        //                       decimal: true,
        //                     ),
        //                     decoration: InputDecoration(
        //                       isDense: true,
        //                       hintText: "Type section",
        //                       contentPadding: const EdgeInsets.symmetric(
        //                         horizontal: 12,
        //                         vertical: 8,
        //                       ),
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(8.0),
        //                         borderSide: BorderSide(
        //                           color: Colors.grey.shade300,
        //                           width: 1,
        //                         ),
        //                       ),
        //                       enabledBorder: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(8.0),
        //                         borderSide: BorderSide(
        //                           color: Colors.grey.shade300,
        //                           width: 1,
        //                         ),
        //                       ),
        //                       focusedBorder: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(8.0),
        //                         borderSide: BorderSide(
        //                           color: hasError
        //                               ? Colors.red
        //                               : const Color(0xFF5B7FFF),
        //                           width: 1.5,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                   const SizedBox(height: 5),
        //                   Builder(
        //                     builder: (context) {
        //                       final selectedRoad = selections?.selectedRoad;

        //                       if (selectedRoad?.sectionStart != null &&
        //                           selectedRoad?.sectionFinish != null) {
        //                         return Text(
        //                           'Range from ${selectedRoad!.sectionStart} - ${selectedRoad.sectionFinish}',
        //                           style: TextStyle(
        //                             fontWeight: hasError
        //                                 ? FontWeight.bold
        //                                 : FontWeight.normal,
        //                             fontSize: ResponsiveHelper.fontSize(
        //                               context,
        //                               base: 10,
        //                             ),
        //                             color: hasError ? Colors.red : Colors.black,
        //                           ),
        //                         );
        //                       }
        //                       return const SizedBox.shrink();
        //                     },
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
