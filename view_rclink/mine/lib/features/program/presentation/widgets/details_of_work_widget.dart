import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import 'package:rclink_app/shared/widgets/divider_config.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/template_page.dart';

class DetailsOfWorkProgramWidget extends StatelessWidget {
  const DetailsOfWorkProgramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: TemplatePage(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update Program',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveHelper.fontSize(context, base: 16),
                ),
              ),
              Text(
                'Update the information below if required',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.black,
                          size: ResponsiveHelper.iconSize(context, base: 20),
                        ),

                        SizedBox(width: 20),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'districtName',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 12,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'roadNo - roadName',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: primaryShade,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.swap_calls,
                                color: primaryColor,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 20,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 20),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'From',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 12,
                                                  ),
                                            ),
                                          ),

                                          SizedBox(height: 5),

                                          TextField(
                                            keyboardType:
                                                const TextInputType.numberWithOptions(
                                                  decimal: true,
                                                ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d*\.?\d*'),
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 14,
                                                  ),
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.start,

                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10,
                                                  ),
                                              isDense: true,
                                              hintText: 'null',
                                              hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontWeight: FontWeight.w400,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: primaryColor,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 10),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'To',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 12,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          TextField(
                                            keyboardType:
                                                const TextInputType.numberWithOptions(
                                                  decimal: true,
                                                ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d*\.?\d*'),
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 14,
                                                  ),
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10,
                                                  ),
                                              isDense: true,
                                              hintText: 'null',
                                              hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontWeight: FontWeight.w400,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: primaryColor,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5),

                                Text(
                                  'Range from null to null',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total length of null',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.fontSize(context, base: 13),
                      ),
                    ),

                    dividerConfig(),

                    Text(
                      'Length of null',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.fontSize(context, base: 13),
                      ),
                    ),

                    SizedBox(height: 5),

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*'),
                                ),
                              ],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: '1000',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),

                          SizedBox(width: 10),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'null',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
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
                    elevation: ResponsiveHelper.adaptive(
                      context,
                      mobile: 1,
                      tablet: 2,
                      desktop: 3,
                    ),
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
