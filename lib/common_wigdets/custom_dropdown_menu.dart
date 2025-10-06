import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class CustomRealDropDownWithTitle extends StatelessWidget {
  final List<String> dataArray;
  final String title;
  final bool? isTitle;
  final String hint;
  final double height;
  final bool isIgnore;
  final bool isRequired;
  final String? selectedValue;
  final Function? selectTap;
  final double? titleHeight;
  final double? titleSize;
  final double? dropdownValueSize;
  final Color? dropdownValueColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? titleTextColor;

  const CustomRealDropDownWithTitle({
    super.key,
    required this.dataArray,
    required this.title,
    required this.hint,
    this.isRequired = false,
    this.height = 45,
    this.selectTap,
    this.selectedValue,
    this.titleHeight = 6,
    this.titleSize = 13,
    this.dropdownValueSize = 14,
    this.dropdownValueColor,
    this.hintTextColor,
    this.isIgnore = false,
    this.fillColor,
    this.titleTextColor,
    this.isTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child:
              isRequired
                  ? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: TextStyle(
                            color:
                                titleTextColor ??
                                Colors.black.withValues(alpha: 100),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.50,
                            letterSpacing: 0.15,
                          ),
                        ),
                        // TextSpan(
                        //   text: '*',
                        //   style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                        // ),
                      ],
                    ),
                  )
                  : isTitle == true
                  ? Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 100),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                      letterSpacing: 0.15,
                    ),
                  )
                  : SizedBox.shrink(),
        ),
        SizedBox(height: titleHeight),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          color: fillColor ?? AppColors.cF5F5F5,
          child: SizedBox(
            height: height,
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Center(
                child: IgnorePointer(
                  ignoring: isIgnore,
                  child: DropdownButton<String>(
                    dropdownColor: fillColor ?? Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    iconEnabledColor: hintTextColor ?? AppColors.c6C6C6C,
                    isExpanded: true,
                    underline: SizedBox(),
                    value: selectedValue,
                    elevation: 4,
                    hint: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text(
                        hint,
                        style: TextStyle(
                          color: hintTextColor ?? Colors.black,
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.50,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                    isDense: true,
                    items:
                        dataArray.map((String ds) {
                          return DropdownMenuItem<String>(
                            value: ds,
                            child: Text(
                              ds,
                              style: TextStyle(
                                color: hintTextColor ?? Colors.black,
                                fontSize: 13.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                                letterSpacing: 0.15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                    onChanged:
                        (value) => selectTap != null ? selectTap!(value) : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
