import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubit/index.dart';
import '../../../common_components/index.dart';

class SigninWithGoogle extends StatelessWidget {
  const SigninWithGoogle({super.key, required this.ontap});
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, state) {
        return CustomButton(
          ontap: () => ontap,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon(icon: "assets/SVG/googleIcon.svg"),
              SizedBox(
                width: 10,
              ),
              Text(
                "Continue with Google",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }
}
