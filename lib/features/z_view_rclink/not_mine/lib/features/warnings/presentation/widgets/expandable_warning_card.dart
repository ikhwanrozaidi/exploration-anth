import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/warning.dart';
import '../../domain/entities/warning_item.dart';
import '../bloc/warning_view/warning_bloc.dart';
import '../bloc/warning_view/warning_event.dart';
import '../bloc/warning_view/warning_state.dart';
import '../widgets/show_status_selection.dart';

class ExpandableWarningCard extends StatefulWidget {
  final Warning warning;

  const ExpandableWarningCard({Key? key, required this.warning})
    : super(key: key);

  @override
  State<ExpandableWarningCard> createState() => _ExpandableWarningCardState();
}

class _ExpandableWarningCardState extends State<ExpandableWarningCard> {
  bool isExpanded = false;
  Set<String> resolvingItems = {};
  late Warning currentWarning;
  late WarningBloc _warningBloc;

  @override
  void initState() {
    super.initState();
    currentWarning = widget.warning;
    _warningBloc = getIt<WarningBloc>();
    print(
      '🔴 [ExpandableWarningCard] initState - BLoC instance: ${_warningBloc.hashCode}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WarningBloc, WarningState>(
      bloc: _warningBloc,
      listener: (context, state) {
        print(
          '🔴 [ExpandableWarningCard] BLoC state changed: ${state.runtimeType}',
        );

        if (state is WarningItemResolved || state is WarningLoaded) {
          Warning? updatedWarning;

          if (state is WarningItemResolved) {
            print(
              '🔴 [ExpandableWarningCard] ItemResolved state has ${state.warnings.length} warnings',
            );
            print(
              '🔴 [ExpandableWarningCard] Looking for warning UID: ${widget.warning.uid}',
            );
            print(
              '🔴 [ExpandableWarningCard] Available UIDs: ${state.warnings.map((w) => w.uid).join(", ")}',
            );
            updatedWarning = state.warnings.firstWhere(
              (w) => w.uid == widget.warning.uid,
              orElse: () => currentWarning,
            );
          } else if (state is WarningLoaded) {
            updatedWarning = state.warnings.firstWhere(
              (w) => w.uid == widget.warning.uid,
              orElse: () => currentWarning,
            );
          }

          if (updatedWarning != null) {
            print('🔴 [ExpandableWarningCard] Updating local warning copy');
            setState(() {
              currentWarning = updatedWarning!;
              if (state is WarningItemResolved) {
                resolvingItems.remove(state.resolvedItemUID);
              }
            });
          }
        } else if (state is WarningError) {
          print(
            '❌ [ExpandableWarningCard] Error occurred, clearing loading state',
          );
          // Error - clear resolving state and show error
          setState(() {
            resolvingItems.clear();
          });
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.failure.message)));
          }
        }
      },
      buildWhen: (previous, current) {
        // Don't rebuild the entire widget tree on state changes
        // We handle UI updates via listener + local setState
        return false;
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${currentWarning.warningItems.length} Warnings',
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            // Summary counts
                            Builder(
                              builder: (context) {
                                final pendingCount = currentWarning.warningItems
                                    .where((item) => !item.isCompleted)
                                    .length;
                                final resolvedCount = currentWarning
                                    .warningItems
                                    .where((item) => item.isCompleted)
                                    .length;

                                return Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ), // Align with text above
                                    if (pendingCount > 0) ...[
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        size: 12,
                                        color: Colors.amber.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '$pendingCount pending',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 11,
                                          ),
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                    if (pendingCount > 0 && resolvedCount > 0)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                        ),
                                        child: Text(
                                          '•',
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ),
                                    if (resolvedCount > 0) ...[
                                      Icon(
                                        Icons.check_circle,
                                        size: 12,
                                        color: Colors.green.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '$resolvedCount resolved',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 11,
                                          ),
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color.fromARGB(255, 214, 226, 255),
                          ),
                          child: Icon(
                            Icons.expand_more,
                            color: Theme.of(context).primaryColor,
                            size: ResponsiveHelper.iconSize(context, base: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Expanded Content
                if (isExpanded) ...[
                  dividerConfig(),

                  Builder(
                    builder: (context) {
                      // Group warning items by category (map literal preserves insertion order)
                      final groupedByCategory = <String, List<WarningItem>>{};
                      for (var item in currentWarning.warningItems) {
                        final categoryName =
                            item.warningReason?.category?.name ??
                            'Uncategorized';
                        groupedByCategory
                            .putIfAbsent(categoryName, () => [])
                            .add(item);
                      }

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (var categoryEntry
                              in groupedByCategory.entries) ...[
                            if (groupedByCategory.keys.toList().indexOf(
                                  categoryEntry.key,
                                ) >
                                0)
                              const SizedBox(height: 12),
                            Builder(
                              builder: (context) {
                                final categoryName = categoryEntry.key;
                                final categoryItems = categoryEntry.value;

                                // Count pending and resolved items
                                final pendingCount = categoryItems
                                    .where((item) => !item.isCompleted)
                                    .length;
                                final resolvedCount = categoryItems
                                    .where((item) => item.isCompleted)
                                    .length;

                                return Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.06,
                                        ),
                                        offset: Offset(0, 2),
                                        blurRadius: 8,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Category Header with icon and badge
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            // Category icon
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Icon(
                                                Icons.warning_amber_rounded,
                                                size: 20,
                                                color: Colors.blue.shade700,
                                              ),
                                            ),
                                            SizedBox(width: 12),

                                            // Category name
                                            Expanded(
                                              child: Text(
                                                categoryName,
                                                style: TextStyle(
                                                  fontSize:
                                                      ResponsiveHelper.fontSize(
                                                        context,
                                                        base: 16,
                                                      ),
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ),

                                            // Count badge
                                            if (pendingCount > 0)
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.amber.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  '$pendingCount',
                                                  style: TextStyle(
                                                    fontSize:
                                                        ResponsiveHelper.fontSize(
                                                          context,
                                                          base: 12,
                                                        ),
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        Colors.amber.shade900,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),

                                      // Warning Items in this category
                                      ...categoryItems.asMap().entries.map((
                                        itemEntry,
                                      ) {
                                        final itemIndex = itemEntry.key;
                                        final item = itemEntry.value;

                                        return Column(
                                          children: [
                                            if (itemIndex > 0)
                                              Divider(
                                                height: 1,
                                                thickness: 1,
                                                color: Colors.grey.shade100,
                                                indent: 16,
                                                endIndent: 16,
                                              ),

                                            // Warning Item Content
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 16,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Warning Reason Name with status icon
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Status icon (replaces bullet point)
                                                      Icon(
                                                        item.isCompleted
                                                            ? Icons.check_circle
                                                            : Icons
                                                                  .warning_amber_rounded,
                                                        size: 18,
                                                        color: item.isCompleted
                                                            ? Colors
                                                                  .green
                                                                  .shade600
                                                            : Colors
                                                                  .amber
                                                                  .shade600,
                                                      ),
                                                      SizedBox(width: 12),
                                                      Expanded(
                                                        child: Text(
                                                          item
                                                                  .warningReason
                                                                  ?.name ??
                                                              'Unknown',
                                                          style: TextStyle(
                                                            fontSize:
                                                                ResponsiveHelper.fontSize(
                                                                  context,
                                                                  base: 15,
                                                                ),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .grey
                                                                .shade900,
                                                            height: 1.4,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height:
                                                        ResponsiveHelper.spacing(
                                                          context,
                                                          12,
                                                        ),
                                                  ),

                                                  // Action Button for this item (only show if not completed)
                                                  if (!item.isCompleted)
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                        onPressed:
                                                            resolvingItems
                                                                .contains(
                                                                  item.uid,
                                                                )
                                                            ? null
                                                            : () {
                                                                // Get company UID from CompanyBloc
                                                                final companyState =
                                                                    context
                                                                        .read<
                                                                          CompanyBloc
                                                                        >()
                                                                        .state;
                                                                if (companyState
                                                                        is CompanyLoaded &&
                                                                    companyState
                                                                            .selectedCompany !=
                                                                        null) {
                                                                  final companyUID =
                                                                      companyState
                                                                          .selectedCompany!
                                                                          .uid;

                                                                  showStatusSelection(
                                                                    context:
                                                                        context,
                                                                    currentStatus:
                                                                        item.isCompleted
                                                                        ? 'Closed / Resolved'
                                                                        : 'No Action Yet',
                                                                    onStatusSelected:
                                                                        (
                                                                          selectedStatus,
                                                                        ) {
                                                                          if (selectedStatus ==
                                                                              'Closed / Resolved') {
                                                                            print(
                                                                              '🔴 [ExpandableWarningCard] Resolve button tapped',
                                                                            );
                                                                            print(
                                                                              '   warningUID: ${widget.warning.uid}',
                                                                            );
                                                                            print(
                                                                              '   itemUID: ${item.uid}',
                                                                            );

                                                                            // Mark as resolving
                                                                            setState(() {
                                                                              resolvingItems.add(
                                                                                item.uid,
                                                                              );
                                                                            });

                                                                            print(
                                                                              '🔴 [ExpandableWarningCard] Dispatching event to BLoC (${_warningBloc.hashCode})...',
                                                                            );
                                                                            // Trigger resolve action via injected BLoC
                                                                            _warningBloc.add(
                                                                              WarningEvent.resolveWarningItem(
                                                                                companyUID: companyUID,
                                                                                warningUID: currentWarning.uid,
                                                                                itemUID: item.uid,
                                                                                notes: null,
                                                                              ),
                                                                            );
                                                                            print(
                                                                              '🔴 [ExpandableWarningCard] Event dispatched',
                                                                            );
                                                                            // State will be cleared by BlocListener when response arrives
                                                                          }
                                                                        },
                                                                  );
                                                                }
                                                              },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .grey
                                                                  .shade100,
                                                          foregroundColor:
                                                              Colors
                                                                  .green
                                                                  .shade700,
                                                          disabledBackgroundColor:
                                                              Colors
                                                                  .grey
                                                                  .shade200,
                                                          disabledForegroundColor:
                                                              Colors
                                                                  .grey
                                                                  .shade500,
                                                          padding:
                                                              ResponsiveHelper.padding(
                                                                context,
                                                                vertical: 10,
                                                                horizontal: 16,
                                                              ),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  8,
                                                                ),
                                                          ),
                                                          elevation: 0,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (resolvingItems
                                                                .contains(
                                                                  item.uid,
                                                                ))
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(
                                                                      right:
                                                                          8.0,
                                                                    ),
                                                                child: SizedBox(
                                                                  width: 14,
                                                                  height: 14,
                                                                  child: CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        2,
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                          Color
                                                                        >(
                                                                          Colors
                                                                              .green
                                                                              .shade700,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Text(
                                                              resolvingItems
                                                                      .contains(
                                                                        item.uid,
                                                                      )
                                                                  ? 'Resolving...'
                                                                  : 'Mark as Resolved',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    ResponsiveHelper.fontSize(
                                                                      context,
                                                                      base: 13,
                                                                    ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
