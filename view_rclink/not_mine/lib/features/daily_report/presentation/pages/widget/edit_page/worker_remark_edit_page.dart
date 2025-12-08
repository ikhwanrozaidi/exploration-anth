import 'package:flutter/material.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../domain/entities/daily_report.dart';
import '../../../bloc/daily_report_edit/daily_report_edit_bloc.dart';
import '../../../bloc/daily_report_edit/daily_report_edit_event.dart';

class WorkerRemarkEditPage extends StatefulWidget {
  final DailyReport report;

  const WorkerRemarkEditPage({Key? key, required this.report})
    : super(key: key);

  @override
  State<WorkerRemarkEditPage> createState() => _WorkerRemarkEditPageState();
}

class _WorkerRemarkEditPageState extends State<WorkerRemarkEditPage> {
  final TextEditingController _workerController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Populate initial values
    _workerController.text = widget.report.totalWorkers?.toString() ?? '0';
    _notesController.text = widget.report.notes ?? '';
  }

  @override
  void dispose() {
    _workerController.dispose();
    _notesController.dispose();
    super.dispose();
  }

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
                  controller: _workerController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter number of workers',
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
                    hintText: 'Enter additional notes',
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

              SizedBox(height: ResponsiveHelper.spacing(context, 2)),

              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final workerCount = int.tryParse(_workerController.text) ?? 0;
                    final notes = _notesController.text;

                    // Validate worker count
                    if (workerCount < 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Worker count cannot be negative'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final bloc = getIt<DailyReportEditBloc>();

                    // Update worker count
                    bloc.add(
                      DailyReportEditEvent.updateWorkers(count: workerCount),
                    );

                    // Update notes
                    bloc.add(
                      DailyReportEditEvent.updateNotes(notes: notes),
                    );

                    // Show success and pop back
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Worker and remark updated!'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
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
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: ResponsiveHelper.spacing(context, 2)),
            ],
          ),
        ),
      ),
    );
  }
}
