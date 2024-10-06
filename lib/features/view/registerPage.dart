import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testapp/features/cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../repostories/validation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      context
          .read<AuthCubit>()
          .validateForm(_emailController.text, _passwordController.text);
    });

    _passwordController.addListener(() {
      context
          .read<AuthCubit>()
          .validateForm(_emailController.text, _passwordController.text);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
          } else if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthFailuers) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.messages)),
            );
          }
        },
        builder: (BuildContext context, AuthState state) {
          bool isButtonEnabled = false;
          if (state is AuthFormValid) {
            isButtonEnabled = state.isButtonEnabled;
          }

          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFf1b202),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Opacity(
                      opacity: 0.1,
                      child: Image(
                        filterQuality: FilterQuality.high,
                        height: 240.h,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        image: const AssetImage("assets/images/worldMap.png"),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: CircleAvatar(
                          radius: 40.sp,
                          backgroundColor: const Color(0xFFf1b202),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Welcome to Register page",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(fontSize: 20.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Empower yourself. Sign in and take control of your digital journey",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 15.sp),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          obscureText: false,
                          validator: (val) => validateEmail(val),
                          decoration: const InputDecoration(
                            hintText: "Enter Email",
                            prefixIcon: Icon(
                              size: 20,
                              CupertinoIcons.mail,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "password",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _passwordController,
                          obscureText: isVisible,
                          validator: (val) => validatePassword(val),
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              prefixIcon: const Icon(
                                size: 20,
                                CupertinoIcons.lock,
                                color: Colors.black38,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black38,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: const Color(0xFFf1b202),
                              value: true,
                              onChanged: (val) {}),
                          Text(
                            "Remember Me",
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/mobile'),
                        child: Text(
                          "Sign in with Mobile",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: const Color(0xFFf1b202)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () => {
                                if (_formKey.currentState!.validate())
                                  {
                                    context.read<AuthCubit>().register(
                                        _emailController.text,
                                        _passwordController.text)
                                  }
                              }
                          : null,
                      child: Text(
                        "Sign up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150.w,
                      height: 1.h,
                      color: Colors.black12,
                    ),
                    Text(
                      "or",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(fontSize: 15.sp),
                    ),
                    Container(
                      width: 150.w,
                      height: 1.h,
                      color: Colors.black12,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          context.read<AuthCubit>().signinWithGoogle(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/SVG/googleIcon.svg",
                            width: 50.w,
                            height: 50.h,
                          ),
                          Text(
                            "Continue With Google",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/SVG/appleIcon.svg",
                            width: 50.w,
                            height: 50.h,
                            color: Colors.white,
                          ),
                          Text(
                            "Continue With Apple",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 15.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Sign In',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: const Color(0xFFf1b202)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
