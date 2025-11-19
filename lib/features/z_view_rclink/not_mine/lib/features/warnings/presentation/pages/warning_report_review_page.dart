import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import 'package:rclink_app/shared/widgets/divider_config.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/image_viewer/image_viewer_page.dart';
import '../../../../shared/widgets/template_page.dart';
import '../../../daily_report/domain/entities/daily_report.dart';
import '../../domain/entities/warning_type.dart';
import '../bloc/create_warning_bloc.dart';
import '../bloc/create_warning_event.dart';
import '../bloc/create_warning_state.dart';
import '../bloc/warning_categories_bloc.dart';
import '../bloc/warning_categories_event.dart';
import '../bloc/warning_categories_state.dart';
import '../widgets/quantity_list_fromwarning.dart';

class WarningReportReviewPage extends StatefulWidget {
  final DailyReport report;

  const WarningReportReviewPage({super.key, required this.report});

  @override
  State<WarningReportReviewPage> createState() =>
      _WarningReportReviewPageState();
}

class _WarningReportReviewPageState extends State<WarningReportReviewPage> {
  final TextEditingController _notesController = TextEditingController();
  final FocusNode _notesFocusNode = FocusNode();

  // Dynamic state management
  // Map<categoryUID, Set<reasonUID>> for tracking selected warnings per category
  final Map<String, Set<String>> _selectedWarningsByCategory = {};

  // Set of expanded category UIDs
  final Set<String> _expandedCategories = {};

