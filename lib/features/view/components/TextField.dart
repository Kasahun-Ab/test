// // ignore_for_file: must_be_immutable

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TextFieldText extends StatefulWidget {
//   final String title;
//   final TextEditingController controller;
//   final IconData icon;
//   final bool isPassword; 
//   bool isVisible; 
//   TextInputType inputType;
//   final String? Function(String?) valrator; // Validation function

//   TextFieldText({
//     super.key,
//     required this.title,
//     required this.controller,
//     required this.icon,
//     this.isPassword = false, 
//     this.isVisible = false, 
//     required this.inputType,
//     required this.valrator   
//   });

//   @override
//   State<TextFieldText> createState() => _TextFieldTextState();
// }

// class _TextFieldTextState extends State<TextFieldText> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15),
//         ),

//         const SizedBox(height: 10),

//         Container( 
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(240, 248, 249, 253),
//             borderRadius: BorderRadius .circular(15),
//           ),
         
//           child:
//               ),
//       ],
//     );
//   }
// }
