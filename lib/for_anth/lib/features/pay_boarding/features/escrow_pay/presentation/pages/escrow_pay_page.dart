import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../shared/utils/build_loading_indicator.dart';
import '../../../../../../shared/utils/theme.dart';
import '../bloc/escrow_pay_bloc.dart';
import '../bloc/escrow_pay_event.dart';
import '../bloc/escrow_pay_state.dart';
import 'escrow_form1_page.dart';
import 'widgets/error_widget.dart';
import 'widgets/price_calculator_widget.dart';

class EscrowpayPage extends StatelessWidget {
  final String? title;
  
  const EscrowpayPage({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EscrowpayBloc>()..add(const LoadEscrowpay()),
      child: const EscrowpayView(),
    );
  }
}

class EscrowpayView extends StatefulWidget {
  const EscrowpayView({super.key});

  @override
  State<EscrowpayView> createState() => _EscrowpayViewState();
}

class _EscrowpayViewState extends State<EscrowpayView> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _sellerReceiveController = TextEditingController();
  final TextEditingController _youPayController = TextEditingController();
  
  bool _isUpdatingSellerReceive = false;
  bool _isUpdatingYouPay = false;
  static const double _incrementFactor = 0.03;

  @override
  void initState() {
    super.initState();
    _sellerReceiveController.addListener(_onSellerReceiveChanged);
    _youPayController.addListener(_onYouPayChanged);
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _sellerReceiveController.removeListener(_onSellerReceiveChanged);
    _youPayController.removeListener(_onYouPayChanged);
    _sellerReceiveController.dispose();
    _youPayController.dispose();
    super.dispose();
  }

  void _onSellerReceiveChanged() {
    if (_isUpdatingSellerReceive) return;
    _isUpdatingYouPay = true;
    
    if (_sellerReceiveController.text.isNotEmpty) {
      double sellerReceive = double.tryParse(_sellerReceiveController.text) ?? 0;
      double youPay = sellerReceive * (1 + _incrementFactor);
      _youPayController.text = youPay.toStringAsFixed(2);
      
      context.read<EscrowpayBloc>().add(UpdatePricing(
        sellerReceive: sellerReceive,
        youPay: youPay,
      ));
    } else {
      _youPayController.clear();
    }
    _isUpdatingYouPay = false;
  }

  void _onYouPayChanged() {
    if (_isUpdatingYouPay) return;
    _isUpdatingSellerReceive = true;
    
    if (_youPayController.text.isNotEmpty) {
      double youPay = double.tryParse(_youPayController.text) ?? 0;
      double sellerReceive = youPay / (1 + _incrementFactor);
      _sellerReceiveController.text = sellerReceive.toStringAsFixed(2);
      
      context.read<EscrowpayBloc>().add(UpdatePricing(
        sellerReceive: sellerReceive,
        youPay: youPay,
      ));
    } else {
      _sellerReceiveController.clear();
    }
    _isUpdatingSellerReceive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay with Escrow',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocConsumer<EscrowpayBloc, EscrowpayState>(
        listener: (context, state) {
          if (state is EscrowpayError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is EscrowpayLoaded) {
            return _buildLoadedContent(context, state);
          } else if (state is EscrowpayLoading) {
            return Center(
              child: buildLoadingIndicator(
                blur: 0,
                isCentered: true,
              ),
            );
          } else if (state is EscrowpayError) {
            return EscrowpayErrorWidget(
              message: state.message,
              onRetry: () {
                context.read<EscrowpayBloc>().add(const LoadEscrowpay());
              },
            );
          } else {
            return EscrowpayErrorWidget(
              message: 'Something went wrong',
              onRetry: () {
                context.read<EscrowpayBloc>().add(const LoadEscrowpay());
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildLoadedContent(BuildContext context, EscrowpayLoaded state) {
    final w = MediaQuery.of(context).size.width;
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: w * 0.05),
            Text(
              "Good Choice! We need a bit of info",
              style: TextStyle(
                fontFamily: tSecondaryFont,
                fontWeight: FontWeight.w700,
                fontSize: w * 0.06,
              ),
            ),
            const SizedBox(height: 40),
            
            // Product Name Field
            Text(
              'Product Name',
              style: TextStyle(
                fontFamily: tSecondaryFont,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _productNameController,
              style: TextStyle(
                fontFamily: tSecondaryFont,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: tPrimaryBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(UpdateProductName(value));
              },
            ),
            
            const SizedBox(height: 20),
            
            // Product Description Field
            Text(
              'Product Description',
              style: TextStyle(
                fontFamily: tSecondaryFont,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _productDescriptionController,
              style: TextStyle(
                fontFamily: tSecondaryFont,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: tPrimaryBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(UpdateProductDescription(value));
              },
            ),
            
            const SizedBox(height: 20),
            
            // Price Section
            Text(
              'Price',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            
            PriceCalculatorWidget(
              sellerReceiveController: _sellerReceiveController,
              youPayController: _youPayController,
            ),
            
            const SizedBox(height: 60),
            
            // Continue Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_canProceed(state)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: context.read<EscrowpayBloc>(),
                            child: const EscrowpayForm1Page(),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields with valid data'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: tPrimaryColor,
                    shape: const CircleBorder(),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _canProceed(EscrowpayLoaded state) {
    return _productNameController.text.isNotEmpty &&
           _productDescriptionController.text.isNotEmpty &&
           state.sellerReceive > 0 &&
           state.youPay > 0;
  }
}