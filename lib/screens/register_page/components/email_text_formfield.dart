import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubit/form_valid_state.dart';
import '../../../common_components/index.dart';
import '../../../cubit/form_valid_cubit.dart';

class EmailTextFormfield extends StatelessWidget {
  EmailTextFormfield({
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
          textAboveField: const Text("Email"),
          textController: emailcontroller,
          hintText: "Enter Email",
          validator: (val) {
            if (state is AuthFormValidError &&
                state.message.contains("Email")) {
              return state.message;
            }
            return null;
          },
          onchange: (val) => context
              .read<FormCubit>()
              .validateForm(emailcontroller.text, passwordcontroller.text),
          inputDecoration: InputDecoration(
              prefixIcon: const Icon(
                CupertinoIcons.mail,
                color: Color(0xffccd1da),
                size: 20,
              ),
              filled: true,
              fillColor: const Color(0xfff8f9fd),
              hintText: hintText),
          inputType: TextInputType.emailAddress,
        ),
      );
    });
  }
}
