// Importing necessary Flutter packages and other project dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_components/index.dart';
import '../../common_components/snackBar/snackbar.dart';
import '../../cubit/index.dart';
import './components/index.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().register(
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  void signWithGoogle() {
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
                  SignupButton(
                    fromkey: _formKey,
                    title: 'Sign In',
                    ontap: () => register,
                  ),
                  SizedBox(height: 15.h),
                  const DividerWitText(),
                  SizedBox(height: 10.h),
                  SigninWithGoogle(
                    ontap: () => signWithGoogle,
                  ),
                  SizedBox(height: 20.h),
                  const SignInWithApple(),
                  const SizedBox(
                    height: 10,
                  ),
                  const AlreadyHaveanAccount()
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
            "Sign in with Mobile",
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
