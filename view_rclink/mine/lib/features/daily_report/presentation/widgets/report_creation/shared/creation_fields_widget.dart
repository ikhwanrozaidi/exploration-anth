import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';

// Custom Daily Report FIELDS
class DailyReportCreationFields extends StatefulWidget {
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
  State<DailyReportCreationFields> createState() =>
      _DailyReportCreationFieldsState();
}

class _DailyReportCreationFieldsState extends State<DailyReportCreationFields> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    // Initialize controller with current value
    _textController = TextEditingController(text: widget.currentValue ?? '');
  }

  @override
  void didUpdateWidget(DailyReportCreationFields oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update controller when currentValue changes
    if (widget.currentValue != oldWidget.currentValue) {
      _textController.text = widget.currentValue ?? '';
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.errorText != null ? Colors.red : Colors.grey.shade400,
          width: widget.errorText != null ? 1.5 : 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isBottomSheet) _buildBottomSheetField(context),
          if (widget.isTextField) _buildTextFieldField(),
          if (!widget.isTextField && !widget.isBottomSheet) _buildImageField(),
          if (widget.errorText != null) _buildErrorText(),
        ],
      ),
    );
  }

  // Click and bottomsheet appear
  Widget _buildBottomSheetField(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 214, 226, 255),
              shape: BoxShape.circle,
            ),
            child: Icon(widget.icon, color: primaryColor),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title),
                Text(
                  widget.currentValue ?? widget.description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: widget.currentValue == null
                        ? Colors.red
                        : Colors.black,
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.icon == null
            ? SizedBox()
            : Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 226, 255),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, color: primaryColor),
              ),

        const SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),

              SizedBox(height: 5),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController, // Use the controller here
                        keyboardType: widget.isTextNumber
                            ? TextInputType.number
                            : TextInputType.text,
                        onChanged: (value) {
                          // Call the callback when text changes
                          widget.onTextChanged?.call(value);
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: widget.textFieldHintText,
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),

                    widget.textFieldUnits == null
                        ? SizedBox()
                        : Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: widget.textFieldUnits == null
                                ? SizedBox()
                                : Text(
                                    widget.textFieldUnits ?? '',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                  ],
                ),
              ),

              if (widget.textFieldRange != null)
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Range: 0.00 to ${widget.textFieldRange!.toStringAsFixed(2)}',
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
              child: Icon(widget.icon, color: Colors.blue),
            ),
            const SizedBox(width: 20),
            Text(widget.title),
          ],
        ),
        SizedBox(height: 10),
        _buildImageGrid(),
        _buildAddImageButton(),
      ],
    );
  }

  Widget _buildImageGrid() {
    if (widget.currentImages == null || widget.currentImages!.isEmpty) {
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
      itemCount: widget.currentImages!.length,
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
                onTap: () =>
                    widget.onImageRemoved?.call(widget.currentImages![index]),
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
          widget.onImageAdded?.call(
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
        widget.errorText!,
        style: TextStyle(color: Colors.red, fontSize: 12),
      ),
    );
  }
}
