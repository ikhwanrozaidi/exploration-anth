import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatepay_app/features/pay_boarding/features/qr_pay/presentation/pages/qrpay_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/theme.dart';
import '../../features/escrow_pay/presentation/pages/escrow_pay_page.dart';
import '../bloc/pay_boarding_bloc.dart';
import '../bloc/pay_boarding_event.dart';
import '../bloc/pay_boarding_state.dart';
import 'widgets/payment_info_section.dart';
import 'widgets/payment_method_card.dart';

class PayBoardingPage extends StatelessWidget {
  final String? title;
  
  const PayBoardingPage({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PayBoardingBloc>()..add(const LoadPayBoarding()),
      child: const PayBoardingView(),
    );
  }
}

class PayBoardingView extends StatelessWidget {
  const PayBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocConsumer<PayBoardingBloc, PayBoardingState>(
        listener: (context, state) {
          if (state is PayBoardingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PayBoardingLoaded) {
            return _buildLoadedContent(context, state);
          } else if (state is PayBoardingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PayBoardingError) {
            return _buildErrorContent(context, state.message);
          } else {
            return _buildErrorContent(context, 'Something went wrong');
          }
        },
      ),
    );
  }

  Widget _buildLoadedContent(BuildContext context, PayBoardingLoaded state) {
    final w = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: w * 0.03),
                Text(
                  "Let's Secure your transaction",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.07,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "How are you going to make your \ntransaction",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Payment Method Cards
                Row(
                  children: state.availableMethods.map((method) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: method == state.availableMethods.last ? 0 : 20,
                        ),
                        child: PaymentMethodCard(
                          method: method,
                          onTap: () => _onMethodSelected(context, method.type),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 60),
                
                // Payment Information Section
                PaymentInfoSection(
                  availableMethods: state.availableMethods,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, String message) {
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
                    context.read<PayBoardingBloc>().add(const LoadPayBoarding());
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

  void _onMethodSelected(BuildContext context, PaymentMethodType methodType) {
    // Update selected method in BLoC
    context.read<PayBoardingBloc>().add(SelectPaymentMethod(methodType));
    
    // Navigate to appropriate page
    Widget targetPage;
    switch (methodType) {
      case PaymentMethodType.qrCode:
        targetPage = const QrpayPage();
        break;
      case PaymentMethodType.escrow:
        targetPage = const EscrowpayPage();
        break;
    }
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }
}