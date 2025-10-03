import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';

class QuantitySegmentBreakdownPage extends StatefulWidget {
  final String quantityName;
  final Map<String, dynamic>? existingData;

  const QuantitySegmentBreakdownPage({
    Key? key,
    required this.quantityName,
    this.existingData,
  }) : super(key: key);

  @override
  State<QuantitySegmentBreakdownPage> createState() =>
      _QuantitySegmentBreakdownPageState();
}

class _QuantitySegmentBreakdownPageState
    extends State<QuantitySegmentBreakdownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(-2, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            SizedBox(width: ResponsiveHelper.spacing(context, 15)),
            Expanded(
              child: Text(
                'Segment Breakdown',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Hello World', style: TextStyle(fontSize: 24))),
    );
  }
}
