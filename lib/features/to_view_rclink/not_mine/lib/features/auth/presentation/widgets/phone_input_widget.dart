import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../locale/presentation/widgets/app_localization.dart';

class PhoneInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String completeNumber) onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool isLoading;
  final String initialCountryCode;

  const PhoneInputWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    this.validator,
    this.errorText,
    this.isLoading = false,
    this.initialCountryCode = 'MY',
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final isTablet = ResponsiveHelper.isTablet(context);
    
    return Container(
      constraints: isTablet 
          ? const BoxConstraints(maxWidth: 500)
          : const BoxConstraints(),
      child: Column(
        children: [
          IntlPhoneField(
            controller: controller,
            disableLengthCheck: true,
            decoration: InputDecoration(
              counterText: '',
              hintText: localization.auth('phoneNumber'),
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: ResponsiveHelper.adaptive(
                  context,
                  mobile: 16,
                  tablet: 18,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null ? Colors.red : Colors.grey[300]!,
                  width: 1,
                ),
                borderRadius: ResponsiveHelper.borderRadius(context, all: 12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null ? Colors.red : Colors.grey[300]!,
                  width: 1,
                ),
                borderRadius: ResponsiveHelper.borderRadius(context, all: 12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText != null ? Colors.red : Colors.blue,
                  width: 1,
                ),
                borderRadius: ResponsiveHelper.borderRadius(context, all: 12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: ResponsiveHelper.borderRadius(context, all: 12),
              ),
              contentPadding: ResponsiveHelper.padding(
                context,
                horizontal: 20,
                vertical: 16,
              ),
            ),
            initialCountryCode: initialCountryCode,
            showCountryFlag: true,
            showDropdownIcon: true,
            dropdownIcon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[600],
              size: ResponsiveHelper.iconSize(context, base: 20),
            ),
            flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 8),
            flagsButtonMargin: const EdgeInsets.only(right: 8),
            style: TextStyle(
              fontSize: ResponsiveHelper.adaptive(
                context,
                mobile: 16,
                tablet: 18,
              ),
            ),
            dropdownTextStyle: TextStyle(
              fontSize: ResponsiveHelper.adaptive(
                context,
                mobile: 16,
                tablet: 18,
              ),
            ),
            pickerDialogStyle: PickerDialogStyle(
              backgroundColor: Colors.white,
              countryNameStyle: TextStyle(
                fontSize: ResponsiveHelper.adaptive(
                  context,
                  mobile: 14,
                  tablet: 16,
                ),
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              countryCodeStyle: TextStyle(
                fontSize: ResponsiveHelper.adaptive(
                  context,
                  mobile: 14,
                  tablet: 16,
                ),
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
              searchFieldInputDecoration: InputDecoration(
                hintText: 'Search country...',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: ResponsiveHelper.adaptive(
                    context,
                    mobile: 14,
                    tablet: 16,
                  ),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Colors.grey[50],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              padding: const EdgeInsets.all(15),
              listTilePadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              listTileDivider: Container(
                height: 1,
                color: Colors.grey[200],
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              searchFieldCursorColor: Colors.blue,
            ),
            onChanged: (phone) {
              onChanged(phone.completeNumber);
            },
            validator: (phone) {
              if (validator != null) {
                return validator!(phone?.completeNumber);
              }
              return null;
            },
          ),
          SizedBox(height: ResponsiveHelper.spacing(context, 10)),
          Text(
            localization.auth('smsInfo'),
            style: TextStyle(
              fontSize: ResponsiveHelper.adaptive(
                context,
                mobile: 13,
                tablet: 14,
                desktop: 15,
              ),
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}