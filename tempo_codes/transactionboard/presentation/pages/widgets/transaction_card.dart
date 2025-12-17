// lib/features/transactionboard/presentation/widgets/transaction_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../shared/utils/theme.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const TransactionCard({
    super.key,
    required this.title,
    required this.amount,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor ?? tPrimaryColorShade2.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.poppins(color: tDarkFontShade1)),
            Text(
              amount,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: w * 0.045,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/features/transactionboard/presentation/widgets/transaction_list_item.dart
class TransactionListItem extends StatelessWidget {
  final String initials;
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final Color? avatarColor;
  final Color? amountColor;
  final VoidCallback? onTap;

  const TransactionListItem({
    super.key,
    required this.initials,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    this.avatarColor,
    this.amountColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: tPrimaryColorShade2, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: avatarColor ?? Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      initials,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: tDarkFontShade1,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: GoogleFonts.poppins(
                    color: amountColor ?? tDarkFontShade1,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// lib/features/transactionboard/presentation/widgets/amount_summary_card.dart
class AmountSummaryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String currency;
  final Color? backgroundColor;

  const AmountSummaryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.currency,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      height: w / 2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor ?? tPrimaryColorShade4,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: w * 0.05,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: w * 0.035,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    currency,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: w * 0.03,
                      color: tDarkFontShade1,
                    ),
                  ),
                  Text(
                    amount,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: w * 0.05,
                      color: tDarkFontShade1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
