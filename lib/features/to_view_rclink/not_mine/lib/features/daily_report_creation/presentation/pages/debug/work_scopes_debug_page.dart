import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../bloc/report_creation_bloc.dart';
import '../../bloc/report_creation_event.dart';
import '../../bloc/report_creation_state.dart';

class WorkScopesDebugPage extends StatelessWidget {
  const WorkScopesDebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCreationBloc(
        {}, // Empty scope configurations for now
        getIt(), // GetWorkScopesUseCase
        getIt(), // ClearWorkScopesCacheUseCase
      ),
      child: const _WorkScopesDebugView(),
    );
  }
}

class _WorkScopesDebugView extends StatelessWidget {
  const _WorkScopesDebugView();

  void _printWorkScopesStructure(List workScopes) {
    print('🔍 ===== DATABASE STRUCTURE DEBUG =====');
    print('📊 Total Work Scopes Found: ${workScopes.length}');
    print('');

    for (int i = 0; i < workScopes.length; i++) {
      final scope = workScopes[i];
      print('🏗️ [$i] WORK SCOPE: ${scope.name}');
      print('   📋 UID: ${scope.uid}');
      print('   🏷️ Code: ${scope.code}');
      print('   📝 Description: ${scope.description}');
      print('   🔢 Company ID: ${scope.companyID}');
      print('   ✅ Allow Multiple Quantities: ${scope.allowMultipleQuantities}');
      print('   📅 Created: ${scope.createdAt}');
      print('   📅 Updated: ${scope.updatedAt}');
      print('');

      // Print Work Equipments
      if (scope.workEquipments != null && scope.workEquipments.isNotEmpty) {
        print('   🔧 WORK EQUIPMENTS (${scope.workEquipments.length}):');
        for (int j = 0; j < scope.workEquipments.length; j++) {
          final equipment = scope.workEquipments[j];
          print('      [$j] ${equipment.name}');
          print('          UID: ${equipment.uid}');
          print('          Code: ${equipment.code}');
          print('          ID: ${equipment.id}');
        }
        print('');
      } else {
        print('   🔧 WORK EQUIPMENTS: None');
        print('');
      }

      // Print Work Quantity Types
      if (scope.workQuantityTypes != null &&
          scope.workQuantityTypes.isNotEmpty) {
        print('   📏 WORK QUANTITY TYPES (${scope.workQuantityTypes.length}):');
        for (int k = 0; k < scope.workQuantityTypes.length; k++) {
          final quantityType = scope.workQuantityTypes[k];
          print('      [$k] ${quantityType.name}');
          print('          UID: ${quantityType.uid}');
          print('          Code: ${quantityType.code}');
          print('          Display Order: ${quantityType.displayOrder}');
          print(
            '          Has Segment Breakdown: ${quantityType.hasSegmentBreakdown}',
          );
          print('          Segment Size: ${quantityType.segmentSize}');
          print(
            '          Max Segment Length: ${quantityType.maxSegmentLength}',
          );

          // Print Quantity Fields
          if (quantityType.quantityFields != null &&
              quantityType.quantityFields.isNotEmpty) {
            print(
              '          📋 QUANTITY FIELDS (${quantityType.quantityFields.length}):',
            );
            for (int l = 0; l < quantityType.quantityFields.length; l++) {
              final field = quantityType.quantityFields[l];
              print('             [$l] ${field.name}');
              print('                 UID: ${field.uid}');
              print('                 Code: ${field.code}');
              print('                 Field Type: ${field.fieldType}');
              print('                 Unit: ${field.unit}');
              print('                 Display Order: ${field.displayOrder}');
              print('                 Is Required: ${field.isRequired}');
              print('                 Is For Segment: ${field.isForSegment}');
              print('                 Default Value: ${field.defaultValue}');
              print('                 Placeholder: ${field.placeholder}');
              print('                 Help Text: ${field.helpText}');
              print(
                '                 Validation Rules: ${field.validationRules}',
              );

              // Print Dropdown Options
              if (field.dropdownOptions != null &&
                  field.dropdownOptions.isNotEmpty) {
                print(
                  '                 🔽 DROPDOWN OPTIONS (${field.dropdownOptions.length}):',
                );
                for (int m = 0; m < field.dropdownOptions.length; m++) {
                  final option = field.dropdownOptions[m];
                  print('                    [$m] ${option.value}');
                  print('                        UID: ${option.uid}');
                  print(
                    '                        Display Order: ${option.displayOrder}',
                  );
                  print('                        ID: ${option.id}');
                }
              } else {
                print('                 🔽 DROPDOWN OPTIONS: None');
              }
              print('');
            }
          } else {
            print('          📋 QUANTITY FIELDS: None');
          }
          print('');
        }
      } else {
        print('   📏 WORK QUANTITY TYPES: None');
      }

      print('🔹 ================================================');
      print('');
    }
    print('✅ ===== END DATABASE STRUCTURE DEBUG =====');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Work Scopes Database Debug',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 18),
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: BlocListener<ReportCreationBloc, ReportCreationState>(
        listener: (context, state) {
          if (state.workScopes != null && state.workScopes!.isNotEmpty) {
            _printWorkScopesStructure(state.workScopes!);
          }

          if (state.workScopesError != null) {
            print('❌ ERROR: ${state.workScopesError}');
          }

          if (state.isLoadingWorkScopes) {
            print('⏳ Loading work scopes...');
          }
        },
        child: Center(
          child: Padding(
            padding: ResponsiveHelper.padding(context, all: 24),
            child: ElevatedButton(
              onPressed: () {
                print('🚀 Fetching work scopes...');
                context.read<ReportCreationBloc>().add(
                  LoadWorkScopesEvent(forceRefresh: true),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: ResponsiveHelper.padding(context, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Fetch & Print Database Structure',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 16),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
