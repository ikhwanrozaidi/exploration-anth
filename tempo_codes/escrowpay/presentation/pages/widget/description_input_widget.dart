import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../shared/utils/theme.dart';

class MultiDescriptionInput extends StatefulWidget {
  final Function(List<String>) onDescriptionsChanged;

  const MultiDescriptionInput({super.key, required this.onDescriptionsChanged});

  @override
  State<MultiDescriptionInput> createState() => _MultiDescriptionInputState();
}

class _MultiDescriptionInputState extends State<MultiDescriptionInput> {
  final PageController _pageController = PageController();
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<bool> _isLocked = [false];
  int _currentPage = 0;
  static const int _maxDescriptions = 5;
  static const int _maxWords = 50;
  static const int _minWords = 3;

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  int _countWords(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }

  bool _canShowTick(int index) {
    final text = _controllers[index].text;
    final words = _countWords(text);

    return words >= _minWords && words <= _maxWords;
  }

  void _lockDescription(int index) {
    setState(() {
      _isLocked[index] = true;

      // Auto-create next page if not at max
      if (index == _controllers.length - 1 &&
          _controllers.length < _maxDescriptions) {
        _controllers.add(TextEditingController());
        _isLocked.add(false);

        // Animate to next page
        Future.delayed(const Duration(milliseconds: 100), () {
          _pageController.animateToPage(
            _controllers.length - 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }

      _notifyChange();
    });
  }

  void _unlockDescription(int index) {
    setState(() {
      _isLocked[index] = false;
    });
  }

  void _notifyChange() {
    final descriptions = _controllers
        .asMap()
        .entries
        .where(
          (entry) => _isLocked[entry.key] && entry.value.text.trim().isNotEmpty,
        )
        .map((entry) => entry.value.text.trim())
        .toList();

    widget.onDescriptionsChanged(descriptions);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PageView Container
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: tPrimaryColorShade4,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          // Text Field
                          TextFormField(
                            controller: _controllers[index],
                            enabled: !_isLocked[index],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: _isLocked[index]
                                  ? Colors.grey.shade600
                                  : Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Enter product description ${index + 1}...',
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            maxLines: null,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),

                          // // Tick/Edit Button
                          // Positioned(
                          //   bottom: 0,
                          //   right: 0,
                          //   child: _isLocked[index]
                          //       ? IconButton(
                          //           icon: const Icon(
                          //             Icons.edit,
                          //             color: Colors.blue,
                          //             size: 20,
                          //           ),
                          //           onPressed: () => _unlockDescription(index),
                          //         )
                          //       : _canShowTick(index)
                          //       ? IconButton(
                          //           icon: const Icon(
                          //             Icons.check_circle,
                          //             color: Colors.green,
                          //             size: 24,
                          //           ),
                          //           onPressed: () => _lockDescription(index),
                          //         )
                          //       : const SizedBox.shrink(),
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        _controllers.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 6),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? passiveColor
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    _isLocked[_currentPage]
                        ? InkWell(
                            onTap: () => _unlockDescription(_currentPage),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 20,
                            ),
                          )
                        : _canShowTick(_currentPage)
                        ? InkWell(
                            onTap: () => _lockDescription(_currentPage),
                            child: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 24,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     // Dot Indicators
        //     Row(
        //       children: List.generate(
        //         _controllers.length,
        //         (index) => Container(
        //           margin: const EdgeInsets.only(right: 6),
        //           width: 8,
        //           height: 8,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: _currentPage == index
        //                 ? passiveColor
        //                 : Colors.grey.shade300,
        //           ),
        //         ),
        //       ),
        //     ),

        //     // Word Counter
        //     Builder(
        //       builder: (context) {
        //         final words = _countWords(_controllers[_currentPage].text);
        //         final isNearLimit = words > 40;
        //         final isOverLimit = words > _maxWords;

        //         return Text(
        //           '$words/$_maxWords words',
        //           style: GoogleFonts.poppins(
        //             fontSize: 12,
        //             color: isOverLimit
        //                 ? Colors.red
        //                 : isNearLimit
        //                 ? Colors.orange
        //                 : Colors.grey.shade600,
        //             fontWeight: isNearLimit ? FontWeight.w600 : FontWeight.w400,
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ),

        // Minimum Words Info
        //
        // Padding(
        //   padding: const EdgeInsets.only(top: 4),
        //   child: Text(
        //     'Minimum $_minWords words required',
        //     style: GoogleFonts.poppins(
        //       fontSize: 11,
        //       color: Colors.grey.shade500,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
