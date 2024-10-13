// Importing necessary Flutter packages and other project dependencies
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/cubit/form_valid_state.dart';
import 'package:testapp/screens/login_page/components/email_text_formfield.dart';
import 'package:testapp/screens/login_page/index.dart';

import '../../common_components/snackBar/snackbar.dart';
import '../../common_components/index.dart';
import '../../cubit/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  void loginWithGoogle() {
    context.read<AuthCubit>().signinWithGoogle();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is AuthFailuers) {
              showSnackbar(context, state.messages);
            }
          },
          builder: (context, state) {
            if (state is FormValid) {}

            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFf1b202)),
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderComponent(),
                  SizedBox(height: 20.h),
                  EmailTextFormfield(
                    hintText: 'Enter Email',
                    emailcontroller: _emailController,
                    passwordcontroller: _passwordController,
                  ),
                  SizedBox(height: 15.h),
                  PasswordTextFormfield(
                    emailcontroller: _emailController,
                    passwordcontroller: _passwordController,
                    hintText: 'Enter Password',
                  ),
                  SizedBox(height: 15.h),
                  const RememberwithForgotPassword(),
                  SizedBox(height: 15.h),
                  SigninButton(
                    fromkey: _formKey,
                    title: 'Sign In',
                    ontap: login,
                  ),
                  SizedBox(height: 15.h),
                  const DividerWitText(),
                  SizedBox(height: 10.h),
                  const SigninWithGoogle(),
                  SizedBox(height: 20.h),
                  const SignInWithApple(),
                  const SizedBox(
                    height: 10,
                  ),
                  const DontHaveAnaccountButton()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class RememberwithForgotPassword extends StatelessWidget {
  const RememberwithForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                activeColor: const Color(0xFFf1b202),
                value: true,
                onChanged: (val) {},
              ),
              Text("Remember Me",
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Text(
            "Forgot Password?",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: const Color(0xFFf1b202)),
          ),
        ],
      ),
    );
  }
}
