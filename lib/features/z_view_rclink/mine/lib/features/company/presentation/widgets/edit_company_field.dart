import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import '../bloc/company_state.dart';

class EditCompanyField extends StatefulWidget {
  final String fieldName;
  final String fieldTitle;
  final String currentValue;
  final String companyUid;
  final TextInputType? keyboardType;
  final int? maxLines;

  const EditCompanyField({
    super.key,
    required this.fieldName,
    required this.fieldTitle,
    required this.currentValue,
    required this.companyUid,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  State<EditCompanyField> createState() => _EditCompanyFieldState();
}

class _EditCompanyFieldState extends State<EditCompanyField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompanyBloc, CompanyState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          updating: () {
            setState(() {
              _isUpdating = true;
            });
          },
          loaded: (companies, selectedCompany) {
            if (_isUpdating) {
              setState(() {
                _isUpdating = false;
              });
              Navigator.of(context).pop();
              CustomSnackBar.show(
                context,
                '${widget.fieldTitle} updated successfully',
                type: SnackBarType.success,
              );
            }
          },
          fieldUpdateFailure: (companies, errorMessage, selectedCompany) {
            setState(() {
              _isUpdating = false;
            });
            CustomSnackBar.show(
              context,
              _getErrorMessage(errorMessage),
              type: SnackBarType.error,
            );
          },
          failure: (message) {
            setState(() {
              _isUpdating = false;
            });
            CustomSnackBar.show(
              context,
              _getErrorMessage(message),
              type: SnackBarType.error,
            );
          },
        );
      },

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 20,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(-2, 6),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              SizedBox(width: ResponsiveHelper.spacing(context, 15)),
              Text(
                'Edit ${widget.fieldTitle}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current ${widget.fieldTitle}'),

                SizedBox(height: ResponsiveHelper.spacing(context, 5)),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade500, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text(
                    widget.currentValue.isEmpty
                        ? 'No data available'
                        : widget.currentValue,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 20)),

                Text('New ${widget.fieldTitle}'),

                SizedBox(height: ResponsiveHelper.spacing(context, 5)),

                TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: widget.keyboardType ?? TextInputType.text,
                  maxLines: widget.maxLines,
                  decoration: InputDecoration(
                    hintText: 'Enter new ${widget.fieldTitle.toLowerCase()}',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: ResponsiveHelper.padding(
                      context,
                      horizontal: 12,
                      vertical: 12,
                    ),
                    isDense: true,
                  ),
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 16),
                  ),
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 50)),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isUpdating
                            ? null
                            : () {
                                Navigator.pop(context);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.redAccent,
                            width: ResponsiveHelper.adaptive(
                              context,
                              mobile: 1.0,
                              tablet: 1.5,
                              desktop: 2.0,
                            ),
                          ),
                          padding: ResponsiveHelper.padding(
                            context,
                            vertical: 10,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: ResponsiveHelper.borderRadius(
                              context,
                              all: 14,
                            ),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),

                    SizedBox(width: ResponsiveHelper.spacing(context, 10)),

                    Expanded(
                      child: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _controller,
                        builder: (context, value, child) {
                          final newValue = value.text.trim();
                          final isDisabled =
                              _isUpdating ||
                              newValue.isEmpty ||
                              newValue == widget.currentValue;

                          return ElevatedButton(
                            onPressed: isDisabled ? null : _handleSave,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDisabled
                                  ? Colors.grey[300]
                                  : primaryColor,
                              disabledBackgroundColor: Colors.grey[300],
                              padding: ResponsiveHelper.padding(
                                context,
                                vertical: 10,
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: ResponsiveHelper.borderRadius(
                                  context,
                                  all: 14,
                                ),
                              ),
                              elevation: isDisabled
                                  ? 0
                                  : ResponsiveHelper.adaptive(
                                      context,
                                      mobile: 1,
                                      tablet: 2,
                                      desktop: 3,
                                    ),
                            ),
                            child: _isUpdating
                                ? SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'Update',
                                    style: TextStyle(
                                      color: isDisabled
                                          ? Colors.grey[600]
                                          : Colors.white,
                                    ),
                                  ),
                          );
                        },
                      ),
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

  void _handleSave() {
    final newValue = _controller.text.trim();

    // Don't save if value hasn't changed
    if (newValue == widget.currentValue) {
      Navigator.of(context).pop();
      return;
    }

    // Validate empty fields for required ones
    if (newValue.isEmpty && _isRequiredField(widget.fieldName)) {
      CustomSnackBar.show(
        context,
        '${widget.fieldTitle} cannot be empty',
        type: SnackBarType.error,
      );
      return;
    }

    // Validate email format
    if (widget.fieldName == 'email' && newValue.isNotEmpty) {
      if (!_isValidEmail(newValue)) {
        CustomSnackBar.show(
          context,
          'Please enter a valid email address',
          type: SnackBarType.error,
        );
        return;
      }
    }

    // Validate website format
    if (widget.fieldName == 'website' && newValue.isNotEmpty) {
      if (!_isValidWebsite(newValue)) {
        CustomSnackBar.show(
          context,
          'Please enter a valid website URL',
          type: SnackBarType.error,
        );
        return;
      }
    }

    // Trigger update event
    context.read<CompanyBloc>().add(
      CompanyEvent.updateCompanyField(
        companyUid: widget.companyUid,
        fieldName: widget.fieldName,
        fieldValue: newValue,
      ),
    );
  }

  bool _isRequiredField(String fieldName) {
    return ['name'].contains(fieldName);
  }

  bool _isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  bool _isValidWebsite(String website) {
    return Uri.tryParse(website) != null &&
        (website.startsWith('http://') || website.startsWith('https://'));
  }

  String _getErrorMessage(String originalMessage) {
    if (originalMessage.toLowerCase().contains('forbidden') ||
        originalMessage.contains('403')) {
      return 'You don\'t have permission to update this company. Please contact your administrator.';
    }

    if (originalMessage.toLowerCase().contains('network') ||
        originalMessage.toLowerCase().contains('connection')) {
      return 'Network error. Please check your connection and try again.';
    }

    if (originalMessage.toLowerCase().contains('timeout')) {
      return 'Request timeout. Please try again.';
    }

    return originalMessage.isNotEmpty
        ? originalMessage
        : 'Failed to update ${widget.fieldTitle}. Please try again.';
  }
}
