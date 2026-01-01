import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/string_formatter.dart';
import '../../../../shared/utils/theme.dart';
import '../../../escrowpay/presentation/pages/escrowpay_page.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/bloc/profile_event.dart';
import '../../../profile/presentation/bloc/profile_state.dart';
import '../../domain/entities/transaction_board_data.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/transaction_event.dart';
import '../bloc/transaction_state.dart';

class TransactionBoardPage extends StatelessWidget {
  const TransactionBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<TransactionboardBloc>()
                ..add(const TransactionboardEvent.loadTransactionboard()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<ProfileBloc>()..add(const ProfileEvent.loadProfile()),
        ),
      ],
      child: const TransactionBoardView(),
    );
  }
}

class TransactionBoardView extends StatelessWidget {
  const TransactionBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Material(
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.06,
                vertical: w * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EscrowpayPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 8.0,
                      shadowColor: Colors.black26,
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.06,
                        vertical: w * 0.04,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Create Order',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<TransactionboardBloc, TransactionboardState>(
                builder: (context, state) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<TransactionboardBloc>().add(
                        const TransactionboardEvent.refreshTransactionboard(),
                      );
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      child: _buildContent(context, state, w),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    TransactionboardState state,
    double w,
  ) {
    return state.when(
      initial: () => const Center(child: Text('Initializing...')),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading transaction board data...'),
          ],
        ),
      ),
      loaded: (data) => _buildTransactionBoardContent(context, data, w),
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading transaction board',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<TransactionboardBloc>().add(
                  const TransactionboardEvent.loadTransactionboard(),
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionBoardContent(
    BuildContext context,
    TransactionBoardData data,
    double w,
  ) {
    // ✅ Get balance from ProfileBloc
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        final balance = profileState.maybeWhen(
          loaded: (user, detail, settings) => user.balance,
          orElse: () => "0.00",
        );

        // ✅ Get awaiting/withheld payment from transaction data
        final awaitingPayment = data.waitReceiveAmount.toString();
        final withheldPayment = data.waitReleaseAmount.toString();

        // ✅ Filter transactions by completion status
        final onholdTransactions = data.transactions
            .where((tx) => !tx.isCompleted)
            .toList();

        final completeTransactions = data.transactions
            .where((tx) => tx.isCompleted)
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Request Transaction Section (Hardcoded)
            _buildRequestTransactionSection(w),

            const SizedBox(height: 16),

            // User Detail Card
            _buildUserDetailCard(balance, awaitingPayment, withheldPayment, w),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Onhold Transaction',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to onhold view page (disabled for now)
                      print('View onhold transactions');
                    },
                    child: Text(
                      'View',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ REPLACED: with actual isCompleted = false payments
            _buildOnholdTransaction(onholdTransactions, w),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Complete Transaction',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  Text('View', style: GoogleFonts.poppins(fontSize: 13)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ REPLACED: with actual isCompleted = true payments
            _buildCompleteTransaction(completeTransactions, w),

            const SizedBox(height: 100),
          ],
        );
      },
    );
  }

  Widget _buildRequestTransactionSection(double w) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: w * 0.03, horizontal: w * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 200, 90),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 200, 90),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: const Color.fromARGB(255, 178, 119, 0),
                  size: w * 0.06,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Zermatt, Switzerland', //HARDCODED
                    style: TextStyle(
                      fontSize: w * 0.033,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Traveyoo', //HARDCODED
                    style: TextStyle(
                      fontSize: w * 0.03,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  print('Pay button pressed');
                },
                style: TextButton.styleFrom(
                  backgroundColor: green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.033,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: w * 0.001),
              TextButton(
                onPressed: () {
                  print('Close button tapped');
                },
                style: TextButton.styleFrom(
                  backgroundColor: red,
                  minimumSize: const Size(36, 36),
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserDetailCard(
    String balance,
    String awaitingPayment,
    String withheldPayment,
    double w,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 69, 129),
            Color.fromARGB(255, 77, 191, 232),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Total Balance',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "RM ${formatCurrency(balance)}",
            style: GoogleFonts.poppins(
              fontSize: w * 0.065,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: w * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 16, 122, 180),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Awaiting Payment',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.028,
                          color: const Color.fromARGB(255, 175, 226, 255),
                        ),
                      ),
                      Text(
                        '+RM ${formatCurrency(awaitingPayment)}',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.048,
                          color: const Color.fromARGB(255, 175, 226, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 16, 122, 180),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Withheld Payment',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.028,
                          color: const Color.fromARGB(255, 175, 226, 255),
                        ),
                      ),
                      Text(
                        '-RM ${formatCurrency(withheldPayment)}',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.048,
                          color: const Color.fromARGB(255, 175, 226, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOnholdTransaction(List<dynamic> transactions, double w) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: w * 0.06, horizontal: w * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: transactions.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('No on-hold transactions'),
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 18),
              itemBuilder: (context, index) {
                final transaction = transactions[index];

                // ✅ Format date to YYYYMMDD
                final formattedDate = DateFormat(
                  'yyyyMMdd',
                ).format(transaction.createdAt);

                // ✅ Determine amount display based on userRole
                final amountPrefix = transaction.userRole == 'buyer'
                    ? '-'
                    : '+';
                final amountColor = transaction.userRole == 'buyer'
                    ? red
                    : green;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 77, 191, 232),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.flight_class_outlined,
                            size: w * 0.065,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.paymentDetails.productName,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${transaction.seller?.email ?? 'N/A'} • $formattedDate',
                              style: GoogleFonts.poppins(
                                fontSize: w * 0.025,
                                color: Colors.black,
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
                          '${amountPrefix}RM ${formatCurrency(transaction.amount.toString())}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: amountColor,
                          ),
                        ),
                        Text(
                          'ONHOLD',
                          style: GoogleFonts.poppins(
                            fontSize: w * 0.028,
                            color: onholdOrange,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildCompleteTransaction(List<dynamic> transactions, double w) {
    return transactions.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('No complete transactions'),
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final transaction = transactions[index];

              // ✅ Format date to YYYYMMDD
              final formattedDate = DateFormat(
                'yyyyMMdd',
              ).format(transaction.createdAt);

              // ✅ Determine amount display based on userRole
              final amountPrefix = transaction.userRole == 'buyer' ? '-' : '+';
              final amountColor = transaction.userRole == 'buyer' ? red : green;

              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: red.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: w * 0.065,
                            color: red,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.paymentDetails.productName,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${transaction.seller?.email ?? 'N/A'} • $formattedDate',
                              style: GoogleFonts.poppins(
                                fontSize: w * 0.025,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '${amountPrefix}RM ${formatCurrency(transaction.amount.toString())}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: amountColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
