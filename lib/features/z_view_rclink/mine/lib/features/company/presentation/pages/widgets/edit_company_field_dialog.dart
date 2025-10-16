import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/custom_snackbar.dart';
import '../../bloc/company_bloc.dart';
import '../../bloc/company_event.dart';
import '../../bloc/company_state.dart';

class EditCompanyFieldDialog extends StatefulWidget {
  final String fieldName;
  final String fieldTitle;
  final String currentValue;
  final String companyUid;
  final TextInputType? keyboardType;
  final int? maxLines;

  const EditCompanyFieldDialog({
    Key? key,
    required this.fieldName,
    required this.fieldTitle,
    required this.currentValue,
    required this.companyUid,
    this.keyboardType,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<EditCompanyFieldDialog> createState() => _EditCompanyFieldDialogState();
}

class _EditCompanyFieldDialogState extends State<EditCompanyFieldDialog> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  bool _isUpdating = false;
  String? _errorMessage;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentValue);
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.text.length,
      );
    });
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
              _errorMessage = null;
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
              _errorMessage = _getErrorMessage(errorMessage);
            });
          },
          failure: (message) {
            setState(() {
              _isUpdating = false;
              _errorMessage = _getErrorMessage(message);
            });
          },
        );
      },
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Edit ${widget.fieldTitle}',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 18),
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                // labelText: widget.fieldTitle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: ResponsiveHelper.padding(
                  context,
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 16),
              ),
            ),
          ],
        ),
        actions: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<CompanyBloc, CompanyState>(
                  builder: (context, state) {
                    final isUpdating = state is CompanyUpdating;

                    return ElevatedButton(
                      onPressed: isUpdating ? null : _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: ResponsiveHelper.padding(
                          context,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: isUpdating
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
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryColor),
                    padding: ResponsiveHelper.padding(context, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${widget.fieldTitle} cannot be empty'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Validate email format
    if (widget.fieldName == 'email' && newValue.isNotEmpty) {
      if (!_isValidEmail(newValue)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a valid email address'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
    }

    // Validate website format
    if (widget.fieldName == 'website' && newValue.isNotEmpty) {
      if (!_isValidWebsite(newValue)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a valid website URL'),
            backgroundColor: Colors.orange,
          ),
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
    // Define which fields are required
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
    // Handle specific API error messages
    if (originalMessage.toLowerCase().contains('forbidden') ||
        originalMessage.contains('403')) {
      return 'You don\'t have permission to update this company. Please contact your administrator.';
    }

    if (originalMessage.toLowerCase().contains('unauthorized') ||
        originalMessage.contains('401')) {
      return 'Your session has expired. Please log in again.';
    }

    if (originalMessage.toLowerCase().contains('network') ||
        originalMessage.toLowerCase().contains('connection')) {
      return 'Network error. Please check your internet connection and try again.';
    }

    if (originalMessage.toLowerCase().contains('timeout')) {
      return 'Request timed out. Please try again.';
    }

    if (originalMessage.toLowerCase().contains('server') ||
        originalMessage.contains('500')) {
      return 'Server error. Please try again later.';
    }

    // Default fallback
    return 'Failed to update ${widget.fieldTitle.toLowerCase()}. Please try again.';
  }
}
