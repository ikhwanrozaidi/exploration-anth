import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../shared/utils/build_loading_indicator.dart';
import '../../../../../../shared/utils/theme.dart';
import '../bloc/escrow_pay_bloc.dart';
import '../bloc/escrow_pay_event.dart';
import '../bloc/escrow_pay_state.dart';
import 'widgets/agreement_checkbox_widget.dart';
import 'widgets/error_widget.dart';
import 'widgets/seller_account_widget.dart';

class EscrowpayForm1Page extends StatefulWidget {
  final String? title;
  
  const EscrowpayForm1Page({
    super.key,
    this.title,
  });

  @override
  State<EscrowpayForm1Page> createState() => _EscrowpayForm1PageState();
}

class _EscrowpayForm1PageState extends State<EscrowpayForm1Page> {
  final TextEditingController _sellerIdentifierController = TextEditingController();

  @override
  void dispose() {
    _sellerIdentifierController.dispose();
    super.dispose();
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
          if (state is EscrowpayTransactionSubmitted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Transaction created successfully! ID: ${state.transactionId}'),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate back to previous screens
            Navigator.pop(context);
            Navigator.pop(context);
          } else if (state is EscrowpayError) {
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
              hasAccount: state.hasAccount,
              onToggle: (hasAccount) {
                context.read<EscrowpayBloc>().add(UpdateSellerInfo(
                  hasAccount: hasAccount,
                  sellerIdentifier: state.sellerIdentifier,
                ));
                // Clear the text field when toggling
                _sellerIdentifierController.clear();
              },
            ),
            
            const SizedBox(height: 40),
            
            // Seller Identifier Field
            Text(
              state.hasAccount ? "Seller's Username" : "Seller's Phone Number",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _sellerIdentifierController,
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
                hintText: state.hasAccount 
                    ? 'Enter username' 
                    : 'Enter phone number',
              ),
              keyboardType: state.hasAccount 
                  ? TextInputType.text 
                  : TextInputType.phone,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(UpdateSellerInfo(
                  hasAccount: state.hasAccount,
                  sellerIdentifier: value,
                ));
              },
            ),
            
            const SizedBox(height: 40),
            
            // Agreement Checkboxes
            AgreementCheckbox(
              isChecked: state.agreements[AgreementType.privacyAndRefund] ?? false,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(ToggleAgreement(
                  type: AgreementType.privacyAndRefund,
                  isAgreed: value ?? false,
                ));
              },
              child: _buildPrivacyAndRefundText(w),
            ),
            
            AgreementCheckbox(
              isChecked: state.agreements[AgreementType.gatepayPolicy] ?? false,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(ToggleAgreement(
                  type: AgreementType.gatepayPolicy,
                  isAgreed: value ?? false,
                ));
              },
              child: Text(
                "Your product must adhere to GatePay Policy",
                style: GoogleFonts.poppins(fontSize: w * 0.035),
              ),
            ),
            
            AgreementCheckbox(
              isChecked: state.agreements[AgreementType.termsAndConditions] ?? false,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(ToggleAgreement(
                  type: AgreementType.termsAndConditions,
                  isAgreed: value ?? false,
                ));
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
                    final isLoading = state is EscrowpayLoading;
                    final canSubmit = state is EscrowpayLoaded && state.isFormValid;
                    
                    return ElevatedButton(
                      onPressed: isLoading || !canSubmit ? null : () {
                        context.read<EscrowpayBloc>().add(const SubmitEscrowTransaction());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: canSubmit ? tPrimaryColor : Colors.grey,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
    );
  }

  Widget _buildPrivacyAndRefundText(double w) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: w * 0.035,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'I agree to the ',
            style: GoogleFonts.poppins(fontSize: w * 0.035),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: GoogleFonts.poppins(
              color: tPrimaryColor,
              fontSize: w * 0.035,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              // TODO: Navigate to Privacy Policy
            },
          ),
          TextSpan(
            text: ' and ',
            style: GoogleFonts.poppins(fontSize: w * 0.035),
          ),
          TextSpan(
            text: 'Refund Policy',
            style: GoogleFonts.poppins(
              color: tPrimaryColor,
              fontSize: w * 0.035,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              // TODO: Navigate to Refund Policy
            },
          ),
        ],
      ),
    );
  }
}