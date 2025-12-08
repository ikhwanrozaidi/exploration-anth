import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/uil.dart';

import '../../../../../shared/utils/innershadow.dart';
import '../../../../../shared/utils/string_formatter.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../dashboard/domain/entities/onhold_transaction.dart';

class OnholdViewPage extends StatefulWidget {
  final List<OnholdTransaction> transactions;

  const OnholdViewPage({super.key, required this.transactions});

  @override
  State<OnholdViewPage> createState() => _OnholdViewPageState();
}

class _OnholdViewPageState extends State<OnholdViewPage> {
  bool isAwaiting = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                      ),
                      Text(
                        'Onhold Transactions',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(5),
                        ),
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: const Icon(
                            Icons.support_agent_sharp,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isAwaiting
                        ? [
                            Color.fromARGB(255, 0, 104, 195),
                            Color.fromARGB(255, 77, 191, 232),
                          ]
                        : [Color.fromARGB(255, 0, 104, 195), red],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isAwaiting
                                ? 'Withheld Payment'
                                : 'Awaiting Payment',
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                isAwaiting ? '+RM' : '-RM',
                                style: GoogleFonts.poppins(
                                  color: isAwaiting ? green : red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '1,234.65',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Number of Purchases',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '1',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                ),
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '320',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'points',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Divider(color: Colors.grey.shade300, height: 40),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Awaiting Button
                              isAwaiting
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 0, 104, 195),
                                              red,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isAwaiting = false;
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.grey[500],
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.trending_down,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Awaiting',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: InnerShadow(
                                        blur: 10,
                                        color: Colors.grey.shade500,
                                        offset: const Offset(0, 0),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isAwaiting = false;
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.grey[300],
                                            foregroundColor: Colors.grey[600],
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.trending_down,
                                                size: 16,
                                                color: Colors.grey[600],
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Awaiting',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                              const SizedBox(width: 12),

                              // Withheld Button
                              !isAwaiting
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 0, 104, 195),
                                              Color.fromARGB(255, 77, 191, 232),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue.withOpacity(
                                                0.3,
                                              ),
                                              offset: const Offset(0, 4),
                                              blurRadius: 8,
                                            ),
                                          ],
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isAwaiting = true;
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.trending_up,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 8),
                                              const Text(
                                                'Withheld',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: InnerShadow(
                                        blur: 10,
                                        color: Colors.grey.shade500,
                                        offset: const Offset(0, 0),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isAwaiting = true;
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.grey[300],
                                            foregroundColor: Colors.grey[600],
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.trending_up,
                                                size: 16,
                                                color: Colors.grey[600],
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Withheld',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),

                          //
                          // Commented because of not enough space
                          //
                          // SizedBox(height: 30),
                          //
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     _buildFilterButton(
                          //       MaterialSymbols.shopping_bag_outline_sharp,
                          //       'Shopping',
                          //     ),
                          //     _buildFilterButton(
                          //       MaterialSymbols.airplane_ticket_outline_rounded,
                          //       'Travel',
                          //     ),
                          //     _buildFilterButton(
                          //       MaterialSymbols
                          //           .collections_bookmark_outline_rounded,
                          //       'Bookings',
                          //     ),
                          //     _buildFilterButton(Uil.circle_layer, 'Others'),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recent Transaction',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      // fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Transaction List
            Expanded(
              child: widget.transactions.isEmpty
                  ? _buildEmptyState()
                  : _buildTransactionList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String icon, String title) {
    return Column(
      children: [
        Iconify(icon, size: 20, color: Colors.grey),
        SizedBox(height: 5),
        Text(title, style: GoogleFonts.poppins(color: Colors.grey)),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.receipt_long_outlined,
                size: 60,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No Transactions Found',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'There are no transactions to display at the moment.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: widget.transactions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final transaction = widget.transactions[index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: onholdOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.productName,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${transaction.senderId} • ${transaction.createdAt}',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '-RM ${formatCurrency(transaction.amount)}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                    color: onholdOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Iconify(
                        MaterialSymbols.package_outline_sharp,
                        color: onholdOrange.withOpacity(0.6),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Pending Dispatch... by JNT',
                        style: GoogleFonts.poppins(color: onholdOrange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
