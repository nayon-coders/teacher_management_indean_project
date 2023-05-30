// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
//
// import '../utility/colors.dart';
//
// class AppDropdown extends StatelessWidget {
//   final List stringList;
//   final String title;
//   final String selectedValue;
//   final VoidCallback? onChange;
//   const AppDropdown({Key? key, required this.stringList, required this.title, required this.selectedValue,  this.onChange}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 16
//           ),
//         ),
//         SizedBox(height: 10,),
//         Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(width: 1, color: Colors.grey.shade400)
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton2(
//               isExpanded: true,
//               hint: Text(
//                 '${stringList[0]}',
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: AppColors.black
//                 ),
//               ),
//               items: stringList
//                   .map((item) => DropdownMenuItem<String>(
//                 value: item,
//                 child: Text(
//                   item,
//                   style: const TextStyle(
//                     fontSize: 14,
//                   ),
//                 ),
//               ))
//                   .toList(),
//               value: selectedValue,
//               onChanged: onChange
//
//             ),
//           ),
//         ),
//       ],
//     );
//
//   }
// }
