import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';

// Custom Daily Report FIELDS
class DailyReportCreationFields extends StatelessWidget {
  final bool focus;
  final String title;
  final String description;
  final IconData? icon;
  final bool isTextField;
  final bool isBottomSheet;
  final bool isTextNumber;
  final String? textFieldHintText;
  final double? textFieldRange;
  final String? textFieldUnits;
  final List<String>? dropdownOptions;
  final List<String>? currentImages;
  final String? currentValue;
  final String? errorText;
  final Function(String)? onTextChanged;
  final Function(String)? onImageAdded;
  final Function(String)? onImageRemoved;
  final Function(String)? onDropdownSelected;
  final VoidCallback? onTap;

  const DailyReportCreationFields({
    Key? key,
    required this.focus,
    required this.title,
    required this.description,
    this.icon,
    required this.isTextField,
    required this.isBottomSheet,
    required this.isTextNumber,
    this.textFieldHintText,
    this.textFieldRange,
    this.textFieldUnits,
    this.dropdownOptions,
    this.currentImages,
    this.currentValue,
    this.errorText,
    this.onTextChanged,
    this.onImageAdded,
    this.onImageRemoved,
    this.onDropdownSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: errorText != null ? Colors.red : Colors.grey.shade400,
          width: errorText != null ? 1.5 : 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBottomSheet) _buildBottomSheetField(context),
          if (isTextField) _buildTextFieldField(),
          if (!isTextField && !isBottomSheet) _buildImageField(),
          if (errorText != null) _buildErrorText(),
        ],
      ),
    );
  }

  // Click and bottomsheet appear
  Widget _buildBottomSheetField(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 214, 226, 255),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  currentValue ?? description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: currentValue == null ? Colors.red : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color.fromARGB(255, 214, 226, 255),
            ),
            child: Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  // Textfield
  Widget _buildTextFieldField() {
    return Row(
      children: [
        icon == null
            ? SizedBox()
            : Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 226, 255),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: primaryColor),
              ),

        const SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),

              SizedBox(height: 5),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: isTextNumber
                            ? TextInputType.number
                            : TextInputType.text,
                        onChanged: onTextChanged,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: textFieldHintText,
                          border: InputBorder.none,

                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: textFieldUnits == null
                          ? SizedBox()
                          : Text(
                              textFieldUnits ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ],
                ),
              ),

              if (textFieldRange != null)
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Range: 0.00 to ${textFieldRange!.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // Input Image
  Widget _buildImageField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 214, 226, 255),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.blue),
            ),
            const SizedBox(width: 20),
            Text(title),
          ],
        ),
        SizedBox(height: 10),
        _buildImageGrid(),
        _buildAddImageButton(),
      ],
    );
  }

  Widget _buildImageGrid() {
    if (currentImages == null || currentImages!.isEmpty) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'No images added',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: currentImages!.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.grey.shade200,
                  width: double.infinity,
                  height: double.infinity,
                  child: Icon(
                    Icons.image,
                    color: Colors.grey.shade400,
                    size: 40,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => onImageRemoved?.call(currentImages![index]),
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddImageButton() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          // Simulate image picker
          onImageAdded?.call(
            'image_${DateTime.now().millisecondsSinceEpoch}.jpg',
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_a_photo, color: Colors.blue),
              SizedBox(width: 8),
              Text('Add Image', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorText() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        errorText!,
        style: TextStyle(color: Colors.red, fontSize: 12),
      ),
    );
  }
}
