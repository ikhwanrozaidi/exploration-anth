import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../domain/entities/warning.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(20),
        height: isExpanded
            ? ResponsiveHelper.getHeight(context, 0.5)
            : ResponsiveHelper.getHeight(context, 0.08),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      '${widget.warning.warningItems.length} Warnings',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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

            // Expanded Content
            if (isExpanded) ...[
              dividerConfig(),

              Expanded(
                child: ListView.separated(
                  itemCount: widget.warning.warningItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = widget.warning.warningItems[index];
                    return Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.redAccent.shade200,
                            Colors.redAccent.shade100.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Warning',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),

                              Text(
                                'Resolve by: null date',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          Divider(
                            height: ResponsiveHelper.spacing(context, 25),
                            thickness: 0.5,
                            color: Colors.white,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.info, color: Colors.white),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        item.warningReason?.name ?? 'Unknown',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 14,
                                          ),
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: ResponsiveHelper.spacing(context, 15),
                                ),

                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showStatusSelection(
                                        context: context,
                                        currentStatus: item.isCompleted
                                            ? 'Closed / Resolved'
                                            : 'No Action Yet',
                                        onStatusSelected: (selectedStatus) {
                                          print(
                                            'Selected status: $selectedStatus',
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: ResponsiveHelper.padding(
                                        context,
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              item.isCompleted
                                                  ? 'Resolved'
                                                  : 'Pending Action',
                                              style: TextStyle(
                                                color: item.isCompleted
                                                    ? greenAccent
                                                    : Colors.redAccent,
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 13,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.expand_more),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
