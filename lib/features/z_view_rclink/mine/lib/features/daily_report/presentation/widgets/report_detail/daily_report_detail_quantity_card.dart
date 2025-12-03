import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../domain/entities/report_quantity.dart';
import '../../../domain/entities/quantity_value_response.dart';

/// Quantity card for daily report detail page
///
/// Displays quantity values in a swipeable paginated view:
/// - Shows quantity type name
/// - Groups quantity values into pages of 3 items
/// - Swipeable PageView with page indicators
/// - Shows page counter (1/3) when multiple pages
/// - Each item displays field name, value, and unit
class DailyReportDetailQuantityCard extends StatefulWidget {
  final ReportQuantity reportQuantity;

  const DailyReportDetailQuantityCard({
    Key? key,
    required this.reportQuantity,
  }) : super(key: key);

  @override
  State<DailyReportDetailQuantityCard> createState() =>
      _DailyReportDetailQuantityCardState();
}

class _DailyReportDetailQuantityCardState
    extends State<DailyReportDetailQuantityCard> {
  int _currentPage = 0;

  /// Builds quantity pages by grouping values into sets of 3
  List<Map<String, dynamic>> _buildQuantityPages(
    List<QuantityValueResponse> quantityValues,
  ) {
    List<Map<String, dynamic>> pages = [];

    // Split quantityValues into pages of 3 items each
    for (int i = 0; i < quantityValues.length; i += 3) {
      Map<String, dynamic> pageData = {};

      // Add up to 3 items per page
      for (int j = 0; j < 3 && (i + j) < quantityValues.length; j++) {
        final qv = quantityValues[i + j];
        pageData[qv.quantityField.name] = {
          'value': qv.value,
          'unit': qv.quantityField.unit,
        };
      }

      pages.add(pageData);
    }

    return pages;
  }

  /// Builds content for a single page
  Widget _buildPageContent(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key, // Field name
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${entry.value['value']} ${entry.value['unit'] ?? ''}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quantityPages = _buildQuantityPages(
      widget.reportQuantity.quantityValues,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with quantity type name and page counter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.reportQuantity.quantityType.name,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(
                      context,
                      base: 14,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (quantityPages.length > 1)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${_currentPage + 1}/${quantityPages.length}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),

          dividerConfig(),

          // Swipeable PageView
          SizedBox(
            width: double.infinity,
            height: 160,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: quantityPages.length,
              itemBuilder: (context, index) {
                return _buildPageContent(quantityPages[index]);
              },
            ),
          ),

          // Page indicators
          if (quantityPages.length > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                quantityPages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.black87
                        : Colors.grey.withOpacity(0.4),
                  ),
                ),
              ),
            ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
