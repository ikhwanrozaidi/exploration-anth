import 'package:flutter/material.dart';

import '../../../../shared/widgets/template_page.dart';

class ProgramCreationDraftPage extends StatelessWidget {
  const ProgramCreationDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Program Draft not R02',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('SSUP')],
        ),
      ),
    );
  }
}
