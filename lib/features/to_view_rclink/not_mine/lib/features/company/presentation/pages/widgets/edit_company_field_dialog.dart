import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/utils/responsive_helper.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentValue);
    _focusNode = FocusNode();

    // Auto-focus and select all text
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
          updating: () {},
          loaded: (companies, selectedCompany) {
            // Successfully updated, close dialog
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${widget.fieldTitle} updated successfully'),
                backgroundColor: Colors.green,
              ),
            );
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to update: $message'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: AlertDialog(
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
                labelText: widget.fieldTitle,
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
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: ResponsiveHelper.fontSize(context, base: 14),
              ),
            ),
          ),
          BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              final isUpdating = state is CompanyUpdating;

              return ElevatedButton(
                onPressed: isUpdating ? null : _handleSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: ResponsiveHelper.padding(
                    context,
                    horizontal: 20,
                    vertical: 12,
                  ),
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
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              );
            },
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
}
