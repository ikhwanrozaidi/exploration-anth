import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/pages/root_page.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../domain/entities/create_payment_request.dart';
import '../../bloc/escrowpay_bloc.dart';
import '../../bloc/escrowpay_event.dart';
import '../../bloc/escrowpay_state.dart';
import 'agreement_checkbox_widget.dart';
import 'seller_account_widget.dart';

class EscrowpayFormPage extends StatefulWidget {
  const EscrowpayFormPage({super.key});

  @override
  State<EscrowpayFormPage> createState() => _EscrowpayFormPageState();
}

class _EscrowpayFormPageState extends State<EscrowpayFormPage> {
  final TextEditingController _sellerUsernameController =
      TextEditingController();
  final TextEditingController _sellerPhoneController = TextEditingController();
  Timer? _debounceTimer;
  bool _useUsername = true;
  bool _privacyAgreed = false;
  bool _policyAgreed = false;
  bool _termsAgreed = false;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _sellerUsernameController.dispose();
    _sellerPhoneController.dispose();
    super.dispose();
  }

  void _onSellerFieldChanged() {
    _debounceTimer?.cancel();

    final text = _useUsername
        ? _sellerUsernameController.text
        : _sellerPhoneController.text;

    // Update form state first
    context.read<EscrowpayBloc>().add(
      EscrowpayFormFieldChanged(
        productName: context.read<EscrowpayBloc>().productName,
        productDesc: context.read<EscrowpayBloc>().productDesc,
        price: context.read<EscrowpayBloc>().price.toString(),
        sellerUsername: _useUsername ? text : '',
        sellerPhone: !_useUsername ? text : '',
      ),
    );

    if (text.isNotEmpty) {
      _debounceTimer = Timer(const Duration(milliseconds: 800), () {
        if (_useUsername) {
          context.read<EscrowpayBloc>().add(EscrowpaySearchUsername(text));
        } else {
          context.read<EscrowpayBloc>().add(EscrowpaySearchPhone(text));
        }
      });
    }
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
          if (state is EscrowpayPaymentSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate to RootPage after success
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const RootPage()),
              (route) => false,
            );
          } else if (state is EscrowpayError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is EscrowpaySellerFound) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Seller found: ${state.sellerInfo.fullName}'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is EscrowpaySellerNotFound) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.orange,
              ),
            );
          } else if (state is EscrowpaySellerValidated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
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
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Last Step! We need to know your seller",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: w * 0.06,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Seller Account Toggle
                SellerAccountToggle(
                  hasAccount: _useUsername,
                  onToggle: (hasAccount) {
                    setState(() {
                      _useUsername = hasAccount;
                    });
                    // Clear the opposite field when toggling
                    if (hasAccount) {
                      _sellerPhoneController.clear();
                    } else {
                      _sellerUsernameController.clear();
                    }
                    context.read<EscrowpayBloc>().add(
                      EscrowpayClearSellerValidation(),
                    );
                  },
                ),

                const SizedBox(height: 40),

                // Seller Username Field
                if (_useUsername) ...[
                  Text(
                    "Seller's Username",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _sellerUsernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: tPrimaryColorShade4,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Enter username',
                      suffixIcon: BlocBuilder<EscrowpayBloc, EscrowpayState>(
                        builder: (context, state) {
                          if (state is EscrowpaySellerSearchLoading) {
                            return const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          } else if (state is EscrowpaySellerFound ||
                              state is EscrowpaySellerValidated) {
                            return const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            );
                          } else if (state is EscrowpaySellerNotFound) {
                            return const Icon(Icons.error, color: Colors.red);
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    onChanged: (_) => _onSellerFieldChanged(),
                  ),
                ],

                // Seller Phone Field
                if (!_useUsername) ...[
                  Text(
                    "Seller's Phone Number",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _sellerPhoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: tPrimaryColorShade4,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Enter phone number',
                      suffixIcon: BlocBuilder<EscrowpayBloc, EscrowpayState>(
                        builder: (context, state) {
                          if (state is EscrowpaySellerSearchLoading) {
                            return const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          } else if (state is EscrowpaySellerFound ||
                              state is EscrowpaySellerValidated) {
                            return const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            );
                          } else if (state is EscrowpaySellerNotFound) {
                            return const Icon(Icons.error, color: Colors.red);
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (_) => _onSellerFieldChanged(),
                  ),
                ],

                const SizedBox(height: 40),

                // Agreement Checkboxes
                AgreementCheckbox(
                  isChecked: _privacyAgreed,
                  onChanged: (value) {
                    setState(() {
                      _privacyAgreed = value ?? false;
                    });
                  },
                  child: _buildPrivacyAndRefundText(w),
                ),

                AgreementCheckbox(
                  isChecked: _policyAgreed,
                  onChanged: (value) {
                    setState(() {
                      _policyAgreed = value ?? false;
                    });
                  },
                  child: Text(
                    "Your product must adhere to GatePay Policy",
                    style: GoogleFonts.poppins(fontSize: w * 0.035),
                  ),
                ),

                AgreementCheckbox(
                  isChecked: _termsAgreed,
                  onChanged: (value) {
                    setState(() {
                      _termsAgreed = value ?? false;
                    });
                  },
                  child: Text(
                    'GatePay has rights to cancel your order if any T&C are violated',
                    style: GoogleFonts.poppins(fontSize: w * 0.035),
                  ),
                ),

                const SizedBox(height: 60),

                // Complete Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<EscrowpayBloc, EscrowpayState>(
                      builder: (context, state) {
                        final isLoading = state is EscrowpayPaymentCreating;
                        final hasValidSeller =
                            state is EscrowpaySellerFound ||
                            state is EscrowpaySellerValidated;
                        final canSubmit =
                            hasValidSeller &&
                            _privacyAgreed &&
                            _policyAgreed &&
                            _termsAgreed;

                        return ElevatedButton(
                          onPressed: isLoading || !canSubmit
                              ? null
                              : () => _createPayment(),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: canSubmit
                                ? Colors.blue
                                : Colors.grey,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Complete',
                                  style: TextStyle(fontSize: 16),
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

  void _createPayment() {
    final bloc = context.read<EscrowpayBloc>();

    // Get seller ID from validation
    String sellerId = '';
    if (bloc.validatedSeller != null) {
      sellerId = bloc.validatedSeller!.userId.isNotEmpty
          ? bloc.validatedSeller!.userId
          : 'new_user';
    }

    final request = CreatePaymentRequest(
      productName: bloc.productName,
      productDesc: bloc.productDesc,
      productCat: 'General',
      price: bloc.price,
      sellerId: sellerId,
      isRequested: true,
    );

    bloc.add(EscrowpayCreatePayment(request));
  }

  Widget _buildPrivacyAndRefundText(double w) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: w * 0.035),
        children: <TextSpan>[
          TextSpan(
            text: 'I agree to the ',
            style: GoogleFonts.poppins(fontSize: w * 0.035),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: GoogleFonts.poppins(
              color: Colors.blue,
              fontSize: w * 0.035,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: ' and ',
            style: GoogleFonts.poppins(fontSize: w * 0.035),
          ),
          TextSpan(
            text: 'Refund Policy',
            style: GoogleFonts.poppins(
              color: Colors.blue,
              fontSize: w * 0.035,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
