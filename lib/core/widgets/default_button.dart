// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:x_app/presentation/resources/color_manager.dart';
// import 'package:x_app/presentation/resources/font_manager.dart';
//
// class CustomButton extends StatelessWidget {
//   CustomButton({
//     this.width,
//     this.height,
//     this.imgPath,
//      this.onTap,
//     this.borderRadius,
//     this.buttonColor = Colors.green,
//     this.textColor = Colors.white,
//     this.borderColor,
//     required this.buttonText,
//     this.icon,
//     Key? key,
//   }) : super(key: key);
//
//   VoidCallback? onTap;
//
//   Color? buttonColor;
//
//   double? borderRadius;
//
//   Color? textColor;
//
//   String? buttonText;
//
//   Color? borderColor;
//   final Widget? icon;
//
//   String? imgPath;
//   double? width;
//   double? height;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height??45.h,
// width: MediaQuery.of(context).size.width,
// margin: EdgeInsets.symmetric(horizontal: 10.w),
//       decoration: BoxDecoration(
//           // color: buttonColor ?? Colors.white,
//           border: Border.all(color: borderColor ?? buttonColor??Colors.transparent),
//           borderRadius: BorderRadius.all(Radius.circular(10.sp))),
//       child:
//       // icon != null ?
//       // ElevatedButton.icon(
//       //
//       //   style: ButtonStyle(
//       //     padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 13.h,horizontal: 40.w)) ,
//       //     visualDensity: VisualDensity.comfortable,
//       //       backgroundColor:  MaterialStatePropertyAll(buttonColor??Colors.green),
//       //       shape: MaterialStatePropertyAll(
//       //         RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.all(Radius.circular(10.sp)),
//       //           side: BorderSide(width: 0, color:buttonColor??Colors.black54,),
//       //         ),
//       //       )),
//       //   onPressed: onTap,
//       //   icon: SizedBox( width :10,child: icon!,),
//       //   label: Text(buttonText!),
//       //   // child: Center(
//       //   //     child: Row(
//       //   //   mainAxisAlignment: MainAxisAlignment.center,
//       //   //   children: [
//       //   //     imgPath != null
//       //   //         ? Padding(
//       //   //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       //   //             child: Image.asset(
//       //   //               imgPath!,
//       //   //               height: height,
//       //   //               width: width,
//       //   //             ),
//       //   //           )
//       //   //         : const Text(''),
//       //   //     Text(
//       //   //       buttonText??'',
//       //   //       style: TextStyle(
//       //   //           color: textColor, fontSize: 15.sp, fontWeight: FontWeight.bold,fontFamily: FontConstants.fontFamily),
//       //   //     ),
//       //   //   ],
//       //   // )),
//       // ):
//       ElevatedButton(
//         style: ButtonStyle(
//             padding: MaterialStatePropertyAll(
//                 EdgeInsets.symmetric(vertical: 13.h,horizontal: 40.w)) ,
//             visualDensity: VisualDensity.comfortable,
//             backgroundColor:  MaterialStatePropertyAll(buttonColor??Colors.green),
//             shape: MaterialStatePropertyAll(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10.sp)),
//                 side: BorderSide(width: 0, color:buttonColor??Colors.black54,),
//               ),
//             )),
//         onPressed: onTap,
//         child:Text(buttonText!) ,
//
//         // child: Center(
//         //     child: Row(
//         //       mainAxisAlignment: MainAxisAlignment.center,
//         //       children: [
//         //         imgPath != null
//         //             ? Padding(
//         //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         //           child: Image.asset(
//         //             imgPath!,
//         //             height: height,
//         //             width: width,
//         //           ),
//         //         )
//         //             : const Text(''),
//         //         Text(
//         //           buttonText??'',
//         //           style: TextStyle(
//         //               color: textColor, fontSize: 15.sp, fontWeight: FontWeight.bold,fontFamily: FontConstants.fontFamily),
//         //         ),
//         //       ],
//         //     )),
//       ),
//     );
//   }
// }
