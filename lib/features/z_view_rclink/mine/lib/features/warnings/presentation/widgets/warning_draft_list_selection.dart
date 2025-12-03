import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/template_page.dart';
import '../../domain/entities/warning_category.dart';
import '../../domain/repositories/warning_categories_repository.dart';

class WarningDraftListSelection extends StatefulWidget {
  final List<WarningCategoryWithReasons> categories;
  final List<String> initialSelectedUIDs;
  final int? workScopeID;

  const WarningDraftListSelection({
    Key? key,
    required this.categories,
    this.workScopeID,
    this.initialSelectedUIDs = const [],
  }) : super(key: key);

  @override
  State<WarningDraftListSelection> createState() =>
      _WarningDraftListSelectionState();
}

class _WarningDraftListSelectionState extends State<WarningDraftListSelection> {
  late Set<String> _selectedReasonUIDs;
  final Set<String> _expandedCategories = {};

  @override
  void initState() {
    super.initState();
    _selectedReasonUIDs = Set.from(widget.initialSelectedUIDs);
  }

  /// Filter categories to only show reasons matching the work scope ID
  List<WarningCategoryWithReasons> get _filteredCategories {
    if (widget.workScopeID == null) {
      return widget.categories;
    }

    return widget.categories
        .map((categoryWithReasons) {
          // Filter reasons to only include those matching the work scope ID
          final filteredReasons = categoryWithReasons.reasons
              .where((reason) => reason.workScopeID == widget.workScopeID)
              .toList();

          // Return a new WarningCategoryWithReasons with filtered reasons
          return WarningCategoryWithReasons(
            category: categoryWithReasons.category,
            reasons: filteredReasons,
          );
        })
        .where((categoryWithReasons) => categoryWithReasons.reasons.isNotEmpty)
        .toList();
  }

  void _toggleCategoryExpansion(String categoryUID) {
    setState(() {
      if (_expandedCategories.contains(categoryUID)) {
        _expandedCategories.remove(categoryUID);
      } else {
        _expandedCategories.add(categoryUID);
      }
    });
  }

  void _toggleReasonSelection(String reasonUID) {
    setState(() {
      if (_selectedReasonUIDs.contains(reasonUID)) {
        _selectedReasonUIDs.remove(reasonUID);
      } else {
        _selectedReasonUIDs.add(reasonUID);
      }
    });
  }

  void _confirmSelection() {
    Navigator.pop(context, _selectedReasonUIDs.toList());
  }

  int _getSelectedCountForCategory(
    WarningCategoryWithReasons categoryWithReasons,
  ) {
    return categoryWithReasons.reasons
        .where((reason) => _selectedReasonUIDs.contains(reason.uid))
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Warning Lists',
      body: Column(
        children: [
          // // Selected count banner
          // if (_selectedReasonUIDs.isNotEmpty)
          //   Container(
          //     width: double.infinity,
          //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          //     decoration: BoxDecoration(
          //       color: primaryColor.withOpacity(0.1),
          //       border: Border(
          //         bottom: BorderSide(
          //           color: primaryColor.withOpacity(0.3),
          //           width: 1,
          //         ),
          //       ),
          //     ),
          //     child: Text(
          //       '${_selectedReasonUIDs.length} warning${_selectedReasonUIDs.length > 1 ? 's' : ''} selected',
          //       style: TextStyle(
          //         color: primaryColor,
          //         fontSize: ResponsiveHelper.fontSize(context, base: 14),
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ),

          // Categories list
          Expanded(
            child: _filteredCategories.isEmpty
                ? Center(
                    child: Text(
                      'No warning categories available',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemCount: _filteredCategories.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    itemBuilder: (context, index) {
                      final categoryWithReasons = _filteredCategories[index];
                      final category = categoryWithReasons.category;
                      final isExpanded = _expandedCategories.contains(
                        category.uid,
                      );
                      final selectedCount = _getSelectedCountForCategory(
                        categoryWithReasons,
                      );

                      return Column(
                        children: [
                          // Category header
                          InkWell(
                            onTap: () => _toggleCategoryExpansion(category.uid),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              child: Row(
                                children: [
                                  // Expand/collapse icon
                                  Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    color: Colors.black,
                                    size: ResponsiveHelper.iconSize(
                                      context,
                                      base: 24,
                                    ),
                                  ),
                                  SizedBox(width: 12),

                                  // Category name and count
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.name,
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 15,
                                            ),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '${categoryWithReasons.reasons.length} warning${categoryWithReasons.reasons.length > 1 ? 's' : ''}',
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 12,
                                            ),
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Selected count badge
                                  if (selectedCount > 0)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '$selectedCount',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 12,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),

                          // Reasons list (expanded)
                          if (isExpanded)
                            Container(
                              color: Colors.grey.shade50,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: categoryWithReasons.reasons.length,
                                itemBuilder: (context, reasonIndex) {
                                  final reason =
                                      categoryWithReasons.reasons[reasonIndex];
                                  final isSelected = _selectedReasonUIDs
                                      .contains(reason.uid);

                                  return CheckboxListTile(
                                    value: isSelected,
                                    onChanged: (value) {
                                      _toggleReasonSelection(reason.uid);
                                    },
                                    title: Text(
                                      reason.name,
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.fontSize(
                                          context,
                                          base: 14,
                                        ),
                                        color: Colors.black87,
                                      ),
                                    ),
                                    activeColor: primaryColor,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    dense: true,
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    },
                  ),
          ),

          // Confirm button
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _selectedReasonUIDs.isNotEmpty
                        ? _confirmSelection
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      disabledBackgroundColor: Colors.grey.shade300,
                      padding: ResponsiveHelper.padding(context, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      _selectedReasonUIDs.isEmpty
                          ? 'Select at least one warning'
                          : 'Confirm (${_selectedReasonUIDs.length})',
                      style: TextStyle(
                        color: _selectedReasonUIDs.isEmpty
                            ? Colors.grey.shade600
                            : Colors.white,
                        fontSize: ResponsiveHelper.fontSize(context, base: 15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
