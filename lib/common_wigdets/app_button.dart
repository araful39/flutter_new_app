import 'package:flutter/material.dart';
import 'package:flutter_application/constants/app_colors.dart';
import 'package:flutter_application/constants/text_font_style.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? buttonColor;
  final Color borderColor;
  final double? width;
  final double? height;
  final TextStyle? style;
  final double borderRadius;
  final Widget? suffixIcon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.allPrimaryColor,
    this.borderColor = Colors.transparent,
    this.width,
    this.height,
    this.style,
    this.borderRadius = 16,
    this.suffixIcon,
    this.buttonColor = AppColors.allPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // 80% of screen width
      height: height ?? 60, // 6% of screen height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(width: 1, color: borderColor),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              text,
              style:
                  style ??
                  TextFontStyle.textStyle20Urbanist500c262626.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.cFFFFFF,
                  ),
            ),
            suffixIcon == null ? SizedBox.shrink() : suffixIcon!,
          ],
        ),
      ),
    );
  }
}
