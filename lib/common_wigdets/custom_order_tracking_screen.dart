// import 'package:flutter/material.dart';
// import 'package:gabipoli_app/constants/app_assets/assets_icons.dart';
// import '../constants/text_font_style.dart';

// class CustomOrderTrackingScreen extends StatefulWidget {
//   const CustomOrderTrackingScreen({super.key});

//   @override
//   State<CustomOrderTrackingScreen> createState() => _CustomOrderTrackingScreenState();
// }
// class _CustomOrderTrackingScreenState extends State<CustomOrderTrackingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Text("Order Tracking"),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(height: 10),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.zero,
//                   child: Text(
//                     'Search your desire product',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Column(
//                   children: [
//                     SizedBox(height: 20),
//                     Text('Parcel Logs', style: TextFontStyle.textStyle10Urbanist400c000000.copyWith(),),
//                     SizedBox(height: 20),
//                     Row(children: [  Text('Order Status', style: TextFontStyle.textStyle10Urbanist400c000000.copyWith(),)],),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 14,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex:2,
//                                 child: Image.asset(AssetsIcons.toReceiveIcon, height: 45, width: 45),
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.pickUpRequest!.status?Colors.green:Colors.grey,
//                                           color: Colors.green,
//                                           width: 3,
//                                         ),
//                                         // CircleAvatar(radius: 11, backgroundColor:  controller.orderTrackerStatus!.pickUpRequest!.status?Colors.green:Colors.grey,
//                                         //   child: Icon(Icons.check, color:  controller.orderTrackerStatus!.pickUpRequest!.status?Colors.red:Colors.white,size: 17),
//                                         // ),
//                                         CircleAvatar(radius: 11, backgroundColor:  Colors.green,
//                                           child: Icon(Icons.check, color:  Colors.red,size: 17),
//                                         ),
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.picUpComplete!.status?Colors.green:Colors.grey,
//                                           color: Colors.green,
//                                           width: 3,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 flex: 7,
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Pickup Request', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 13),),
//                                       SizedBox(height: 8),
//                                       Text('Your order with delivery courier', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 12, color: Colors.grey[600]),)
//                                     ]),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text('10 April 2025', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),),
//                                 SizedBox(height: 5),
//                                 Text('9.00 am',style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),)
//                               ]),
//                         ),
//                       ],),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 14,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex:2,
//                                 child: Image.asset(AssetsIcons.completedOrdersIcon, height: 40, width: 40),
//                                 // child: Icon(Icons.add_box,size: 32)
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.picUpComplete!.status?Colors.green:Colors.grey,
//                                           color: Colors.green,
//                                           width: 3,
//                                         ),
//                                         // CircleAvatar(radius: 11, backgroundColor: controller.orderTrackerStatus!.picUpComplete!.status?Colors.green:Colors.grey,
//                                         //   child: Icon(Icons.check, color: controller.orderTrackerStatus!.picUpComplete!.status?Colors.red:Colors.white,size: 17),
//                                         // ),
//                                         CircleAvatar(radius: 11, backgroundColor: Colors.green,
//                                           child: Icon(Icons.check, color: Colors.red,size: 17),
//                                         ),
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.deliveryBranchReceive!.status?Colors.green:Colors.grey,
//                                           color: Colors.green,
//                                           width: 3,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 flex: 7,
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Pickup Complete', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 13),),
//                                       SizedBox(height: 8),
//                                       Text('your parcel pickup successfully', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 12, color: Colors.grey[600]),)
//                                     ]),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text('11 April 2025', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),),
//                                 SizedBox(height: 5),
//                                 Text('10.00 am',style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),)
//                               ]),
//                         ),
//                       ],),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 14,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex:2,
//                                 child: Image.asset(AssetsIcons.cancelledOrdersIcon, height: 40, width: 40),
//                                 // child: Icon(Icons.add_box,size: 32)
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.deliveryBranchReceive!.status?Colors.green:Colors.grey,
//                                           color: Colors.green,
//                                           width: 3,
//                                         ),
//                                         // CircleAvatar(radius: 11, backgroundColor: controller.orderTrackerStatus!.deliveryBranchReceive!.status?Colors.green:Colors.grey,
//                                         //   child: Icon(Icons.check, color: controller.orderTrackerStatus!.deliveryBranchReceive!.status?Colors.red:Colors.white,size: 17),
//                                         // ),
//                                         CircleAvatar(radius: 11, backgroundColor: Colors.green,
//                                           child: Icon(Icons.check, color: Colors.red,size: 17),
//                                         ),
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.onTheWayToDelivery!.status?Colors.green:Colors.grey,
//                                           color: Colors.green,
//                                           width: 3,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 flex: 7,
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Delivery Branch Received', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 13),),
//                                       SizedBox(height: 8),
//                                       Text('Delivery Branch: Dhanmondi', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 12, color: Colors.grey[600]),)
//                                     ]),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 // Text('${controller.orderTrackerStatus!.deliveryBranchReceive!.date}', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),),
//                                 Text('12 April 2025', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 11),),
//                                 SizedBox(height: 5),
//                                 Text('11.00 am',style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 11),)
//                               ]),
//                         ),
//                       ],),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 14,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex:2,
//                                 child: Image.asset(AssetsIcons.toReceiveIcon, height: 40, width: 40),
//                                 // child: Icon(Icons.add_box,size: 32)
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.onTheWayToDelivery!.status?Colors.green:Colors.grey,
//                                           color: Colors.grey,
//                                           width: 3,
//                                         ),
//                                         // CircleAvatar(radius: 11, backgroundColor: controller.orderTrackerStatus!.onTheWayToDelivery!.status?Colors.green:Colors.grey,
//                                         //   child: Icon(Icons.check, color: controller.orderTrackerStatus!.onTheWayToDelivery!.status?Colors.red:Colors.white,size: 17),
//                                         // ),
//                                         CircleAvatar(radius: 11, backgroundColor: Colors.grey,
//                                           child: Icon(Icons.check, color: Colors.red,size: 17),
//                                         ),
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.deliveryComplete!.status?Colors.green:Colors.grey,
//                                           color: Colors.grey,
//                                           width: 3,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 flex: 7,
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('On The Way To Delivery', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 13),),
//                                       SizedBox(height: 8),
//                                       Text('Description1', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 12, color: Colors.grey[600]),)
//                                     ]),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text('15 April 2025', style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 11),),
//                                 SizedBox(height: 5),
//                                 Text('1.00 Pm',style: TextFontStyle.textStyle16Urbanist400c000000.copyWith(fontSize: 11),)
//                               ]),
//                         ),
//                       ],),
//                     // controller.orderTrackerStatus!.cancelDelivery!.status?Container():Row(
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 14,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex:2,
//                                 child: Image.asset(AssetsIcons.info, height: 40, width: 40),
//                                 // child: Icon(Icons.add_box,size: 32)
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.deliveryComplete!.status?Colors.green:Colors.grey,
//                                           color: Colors.grey,
//                                           width: 3,
//                                         ),
//                                         // CircleAvatar(radius: 11, backgroundColor: controller.orderTrackerStatus!.deliveryComplete!.status?Colors.green:Colors.grey,
//                                         //   child: Icon(Icons.check, color: controller.orderTrackerStatus!.deliveryComplete!.status?Colors.red:Colors.white,size: 17),
//                                         // ),
//                                         CircleAvatar(radius: 11, backgroundColor: Colors.grey,
//                                           child: Icon(Icons.check, color: Colors.red,size: 17),
//                                         ),
//                                         Container(
//                                           height: 30,
//                                           color:  Colors.grey,
//                                           width: 3,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 flex: 7,
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Delivery Complete', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 13),),
//                                       SizedBox(height: 8),
//                                       // Text('${controller.orderTrackerStatus!.deliveryComplete!.description}', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 12, color: Colors.grey[600]),)
//                                       Text('deliveryComplete description', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 12, color: Colors.grey[600]),)
//                                     ]),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text('16 April 2025', style: TextFontStyle.textStytextStyle16Urbanist400c000000le16Poppins.copyWith(fontSize: 11),),
//                                 SizedBox(height: 5),
//                                 Text('2.00 PM',style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),)
//                               ]),
//                         ),
//                       ],),
//                     // controller.orderTrackerStatus!.cancelDelivery!.status?Row(
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 14,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex:2,
//                                 child: Image.asset(AssetsIcons.completedOrdersIcon, height: 40, width: 40),
//                                 // child: Icon(Icons.add_box,size: 32)
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 30,
//                                           // color: controller.orderTrackerStatus!.cancelDelivery!.status?Colors.green:Colors.grey,
//                                           color: Colors.grey,
//                                           width: 3,
//                                         ),
//                                         // CircleAvatar(radius: 11, backgroundColor: controller.orderTrackerStatus!.cancelDelivery!.status?Colors.green:Colors.grey,
//                                         //   child: Icon(Icons.check, color: controller.orderTrackerStatus!.cancelDelivery!.status?Colors.red:Colors.white,size: 17),
//                                         // ),
//                                         CircleAvatar(radius: 11, backgroundColor: Colors.grey,
//                                           child: Icon(Icons.check, color: Colors.red,size: 17),
//                                         ),
//                                         Container(
//                                           height: 30,
//                                           // color:  controller.orderTrackerStatus!.cancelDelivery!.status?Colors.green:Colors.grey,
//                                           color:  Colors.grey,
//                                           width: 3,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Expanded(
//                                 flex: 7,
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Delivery Cancel', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 13),),
//                                       SizedBox(height: 8),
//                                       Text('Delivery cancel', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 12, color: Colors.grey[600]),)
//                                     ]),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text('14 April 2025', style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),),
//                                 SizedBox(height: 5),
//                                 Text('12.00 pm',style: TextFontStyle.textStyle16Poppins.copyWith(fontSize: 11),)
//                               ]),
//                         ),
//                       ],),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
