import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/uil.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/string_formatter.dart';
import '../../../../shared/utils/theme.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DashboardBloc>()..add(const LoadDashboardData()),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

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
                      Image.asset(
                        'assets/images/gatepay-logo.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Gatepay',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color.fromARGB(255, 77, 191, 232),
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
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.all(5),
                        ),
                        onPressed: () {
                          print("Add button clicked");
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: const Icon(
                            Icons.qr_code_scanner_sharp,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(5),
                        ),
                        onPressed: () {
                          print("Delete button clicked");
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: const Icon(
                            Icons.person_outline,
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
            Expanded(
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<DashboardBloc>().add(
                        const RefreshDashboardData(),
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

  Widget _buildContent(BuildContext context, DashboardState state, double w) {
    // Dashboard Loading
    if (state is DashboardLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading dashboard data...'),
          ],
        ),
      );
    }

    // Dashboard Error
    if (state is DashboardError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading dashboard',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    // Dashboard Loaded
    if (state is DashboardLoaded) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserDetailCard(state.userDetail, w),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buy and sell your things \nwith Gatepay',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 8,
                    ),
                  ),
                  child: Text(
                    'Explore',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          _buildOnholdBalanceCard(state.onholdBalance, w),

          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'In & Out Transaction',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(height: 16),
          _buildTransactionsCard(state.onholdTransactions, w),

          SizedBox(height: 100),
        ],
      );
    }

    // Dashboard PartialLoad
    if (state is DashboardPartialLoaded) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
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

          if (state.userDetail != null) ...[
            _buildUserDetailCard(state.userDetail!, w),
            const SizedBox(height: 16),
          ],
          if (state.onholdBalance != null) ...[
            _buildOnholdBalanceCard(state.onholdBalance!, w),
            const SizedBox(height: 16),
          ],
          if (state.onholdTransactions != null) ...[
            _buildTransactionsCard(state.onholdTransactions!, w),
          ],
        ],
      );
    }

    return const Center(child: Text('No data available'));
  }

  Widget _buildUserDetailCard(userDetail, w) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 77, 191, 232),
            Color.fromARGB(255, 0, 104, 195),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Balance',
              style: GoogleFonts.poppins(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "RM ${formatCurrency(userDetail.balance)}",
                  style: GoogleFonts.poppins(
                    fontSize: w * 0.06,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 48, 158, 218),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: w * 0.05,
                  height: w * 0.05,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, size: 16, color: Colors.black),
                ),
              ],
            ),
            Divider(thickness: 2, color: Colors.grey.shade200, height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _quickAction(
                  width: w,
                  icon: MaterialSymbols.add_circle_outline_rounded,
                  title: 'Topup',
                  onTap: () {},
                ),
                _quickAction(
                  width: w,
                  icon: Uil.money_stack,
                  title: 'Request',
                  onTap: () {},
                ),
                _quickAction(
                  width: w,
                  icon: Uil.money_withdraw,
                  title: 'Withdraw',
                  onTap: () {},
                ),
                _quickAction(
                  width: w,
                  icon: Uil.transaction,
                  title: 'Transfer',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnholdBalanceCard(onholdBalance, w) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.trending_up,
                    color: Color.fromARGB(255, 0, 213, 53),
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Awaiting Payment',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: w * 0.03,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 77, 191, 232),
                      Color.fromARGB(255, 0, 203, 162),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  '+RM ${formatCurrency(onholdBalance.awaiting)}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.trending_down, color: red),
                  SizedBox(width: 15),
                  Text(
                    'Withheld Payment',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: w * 0.03,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 77, 191, 232),
                      Color.fromARGB(255, 216, 144, 0),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  '-RM ${formatCurrency(onholdBalance.withheld)}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionsCard(List transactions, double w) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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

  Widget _quickAction({
    required String icon,
    required String title,
    required double width,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Iconify(
              icon,
              size: width * 0.07,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
