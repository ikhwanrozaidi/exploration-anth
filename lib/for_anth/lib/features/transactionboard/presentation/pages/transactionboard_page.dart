import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/dio/injection.dart';
import '../../../../shared/utils/build_loading_indicator.dart';
import '../../../../shared/utils/theme.dart';
import '../../features/ongoing/presentation/pages/ongoing_page.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/transaction_event.dart';
import '../bloc/transaction_state.dart';

class TransactionboardPage extends StatelessWidget {
  final String? title;
  
  const TransactionboardPage({
    super.key,
    this.title,
  });

 @override
  Widget build(BuildContext context) {
    return const TransactionboardView();
  }
   
}

class TransactionboardView extends StatefulWidget {
  const TransactionboardView({super.key});

  @override
  State<TransactionboardView> createState() => _TransactionboardViewState();
}

class _TransactionboardViewState extends State<TransactionboardView> {
  @override
  void initState() {
    super.initState();
    // Load data when entering the page
    context.read<TransactionboardBloc>().add(const LoadTransactionboard());
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<TransactionboardBloc, TransactionboardState>(
        builder: (context, state) {
          if (state is TransactionboardLoaded) {
            return _buildLoadedContent(w, h, context);
          } else if (state is TransactionboardLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionboardError) {
            return _buildErrorContent(state.message, context);
          } else {
            return _buildErrorContent('Something went wrong', context);
          }
        },
      ),
    );
  }

  Widget _buildLoadedContent(double w, double h, BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Transactions',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: w * 0.08),
              Text(
                'Ongoing Transactions',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: w * 0.04,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: tPrimaryColorShade2.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Withheld Payment',
                      style: GoogleFonts.poppins(color: tDarkFontShade1),
                    ),
                    Text(
                      'MYR 14,187.20',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.045,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: tPrimaryColorShade2.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Awaiting Payment',
                      style: GoogleFonts.poppins(color: tDarkFontShade1),
                    ),
                    Text(
                      'MYR 1,200.50',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.045,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: h * 0.3,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: tPrimaryColorShade2.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction Lists',
                          style: GoogleFonts.poppins(color: tDarkFontShade1),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OngoingPage(),
                              ),
                            );
                          },
                          child: Text(
                            'View All',
                            style: GoogleFonts.poppins(color: tDarkFontShade1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  'IR',
                                  style: TextStyle(
                                    fontFamily: tSecondaryFont,
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
                                  'SAMSUNG GALAXY FOLD 2',
                                  style: GoogleFonts.poppins(
                                    color: tDarkFontShade1,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'sarahsuhairi  •  2 July',
                                  style: GoogleFonts.poppins(
                                    color: tDarkFontShade1,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                          'MYR 12,250.65',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.red.shade500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction History',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: w * 0.04,
                    ),
                  ),
                  Text(
                    'View All',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'TODAY',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: tPrimaryColorShade2,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 191, 82),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              'IR',
                              style: TextStyle(
                                fontFamily: tSecondaryFont,
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
                              'SAMSUNG GALAXY FOLD 2',
                              style: GoogleFonts.poppins(
                                color: tDarkFontShade1,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'ANAABU',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-MYR 12,250.65',
                          style: GoogleFonts.poppins(
                            color: tDarkFontShade1,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '26 AUGUST',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContent(String message, BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        return ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(minHeight: cons.maxHeight),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    context.read<TransactionboardBloc>().add(const LoadTransactionboard());
                  },
                  child: Chip(
                    label: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.refresh, color: Colors.white),
                            const SizedBox(width: 10),
                            Text(
                              'Try again',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    backgroundColor: tPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}