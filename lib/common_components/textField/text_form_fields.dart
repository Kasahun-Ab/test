import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textController,
    this.onchange,
    this.obscureText,
    this.hintText,
    this.textAboveField,
    this.validator,
    this.inputDecoration,
    this.inputType,
  });

  final TextEditingController textController;
  final bool? obscureText;
  final Function(String? val)? onchange;
  final String? hintText;
  final Widget? textAboveField;
  final Function(String? val)? validator;
  final InputDecoration? inputDecoration;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textAboveField ?? const SizedBox(height: 10),
        TextFormField(
          keyboardType: inputType,
          controller: textController,
          onChanged: onchange,
          obscureText: obscureText ?? false,
          validator: (val) => validator!(val),
          decoration: inputDecoration,
        ),
      ],
    );
  }
}






// // ignore_for_file: must_be_immutable

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testapp/common_components/snackbar.dart';
// import 'package:testapp/cubit/password_visiblity_cubit.dart';
// import 'package:testapp/cubit/password_visiblity_state.dart';

// class CustomFormFiel extends StatelessWidget {
//   final TextEditingController textController;
//   final  bool? obscureText ;
//   final Function  (String val)? onchange;
//   final Widget? suffix ;
//   final String? hintText;
//   final Widget? TextAboveField;


  

 
//   TextFormFields(
//       {Key? key,
//       required this.textController,
//        this.onchange})
//       : super(key: key);

 

//   @override
//   Widget build(BuildContext context) {
  
//     return 
//            Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyLarge
//                     ?.copyWith(fontSize: 15),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: textController,
//                 onChanged: onchange, // Properly pass the callback here
//                 obscureText: isPassword && isNotVisible,
//                 validator: (val) => validate(val),
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: const Color(0Xfff8f9fd),
//                   hintText: "Enter $title",
//                   prefixIcon: Icon(size: 20, icon, color: Colors.black38),
//                   suffixIcon: isPassword
//                       ? IconButton(
//                           onPressed: () => context
//                               .read<PasswordVisiblityCubit>()
//                               .tooglePasswordVisiblity(),
//                           icon: Icon(
//                             isNotVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             size: 20,
//                             color: Colors.black38,
//                           ),
//                         )
//                       : null,
//                 ),
//               ),
//             ],
//           );
//         }));
//   }
// }
