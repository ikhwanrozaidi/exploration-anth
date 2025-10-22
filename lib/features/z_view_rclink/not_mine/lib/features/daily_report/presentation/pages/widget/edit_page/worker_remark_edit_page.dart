import 'package:flutter/material.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../domain/entities/daily_report.dart';

class WorkerRemarkEditPage extends StatefulWidget {
  final DailyReport report;

  const WorkerRemarkEditPage({Key? key, required this.report})
    : super(key: key);

  @override
  State<WorkerRemarkEditPage> createState() => _WorkerRemarkEditPageState();
}

class _WorkerRemarkEditPageState extends State<WorkerRemarkEditPage> {
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

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
                'Worker & Remark',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                'Update the information below if required.',
                style: TextStyle(fontSize: 13),
              ),

              SizedBox(height: 30),

              Text('Worker'),

              SizedBox(height: 5),

              SizedBox(
                child: TextField(
                  controller: _sectionController,

                  onChanged: (value) {
                    // context.read<ReportCreationBloc>().add(
                    //   UpdateSection(value),
                    // );
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: widget.report.totalWorkers.toString(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor, width: 2),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(
                    //     8.0,
                    //   ),
                    //   borderSide: BorderSide(
                    //     color:
                    //         hasError && errorMessage != null
                    //         ? Colors.red
                    //         : primaryColor,
                    //     width: 1.5,
                    //   ),
                    // ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text('Additonal Note'),

              SizedBox(height: 5),

              SizedBox(
                child: TextField(
                  controller: _notesController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: widget.report.notes,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
