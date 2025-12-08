import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatepay_app/features/escrowpay/presentation/pages/escrowpay_page.dart';
import 'package:gatepay_app/shared/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/dio/injection.dart';
import '../../../../shared/utils/string_formatter.dart';
import '../../../pay_boarding/presentation/pages/pay_boarding_page.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/transaction_event.dart';
import '../bloc/transaction_state.dart';
import 'screens/onhold_view_page.dart';

class TransactionBoardPage extends StatelessWidget {
  const TransactionBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TransactionBoardBloc>()..add(const LoadTransactionBoardData()),
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
                          builder: (context) => EscrowpayPage(),
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
              child: BlocBuilder<TransactionBoardBloc, TransactionBoardState>(
                builder: (context, state) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<TransactionBoardBloc>().add(
                        const RefreshTransactionBoardData(),
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
    TransactionBoardState state,
    double w,
  ) {
    if (state is TransactionBoardLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading transaction board data...'),
          ],
        ),
      );
    }

    if (state is TransactionBoardError) {
      return Center(
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
              state.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<TransactionBoardBloc>().add(
                  const LoadTransactionBoardData(),
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is TransactionBoardLoaded ||
        state is TransactionBoardPartialLoaded) {
      final userDetail = state is TransactionBoardLoaded
          ? state.userDetail
          : (state as TransactionBoardPartialLoaded).userDetail;
      final onholdBalance = state is TransactionBoardLoaded
          ? state.onholdBalance
          : (state as TransactionBoardPartialLoaded).onholdBalance;
      final onholdTransactionsTrue = state is TransactionBoardLoaded
          ? state.onholdTransactionsTrue
          : (state as TransactionBoardPartialLoaded).onholdTransactionsTrue;
      final onholdTransactionsFalse = state is TransactionBoardLoaded
          ? state.onholdTransactionsFalse
          : (state as TransactionBoardPartialLoaded).onholdTransactionsFalse;
      final requestTransactions = state is TransactionBoardLoaded
          ? state.requestTransactions
          : (state as TransactionBoardPartialLoaded).requestTransactions;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Show error banner if partial load
          if (state is TransactionBoardPartialLoaded && state.error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Some data failed to load: ${state.error}',
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),

          // Request Transactions Section
          if (requestTransactions != null)
            _buildRequestTransactionSection(requestTransactions, w),

          const SizedBox(height: 16),

          // User Detail Section
          if (userDetail != null)
            _buildUserDetailCard(userDetail, onholdBalance, w),

          SizedBox(height: 30),

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
                    if (onholdTransactionsTrue != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnholdViewPage(
                            transactions: onholdTransactionsTrue,
                          ),
                        ),
                      );
                    }
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

          if (onholdTransactionsTrue != null)
            _buildOnholdTransaction(onholdTransactionsTrue, w),

          SizedBox(height: 30),

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

          if (onholdTransactionsFalse != null)
            _buildCompleteTransaction(onholdTransactionsFalse, w),

          SizedBox(height: 100),
        ],
      );
    }

    return const Center(child: Text('Unknown state'));
  }

  Widget _buildRequestTransactionSection(List<dynamic> transactions, double w) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: w * 0.03, horizontal: w * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Color.fromARGB(255, 255, 200, 90), width: 2),
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 200, 90),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Color.fromARGB(255, 178, 119, 0),
                  size: w * 0.06,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Zermatt, Switzerland',
                    style: TextStyle(
                      fontSize: w * 0.033,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Traveyoo',
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
    dynamic userDetail,
    dynamic onholdBalance,
    double w,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
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
            "RM ${formatCurrency(userDetail.balance)}",
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
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    // horizontal: w * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 122, 180),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Awaiting Payment',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.028,
                          color: Color.fromARGB(255, 175, 226, 255),
                        ),
                      ),
                      Text(
                        '+RM 2,100.00',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.048,
                          color: Color.fromARGB(255, 175, 226, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    // horizontal: w * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 122, 180),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Withheld Payment',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.028,
                          color: Color.fromARGB(255, 175, 226, 255),
                        ),
                      ),
                      Text(
                        '-RM 2,100.00',
                        style: GoogleFonts.poppins(
                          fontSize: w * 0.048,
                          color: Color.fromARGB(255, 175, 226, 255),
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

  Widget _buildOnholdTransaction(List transactions, double w) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: w * 0.06, horizontal: w * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        child: transactions.isEmpty
            ? Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('No on-hold transactions'),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 18),
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 77, 191, 232),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.flight_class_outlined,
                              size: w * 0.065,
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
                            '-RM ${formatCurrency(transaction.amount)}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: red,
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
      ),
    );
  }

  Widget _buildCompleteTransaction(List transactions, double w) {
    return Container(
      child: transactions.isEmpty
          ? Center(
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
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                                  fontSize: w * 0.025,
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
                );
              },
            ),
    );
  }

  Widget _buildRequestTransactionSection2(
    String title,
    List<dynamic> transactions,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.request_page, color: Colors.purple),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            if (transactions.isEmpty)
              const Text('No request transactions found')
            else
              ...transactions.map(
                (transaction) => _buildRequestTransactionItem(transaction),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetailCard2(dynamic userDetail) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: Colors.blue),
                const SizedBox(width: 8),
                const Text(
                  'User Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            _buildInfoRow(
              'Name',
              '${userDetail.firstName} ${userDetail.lastName}',
            ),
            _buildInfoRow('Email', userDetail.email),
            _buildInfoRow('Phone', userDetail.phone),
            _buildInfoRow('Country', userDetail.country),
            _buildInfoRow('Balance', userDetail.balance),
            _buildInfoRow('Gate Points', userDetail.gatePoint),
            _buildInfoRow(
              'Verified',
              userDetail.verify == 'true' ? 'Yes' : 'No',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionSection(
    String title,
    List<dynamic> transactions,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            if (transactions.isEmpty)
              const Text('No transactions found')
            else
              ...transactions.map(
                (transaction) => _buildTransactionItem(transaction),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(dynamic transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID: ${transaction.paymentId}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                transaction.amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('Product: ${transaction.productName}'),
          Text('Type: ${transaction.paymentType}'),
          Text('Date: ${transaction.createdAt}'),
          Text('Refundable: ${transaction.refundable}'),
        ],
      ),
    );
  }

  Widget _buildRequestTransactionItem(dynamic transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID: ${transaction.paymentId}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                transaction.amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('Product: ${transaction.productName}'),
          Text('Type: ${transaction.paymentType}'),
          Text('Date: ${transaction.createdAt}'),
          Text('Refundable: ${transaction.refundable}'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
