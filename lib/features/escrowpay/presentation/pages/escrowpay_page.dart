import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/dio/injection.dart';
import '../../../../shared/utils/theme.dart';
import '../bloc/escrowpay_bloc.dart';
import '../bloc/escrowpay_event.dart';
import '../bloc/escrowpay_state.dart';
import 'widget/escrowpay_form.dart';
import 'widget/price_calculator_widget.dart';

import 'widget/escrowpay_form.dart';

class EscrowpayPage extends StatelessWidget {
  final String? title;

  const EscrowpayPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EscrowpayBloc>(),
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
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _sellerReceiveController =
      TextEditingController();
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
    super.dispose();
  }

  void _onSellerReceiveChanged() {
    if (_isUpdatingSellerReceive) return;
    _isUpdatingYouPay = true;

    if (_sellerReceiveController.text.isNotEmpty) {
      double sellerReceive =
          double.tryParse(_sellerReceiveController.text) ?? 0;
      double youPay = sellerReceive * (1 + _incrementFactor);
      _youPayController.text = youPay.toStringAsFixed(2);

      context.read<EscrowpayBloc>().add(
        EscrowpayFormFieldChanged(
          productName: _productNameController.text,
          productDesc: _productDescriptionController.text,
          price: youPay.toString(),
          sellerUsername: '',
          sellerPhone: '',
        ),
      );
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

      context.read<EscrowpayBloc>().add(
        EscrowpayFormFieldChanged(
          productName: _productNameController.text,
          productDesc: _productDescriptionController.text,
          price: youPay.toString(),
          sellerUsername: '',
          sellerPhone: '',
        ),
      );
    } else {
      _sellerReceiveController.clear();
    }
    _isUpdatingSellerReceive = false;
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Order',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: BlocListener<EscrowpayBloc, EscrowpayState>(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: w * 0.05),
                Text(
                  "Good Choice! We need a bit of information",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.06,
                  ),
                ),
                const SizedBox(height: 40),

                // Product Name Field
                Text(
                  'Product Name',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _productNameController,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: tPrimaryColorShade4,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    context.read<EscrowpayBloc>().add(
                      EscrowpayFormFieldChanged(
                        productName: value,
                        productDesc: _productDescriptionController.text,
                        price: _youPayController.text,
                        sellerUsername: '',
                        sellerPhone: '',
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Product Description Field
                Text(
                  'Product Description',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _productDescriptionController,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: tPrimaryColorShade4,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: 3,
                  onChanged: (value) {
                    context.read<EscrowpayBloc>().add(
                      EscrowpayFormFieldChanged(
                        productName: _productNameController.text,
                        productDesc: value,
                        price: _youPayController.text,
                        sellerUsername: '',
                        sellerPhone: '',
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Price Section
                Text(
                  'Price',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
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
                    BlocBuilder<EscrowpayBloc, EscrowpayState>(
                      builder: (context, state) {
                        bool canProceed = false;
                        if (state is EscrowpayFormValid) {
                          canProceed =
                              state.productName.isNotEmpty &&
                              state.productDesc.isNotEmpty &&
                              state.price > 0;
                        } else {}

                        return ElevatedButton(
                          onPressed: canProceed
                              ? () {
                                  final escrowBloc = context
                                      .read<EscrowpayBloc>();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<EscrowpayBloc>.value(
                                            value: escrowBloc,
                                            child: const EscrowpayFormPage(),
                                          ),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            backgroundColor: canProceed
                                ? passiveColor
                                : Colors.grey,
                            shape: const CircleBorder(),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
