// lib/features/dashboard/presentation/pages/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/utils/theme.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';

// Import your theme and utility files
// import '../../../shared/utils/theme.dart';
// import '../../../shared/utils/blurred_bg_loading.dart';
// import '../../../shared/utils/flags_imagenetwork.dart';

class DashboardPage extends StatefulWidget {
  final String? title;
  
  const DashboardPage({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // Load dashboard data when page initializes
    context.read<DashboardBloc>().add(const DashboardLoadRequested());
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoadingWidget(),
            loading: () => _buildLoadingWidget(),
            loaded: (userName, balance, currency, accountNumber, wallets) =>
                _buildLoadedContent(
              context,
              userName,
              balance,
              currency,
              accountNumber,
              wallets,
              w,
              h,
            ),
            error: (message) => _buildErrorWidget(context, message),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
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
                    context.read<DashboardBloc>().add(const DashboardRetryRequested());
                  },
                  child: const Chip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.refresh, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Try again',
                          style: TextStyle(color: Colors.white),
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

  Widget _buildLoadedContent(
    BuildContext context,
    String userName,
    double balance,
    String currency,
    String accountNumber,
    List<CurrencyWallet> wallets,
    double w,
    double h,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DashboardBloc>().add(const DashboardRefreshRequested());
      },
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${getGreeting()}, $userName!',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: w * 0.045,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 200, 222, 255),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                          style: const TextStyle(
                            fontFamily: tSecondaryFont,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h / 25),
                _buildMainCard(w, accountNumber, userName, balance, currency),
              ],
            ),
          ),
          _buildCurrencyWallets(w, wallets),
          const SizedBox(height: 30),
          _buildQuickActions(w),
          const SizedBox(height: 35),
          _buildExploreSection(w, h),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildMainCard(double w, String accountNumber, String userName, double balance, String currency) {
    return Container(
      height: w / 2.1,
      width: w / 1.2,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage("assets/images/bg-mainCard.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  'GatePay',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(
                accountNumber,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: w * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '$currency ${balance.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: w * 0.055,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40.0,
                width: 40.0,
                child: Image.asset(
                  'assets/images/gatepay-logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'BASIC',
                style: GoogleFonts.inter(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCurrencyWallets(double w, List<CurrencyWallet> wallets) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          ...wallets.map((wallet) => _buildWalletCard(w, wallet)),
          _buildAddCurrencyCard(w),
        ],
      ),
    );
  }

  Widget _buildWalletCard(double w, CurrencyWallet wallet) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 40),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: tPrimaryColor,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CountryFlagWidget(alpha2code: wallet.countryCode),
              Container(
                width: 20,
                height: 15,
                color: Colors.grey[300],
                child: const Icon(Icons.flag, size: 12),
              ),
              const SizedBox(width: 10),
              Text(
                wallet.displayName,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            wallet.balance.toStringAsFixed(2),
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: w * 0.05,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddCurrencyCard(double w) {
    return InkWell(
      onTap: () {
        // Navigate to CurrencyWalletPage
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => CurrencyWalletPage()),
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Add Currency - Coming Soon!')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 33),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: tPrimaryColor,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.control_point_outlined,
              size: w * 0.05,
              color: tPrimaryColor,
            ),
            const SizedBox(width: 5),
            Text(
              'Add Currency',
              style: GoogleFonts.inter(
                color: tPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(double w) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: w * 0.045,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _quickActionButton(
                icon: Icons.control_point_duplicate,
                title: 'Topup',
                onTap: () => _showComingSoon('Topup'),
              ),
              _quickActionButton(
                icon: Icons.payment,
                title: 'Pay',
                onTap: () => _showComingSoon('Pay'),
              ),
              _quickActionButton(
                icon: Icons.supervisor_account,
                title: 'Request',
                onTap: () => _showComingSoon('Request'),
              ),
              _quickActionButton(
                icon: Icons.account_balance,
                title: 'Withdraw',
                onTap: () => _showComingSoon('Withdraw'),
              ),
              _quickActionButton(
                icon: Icons.compare_arrows,
                title: 'Transfer',
                onTap: () => _showComingSoon('Transfer'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickActionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            decoration: const BoxDecoration(
              color: tPrimaryColorShade1,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: w * 0.03,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildExploreSection(double w, double h) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Explore the capability',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: w * 0.045,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 10),
              _buildExploreCard(
                w,
                h,
                'Together We Stop Scam',
                () => _showComingSoon('Stop cyber scam'),
              ),
              _buildExploreCard(
                w,
                h,
                'Secure your transactions',
                () => _showComingSoon('Secure your transactions'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExploreCard(double w, double h, String title, VoidCallback onTap) {
    return Container(
      width: w / 1.8,
      height: h / 5,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: tPrimaryColorShade2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
            ),
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: tPrimaryColorShade3,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              minimumSize: const Size(64, 30),
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Learn More',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature - Coming Soon!')),
    );
  }
}