import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/dio/injection.dart';
import '../../../../../../shared/utils/build_loading_indicator.dart';
import '../../../../../../shared/utils/theme.dart';
import '../bloc/ongoing_bloc.dart';
import '../bloc/ongoing_event.dart';
import '../bloc/ongoing_state.dart';

class OngoingPage extends StatelessWidget {
  final String? title;
  
  const OngoingPage({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OngoingBloc>()..add(const LoadOngoingTransactions()),
      child: const OngoingView(),
    );
  }
}

class OngoingView extends StatelessWidget {
  const OngoingView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ongoing',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocBuilder<OngoingBloc, OngoingState>(
        builder: (context, state) {
          if (state is OngoingLoaded) {
            return _buildLoadedContent(w, h);
          } else if (state is OngoingLoading) {
            return Center(
              child: buildLoadingIndicator(
                blur: 0,
                isCentered: true,
              ),
            );
          } else if (state is OngoingError) {
            return _buildErrorContent(w, h, state.message, context);
          } else {
            return _buildErrorContent(w, h, 'Something went wrong', context);
          }
        },
      ),
    );
  }

  Widget _buildLoadedContent(double w, double h) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: w / 2,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: tPrimaryColorShade4,
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
                            'Withheld',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: w * 0.05,
                            ),
                          ),
                          Text(
                            'Amount',
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
                                'MYR',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.03,
                                  color: tDarkFontShade1,
                                ),
                              ),
                              Text(
                                '12,410.10',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.05,
                                  color: tDarkFontShade1,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: w / 2,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: tPrimaryColorShade4,
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
                            'Awaiting',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: w * 0.05,
                            ),
                          ),
                          Text(
                            'Amount',
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
                                'MYR',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.03,
                                  color: tDarkFontShade1,
                                ),
                              ),
                              Text(
                                '12,410.10',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.05,
                                  color: tDarkFontShade1,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Withheld Transactions',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: w * 0.04,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContent(double w, double h, String message, BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: h / 8),
                Lottie.asset(
                  'assets/lottie/lottie-unplug.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                  repeat: true,
                  animate: true,
                ),
                Text(
                  'Uh-oh!',
                  style: GoogleFonts.poppins(
                    color: tDarkFontShade1,
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.05,
                  ),
                ),
                Text(
                  'We may ran into a problem',
                  style: GoogleFonts.poppins(
                    color: tDarkFontShade1,
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.04,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    message.isNotEmpty 
                        ? message 
                        : 'Please check your internet connection and try again',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () async {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    context.read<OngoingBloc>().add(const LoadOngoingTransactions());
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<OngoingBloc>().add(const LoadOngoingTransactions());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColorShade3,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      minimumSize: const Size(64, 30),
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Try again',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}