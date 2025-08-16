// lib/features/pay_boarding/features/escrow_pay/presentation/pages/escrow_form1_page.dart
import 'dart:async';
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
  final EscrowpayBloc? bloc;

  const EscrowpayForm1Page({super.key, this.title, this.bloc});

  @override
  State<EscrowpayForm1Page> createState() => _EscrowpayForm1PageState();
}

class _EscrowpayForm1PageState extends State<EscrowpayForm1Page> {
  final TextEditingController _sellerIdentifierController =
      TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _sellerIdentifierController.addListener(_onSellerIdentifierChanged);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _sellerIdentifierController.removeListener(_onSellerIdentifierChanged);
    _sellerIdentifierController.dispose();
    super.dispose();
  }

  void _onSellerIdentifierChanged() {
    print('🔍 Text changed: "${_sellerIdentifierController.text}"');

    final currentState = context.read<EscrowpayBloc>().state;
    print('🔍 Current BLoC state: ${currentState.runtimeType}');

    if (currentState is EscrowpayLoaded) {
      print('🔍 Updating seller info - hasAccount: ${currentState.hasAccount}');

      // Update the identifier in state
      context.read<EscrowpayBloc>().add(
        UpdateSellerInfo(
          hasAccount: currentState.hasAccount,
          sellerIdentifier: _sellerIdentifierController.text,
        ),
      );

      // Trigger validation with debouncing
      _debounceTimer?.cancel();
      if (_sellerIdentifierController.text.isNotEmpty) {
        print(
          '🔍 Setting up validation timer for: "${_sellerIdentifierController.text}"',
        );
        _debounceTimer = Timer(const Duration(milliseconds: 800), () {
          print(
            '🔍 Timer fired! Validating: "${_sellerIdentifierController.text}" (isUsername: ${currentState.hasAccount})',
          );
          context.read<EscrowpayBloc>().add(
            ValidateSellerIdentifier(
              identifier: _sellerIdentifierController.text,
              isUsername: currentState.hasAccount,
            ),
          );
        });
      } else {
        print('🔍 Text is empty, not setting validation timer');
      }
    } else {
      print('🔍 State is not EscrowpayLoaded, cannot validate');
    }
  }

  @override
  Widget build(BuildContext context) {
    // If bloc is passed, use it; otherwise try to read from context
    final escrowBloc = widget.bloc ?? context.read<EscrowpayBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay with Escrow',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: BlocProvider<EscrowpayBloc>.value(
        value: escrowBloc,
        child: BlocConsumer<EscrowpayBloc, EscrowpayState>(
          listener: (context, state) {
            if (state is EscrowpayTransactionSubmitted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Transaction created successfully! ${state.message}',
                  ),
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
            print('EscrowForm1Page - Current state: ${state.runtimeType}');
            if (state is EscrowpayError) {
              print('EscrowForm1Page - Error: ${state.message}');
            }

            if (state is EscrowpayLoaded) {
              return _buildLoadedContent(context, state);
            } else if (state is EscrowpayLoading) {
              return Center(
                child: buildLoadingIndicator(blur: 0, isCentered: true),
              );
            } else if (state is EscrowpayError) {
              return EscrowpayErrorWidget(
                message: state.message,
                onRetry: () {
                  Navigator.pop(context);
                },
              );
            } else {
              print('EscrowForm1Page - Unknown state, showing error widget');
              return EscrowpayErrorWidget(
                message:
                    'Something went wrong - State: ${state.runtimeType}. Please go back and try again.',
                onRetry: () {
                  Navigator.pop(context);
                },
              );
            }
          },
        ),
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
                context.read<EscrowpayBloc>().add(
                  UpdateSellerInfo(
                    hasAccount: hasAccount,
                    sellerIdentifier: '',
                  ),
                );
                // Clear the text field when toggling
                _sellerIdentifierController.clear();
              },
            ),

            const SizedBox(height: 40),

            // Seller Identifier Field with Validation
            Text(
              state.hasAccount ? "Seller's Username" : "Seller's Phone Number",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: state.validationBorderColor,
                  width: 2,
                ),
              ),
              child: TextFormField(
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
                  suffixIcon: _buildValidationIcon(state),
                ),
                keyboardType: state.hasAccount
                    ? TextInputType.text
                    : TextInputType.phone,
              ),
            ),

            // Validation Message
            if (state.validationMessage.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                state.validationMessage,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color:
                      state.sellerValidationState == SellerValidationState.valid
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],

            const SizedBox(height: 40),

            // Agreement Checkboxes
            AgreementCheckbox(
              isChecked:
                  state.agreements[AgreementType.privacyAndRefund] ?? false,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(
                  ToggleAgreement(
                    type: AgreementType.privacyAndRefund,
                    isAgreed: value ?? false,
                  ),
                );
              },
              child: _buildPrivacyAndRefundText(w),
            ),

            AgreementCheckbox(
              isChecked: state.agreements[AgreementType.gatepayPolicy] ?? false,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(
                  ToggleAgreement(
                    type: AgreementType.gatepayPolicy,
                    isAgreed: value ?? false,
                  ),
                );
              },
              child: Text(
                "Your product must adhere to GatePay Policy",
                style: GoogleFonts.poppins(fontSize: w * 0.035),
              ),
            ),

            AgreementCheckbox(
              isChecked:
                  state.agreements[AgreementType.termsAndConditions] ?? false,
              onChanged: (value) {
                context.read<EscrowpayBloc>().add(
                  ToggleAgreement(
                    type: AgreementType.termsAndConditions,
                    isAgreed: value ?? false,
                  ),
                );
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
                    final canSubmit =
                        state is EscrowpayLoaded && state.isFormValid;

                    return ElevatedButton(
                      onPressed: isLoading || !canSubmit
                          ? null
                          : () {
                              context.read<EscrowpayBloc>().add(
                                const SubmitEscrowTransaction(),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: canSubmit
                            ? tPrimaryColor
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
    );
  }

  Widget? _buildValidationIcon(EscrowpayLoaded state) {
    if (state.sellerValidationState == SellerValidationState.validating) {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    } else if (state.validationIcon != null) {
      return Icon(
        state.validationIcon,
        color: state.sellerValidationState == SellerValidationState.valid
            ? Colors.green
            : Colors.red,
      );
    }
    return null;
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
              color: tPrimaryColor,
              fontSize: w * 0.035,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: Navigate to Refund Policy
              },
          ),
        ],
      ),
    );
  }
}
