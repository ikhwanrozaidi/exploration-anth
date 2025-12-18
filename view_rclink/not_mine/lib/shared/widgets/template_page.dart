import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';

class TemplatePage extends StatelessWidget {
  final String? pageTitle;
  final Widget body;

  const TemplatePage({super.key, this.pageTitle, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        toolbarHeight: ResponsiveHelper.getHeight(context, 0.08),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(-2, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            SizedBox(width: ResponsiveHelper.spacing(context, 15)),
            Text(
              pageTitle ?? '',
              style: TextStyle(
                letterSpacing: 0.6,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveHelper.fontSize(context, base: 18),
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
