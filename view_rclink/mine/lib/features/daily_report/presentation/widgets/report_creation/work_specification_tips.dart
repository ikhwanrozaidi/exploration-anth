import 'package:flutter/material.dart';

import '../../../../../shared/widgets/bullet_list_widget.dart';
import '../../../../../shared/widgets/template_page.dart';

class WorkSpecificationTips extends StatelessWidget {
  const WorkSpecificationTips({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Specification',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            BulletList(
              title: 'Prosedur Kerja',
              description: 'MENGGRED SEMULA BAHU JALAN (REGRADING)',
              items: [
                "'Peg'/tanda lokasi kawasan akan di rata / gred.",
                "Meratakan dan membentuk semula bahu jalan menggunakan mesin 'Motor Grade' atau 'Back Pusher' dengan peralatan 'grading / blade",
                "Bahu jalan perlu di gred sehingga longkang bagi membolehkan air mengalir ke dalam longkang sekiranya hujan mengelakkan daripada bertakung di atas permukaan jalan",
                "Jika ada penghadang jalan / guardrail, kerja meratakan bahu jalan perlu dilakukan secara manual / menggunakan 'backhoe' sehingga tebing cerun / longkang.",
                "Bahan lebihan dan buangan perlu dikeluarkan daripada tapak pada hari yang sama.",
                "Kawasan yang di gred perlu dimampat menggunakan mesin 'roller' dan sekiranya melibatkan kawasan kecil seperti di kawasan penghadang jalan atau tiang dan sebagainya hendaklah menggunakan 'vibratory plate compactor",
                "Sisa-sisa tanah di atas jalan perlu dibersihkan menggunakan penyapu / blower atau peralatan yang sesuai.",
                "Lalu lintas dibuka selepas kerja bahu jalan selesan dan kawasan kerja dibersihkan",
              ],
            ),

            SizedBox(height: 20),

            BulletList(
              title: 'MENINGGIKAN ARAS BAHU JALAN',
              items: [
                'Dipping ketinggian aras permukaan jalan dan bahu jalan perlu diambil sebelum mula kerja.',
                'Tanah yang digunakan adalah mematuhi kriteria',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