  @override
  void initState() {
    super.initState();
    // Trigger load if categories are not already loaded
    final state = context.read<WarningCategoriesBloc>().state;
    if (state is WarningCategoriesInitial) {
      context.read<WarningCategoriesBloc>().add(
            const WarningCategoriesEvent.loadCategories(
              warningType: 'REPORT_WARNING',
            ),
          );
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    _notesFocusNode.dispose();
    super.dispose();
  }

  bool get _hasSelectedWarnings {
    return _selectedWarningsByCategory.values
        .any((selections) => selections.isNotEmpty);
  }

  int get _totalSelectedCount {
    return _selectedWarningsByCategory.values
        .fold(0, (total, selections) => total + selections.length);
  }

  /// Maps category names to appropriate icons
  IconData _getIconForCategory(String categoryName) {
    final normalizedName = categoryName.toLowerCase();

    if (normalizedName.contains('quality') ||
        normalizedName.contains('work')) {
      return Icons.work_outline_outlined;
    } else if (normalizedName.contains('photo') ||
        normalizedName.contains('image')) {
      return Icons.camera_alt_outlined;
    } else if (normalizedName.contains('quantity') ||
        normalizedName.contains('amount')) {
      return Icons.format_list_numbered;
    } else if (normalizedName.contains('safety') ||
        normalizedName.contains('secure')) {
      return Icons.shield_outlined;
    }

    // Default icon
    return Icons.warning_outlined;
  }

  Widget _buildWarningSection({
    required String categoryUID,
    required String categoryName,
    required List<Map<String, String>> reasons, // List of {uid, name}
  }) {
    final icon = _getIconForCategory(categoryName);
    final isExpanded = _expandedCategories.contains(categoryUID);
    final selectedWarnings = _selectedWarningsByCategory[categoryUID] ?? {};
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isExpanded) {
                _expandedCategories.remove(categoryUID);
              } else {
                _expandedCategories.add(categoryUID);
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.white, Color.fromARGB(255, 254, 238, 238)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 214, 214),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          color: Colors.red.shade700,
                          size: ResponsiveHelper.iconSize(context, base: 20),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      categoryName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color.fromARGB(255, 255, 214, 214),
                  ),
                  child: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.red.shade700,
                    size: ResponsiveHelper.iconSize(context, base: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: reasons.map((reason) {
                final reasonUID = reason['uid']!;
                final reasonName = reason['name']!;
                final isSelected = selectedWarnings.contains(reasonUID);

                return CheckboxListTile(
                  title: Text(
                    reasonName,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    ),
                  ),
                  value: isSelected,
                  activeColor: primaryColor,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      if (_selectedWarningsByCategory[categoryUID] == null) {
                        _selectedWarningsByCategory[categoryUID] = {};
                      }

                      if (value == true) {
                        _selectedWarningsByCategory[categoryUID]!.add(reasonUID);
                      } else {
                        _selectedWarningsByCategory[categoryUID]!
                            .remove(reasonUID);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageFiles =
        widget.report.files
            ?.where((f) => f.mimeType.startsWith('image/'))
            .toList() ??
        [];

    return BlocProvider(
      create: (context) => getIt<CreateWarningBloc>(),
      child: BlocListener<CreateWarningBloc, CreateWarningState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            success: (warning) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Warning report submitted successfully'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );

              // Navigate back after a short delay
              Future.delayed(Duration(milliseconds: 500), () {
                if (context.mounted) {
                  Navigator.of(context).pop(true); // Return true to indicate success
                }
              });
            },
            error: (failure) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to submit warning: ${failure.message}'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 4),
                  action: SnackBarAction(
                    label: 'DISMISS',
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              );
            },
          );
        },
        child: GestureDetector(
          onTap: () {
            // Dismiss keyboard when tapping outside
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: TemplatePage(
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: ListView(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Preview Report',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 16,
                          ),
                        ),
                      ),
                      Text(
                        'View reports by categories',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ImageViewerPage.fromPaths(
                                      paths: imageFiles
                                          .map((f) => f.s3Url)
                                          .toList(),
                                      initialIndex: 0,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Color.fromARGB(255, 238, 242, 254),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.image,
                                          color: primaryColor,
                                          size: ResponsiveHelper.iconSize(
                                            context,
                                            base: 20,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('Photos'),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor,
                                      ),
                                      child: Text(
                                        '${imageFiles.length}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: GestureDetector(
                              onTap: widget.report.reportQuantities?.length == 0
                                  ? null
                                  : () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              QuantityListFromWarning(
                                                report: widget.report,
                                              ),
                                        ),
                                      );
                                    },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Color.fromARGB(255, 238, 242, 254),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.history,
                                          color: primaryColor,
                                          size: ResponsiveHelper.iconSize(
                                            context,
                                            base: 20,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('Quantity'),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor,
                                      ),
                                      child: Text(
                                        '${widget.report.reportQuantities?.length}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Warning Remarks',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 16,
                          ),
                        ),
                      ),
                      Text(
                        'This remarks will be notify by the contractors',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Dynamic Warning Sections from BLoC
                      BlocBuilder<WarningCategoriesBloc, WarningCategoriesState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => SizedBox.shrink(),
                            loading: () => Center(
                              child: CircularProgressIndicator(),
                            ),
                            loaded: (categories) {
                              // Get report's work scope ID for filtering
                              final reportWorkScopeID = widget.report.workScopeID;

                              // Filter for REPORT_WARNING type only
                              final reportCategories = categories.where(
                                (catWithReasons) =>
                                    catWithReasons.category.warningType ==
                                    WarningType.reportWarning,
                              ).toList();

                              if (reportCategories.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: Text(
                                    'No warning categories available',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 14,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              // Build category sections with filtered reasons
                              final categoryWidgets = <Widget>[];

                              for (final catWithReasons in reportCategories) {
                                final category = catWithReasons.category;

                                // Filter reasons by work scope ID
                                final filteredReasons = catWithReasons.reasons
                                    .where((r) => r.workScopeID == reportWorkScopeID)
                                    .map((r) => {
                                          'uid': r.uid,
                                          'name': r.name,
                                        })
                                    .toList();

                                // Only show category if it has reasons for this work scope
                                if (filteredReasons.isNotEmpty) {
                                  categoryWidgets.add(
                                    Column(
                                      children: [
                                        _buildWarningSection(
                                          categoryUID: category.uid,
                                          categoryName: category.name,
                                          reasons: filteredReasons,
                                        ),
                                        SizedBox(height: 15),
                                      ],
                                    ),
                                  );
                                }
                              }

                              // If no categories have reasons for this work scope
                              if (categoryWidgets.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: Text(
                                    'No warning categories available for this work scope',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 14,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }

                              return Column(children: categoryWidgets);
                            },
                            error: (failure) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Error loading warning categories',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    failure.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 12,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // Notes Section
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Color.fromARGB(255, 254, 238, 238),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 214, 214),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.note_alt_outlined,
                                      color: Colors.red.shade700,
                                      size: ResponsiveHelper.iconSize(
                                        context,
                                        base: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Notes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            dividerConfig(),
                            TextField(
                              controller: _notesController,
                              focusNode: _notesFocusNode,
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Enter your notes here...',
                                hintStyle: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 13,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<CreateWarningBloc, CreateWarningState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );

                        return ElevatedButton(
                          onPressed: (_hasSelectedWarnings && !isLoading)
                              ? () {
                                  // Flatten all selected reason UIDs into a single list
                                  final allReasonUIDs = _selectedWarningsByCategory.values
                                      .expand((reasonUIDs) => reasonUIDs)
                                      .toList();

                                  // Dispatch BLoC event to create warning
                                  context.read<CreateWarningBloc>().add(
                                        CreateWarningEvent.createWarning(
                                          dailyReportUID: widget.report.uid,
                                          warningReasonUIDs: allReasonUIDs,
                                          description: _notesController.text.trim().isNotEmpty
                                              ? _notesController.text.trim()
                                              : null,
                                        ),
                                      );
                                }
                              : null,
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
                          child: isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : Text(
                                  _hasSelectedWarnings
                                      ? 'Submit Warning ($_totalSelectedCount)'
                                      : 'Submit Warning',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
          ),
        ),
      ),
    );
  }
}
