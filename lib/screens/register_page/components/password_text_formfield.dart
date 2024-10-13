import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubit/index.dart';
import '../../../common_components/index.dart';
import '../../../cubit/form_valid_cubit.dart';

// ignore: must_be_immutable
class PasswordTextFormfield extends StatelessWidget {
  PasswordTextFormfield({
    super.key,
    required this.emailcontroller,
    required this.passwordcontroller,
    required this.hintText,
  });
  final String hintText;
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, AuthFormValid>(
        builder: (BuildContext context, AuthFormValid state) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            textAboveField: const Text("Password"),
            textController: passwordcontroller,
            hintText: "Enter Password",
            validator: (val) {
              if (state is AuthFormValidError &&
                  state.message.contains("Password")) {
                return state.message; 
              }
              return null;
            },
            onchange: (val) => context
                .read<FormCubit>()
                .validateForm(emailcontroller.text, passwordcontroller.text),
            inputDecoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: Color(0xffcbcfd7),
                    )),
                prefixIcon: const Icon(
                  CupertinoIcons.lock,
                  color: Color(0xffccd1da),
                  size: 20,
                ),
                filled: true,
                fillColor: const Color(0xfff8f9fd),
                hintText: hintText),
            inputType: TextInputType.text,
          ));
    });
  }
}
