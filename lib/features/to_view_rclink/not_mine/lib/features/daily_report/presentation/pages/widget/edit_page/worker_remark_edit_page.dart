import 'package:flutter/material.dart';

import '../../../../../../shared/utils/responsive_helper.dart';

class WorkerRemarkPage extends StatelessWidget {
  const WorkerRemarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Worker & Remark',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 18),
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: ResponsiveHelper.fontSize(context, base: 64),
                color: Colors.grey,
              ),
              SizedBox(height: ResponsiveHelper.fontSize(context, base: 16)),
              Text(
                'Worker & Remark',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 24),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: ResponsiveHelper.fontSize(context, base: 8)),
              Text(
                'This page is under development',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
