// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:x_app/app/components/controller.dart';
// import 'package:x_app/presentation/resources/color_manager.dart';
//
// class CustomDropDownMenu extends StatelessWidget {
//   const CustomDropDownMenu(
//       {Key? key,
//       required this.items,
//       this.onChanged,
//       this.controller,
//       required this.value,
//       this.id,
//       this.hint,
//       this.validator,
//       this.labelText})
//       : super(key: key);
//   final List items;
//   final int? id;
//   final dynamic value;
//   final String? labelText;
//   final ChangerController? controller;
//   final void Function(dynamic)? onChanged;
//   final String? hint;
//   final String? Function(dynamic value)? validator;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(
//             vertical:3.h,
//           ),
//           height: 56.h,
//           decoration: const BoxDecoration(
//             // border: Border.all(),
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
//           ),
//           child: DropdownButtonFormField(
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(3.sp)),
//                   borderSide: BorderSide(
//                       style: BorderStyle.solid, color: ColorManager.boxBorder)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(3.sp)),
//                   borderSide: BorderSide(
//                       style: BorderStyle.solid, color: ColorManager.boxBorder)),
//               errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(3.sp)),
//                   borderSide: BorderSide(
//                       style: BorderStyle.solid, color: ColorManager.boxBorder)),
//
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(3.sp)),
//                   borderSide: BorderSide(
//                       style: BorderStyle.solid, color: ColorManager.boxBorder)),
//               // border: Border.all(),
//             ),
//             validator: validator,
//             iconEnabledColor: Colors.black,
//             hint: Text(
//               hint ?? '',
//               style:  TextStyle(
//                 fontSize: 18,
//                 color: ColorManager.hintText,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//             borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
//             isExpanded: true,
//             // underline: Container(
//             //   height: 0,
//             // ),
//             iconSize: 25,
//             icon: Icon(
//               Icons.arrow_downward_outlined,
//               color: Colors.primaries[3].withOpacity(.35),
//             ),
//             items: items
//                 .map((item) => DropdownMenuItem<dynamic>(
//                       value: item,
//                       child: Text(
//                         item.toString(),
//                         style: const TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ))
//                 .toList(),
//             onChanged: onChanged,
//             value: value,
//           ),
//         ),
//       ],
//     );
//   }
// }
