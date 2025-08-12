// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../../../../../shared/utils/theme.dart';

// class QrScannerWidget extends StatelessWidget {
//   final VoidCallback onScanPressed;
  
//   const QrScannerWidget({
//     super.key,
//     required this.onScanPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.qr_code_scanner,
//           size: 120,
//           color: tPrimaryColor,
//         ),
//         const SizedBox(height: 40),
//         Text(
//           'Scan QR Code to Pay',
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//             color: tDarkFontShade1,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           'Point your camera at the QR code to make a payment',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             color: Colors.grey,
//           ),
//         ),
//         const SizedBox(height: 60),
//         SizedBox(
//           width: double.infinity,
//           height: 56,
//           child: ElevatedButton(
//             onPressed: onPayPressed,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: tPrimaryColor,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             child: Text(
//               'Pay Now',
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }