import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common_components//index.dart';
import '../../../cubit/index.dart';

class SignInWithApple extends StatelessWidget {
  const SignInWithApple({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, state) {
        return CustomButton(
          backgroundColor: Colors.black,
          ontap: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon(
                icon: "assets/SVG/appleIcon.svg",
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Continue with Appple",
                style: TextStyle(),
              ),
            ],
          ),
        );
      },
    );
  }
}
