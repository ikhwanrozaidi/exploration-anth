import 'package:flutter/material.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../domain/entities/daily_report.dart';

class EquipmentEditPage extends StatefulWidget {
  final DailyReport report;

  const EquipmentEditPage({Key? key, required this.report}) : super(key: key);

  @override
  State<EquipmentEditPage> createState() => _EquipmentEditPageState();
}

class _EquipmentEditPageState extends State<EquipmentEditPage> {
  final TextEditingController _sectionController = TextEditingController();

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
                'Edit Equipment/ Vehicle/ Machine',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                'Update the information below if required.',
                style: TextStyle(fontSize: 13),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
