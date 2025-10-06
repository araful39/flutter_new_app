// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gabipoli_app/common_wigdets/auth_button.dart';
// import 'package:gabipoli_app/constants/app_colors.dart';
// import 'package:gabipoli_app/constants/text_font_style.dart';
// import 'package:gabipoli_app/helpers/ui_helpers.dart';
// import 'package:svg_flutter/svg.dart';
// import '../../../../constants/app_assets/assets_icons.dart';
// import '../../../../constants/app_assets/assets_image.dart';

// class CustomSuccessfullScreen extends StatelessWidget {
//   final String? title;
//   final String? subTitle;
//   final String? buttonName;
//   final VoidCallback? ontap;
//   const CustomSuccessfullScreen({
//     super.key,
//     this.title,
//     this.subTitle,
//     this.buttonName,
//     this.ontap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Positioned.fill(
//                   child: SvgPicture.asset(
//                     AssetsImages.forgotPasswordBg,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   child: Column(
//                     children: [
//                       UIHelper.verticalSpace(160.h),
//                       SvgPicture.asset(AssetsIcons.confirm),
//                       UIHelper.verticalSpace(26.h),
//                       Text(
//                         title ?? '',
//                         textAlign: TextAlign.center,
//                         style: TextFontStyle.textStyle20PoppinsBoldW700cFFFFFF
//                             .copyWith(
//                               color: Color(0xFF222222),
//                               fontSize: 30.sp,
//                               fontWeight: FontWeight.w700,
//                               letterSpacing: -0.52,
//                             ),
//                       ),
//                       UIHelper.verticalSpace(8.h),
//                       Text(
//                         subTitle ?? '',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: const Color(0xB2222222),
//                           fontSize: 14.sp,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w400,
//                           height: 1.25,
//                         ),
//                       ),
//                       UIHelper.verticalSpace(32.h),
//                       AppCustomeButton(
//                         name: buttonName ?? '',
//                         onCallBack: () {
//                           if (ontap == null) {
//                             log('Nothin Action Happend');
//                             return;
//                           }
//                           log('Action Tiggred');
//                           ontap!();
//                         },
//                         height: 40.h,
//                         minWidth: 0,
//                         borderRadius: 50.r,
//                         color: AppColors.allPrimaryColor,
//                         textStyle: TextFontStyle.textStyle16Poppins.copyWith(
//                           color: Colors.white,
//                         ),
//                         context: context,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
