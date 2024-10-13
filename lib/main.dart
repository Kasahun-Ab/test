// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/config/routing/routes.dart';
// import 'package:testapp/repositories/phone_auth_repostories.dart';

import 'config/theme/appTheme.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/index.dart';
import 'repositories/auth_repostories.dart';
import 'screens/home_page/home_page.dart';
import 'screens/login_page/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthCubit(AuthRepositoty()),
              child: const LoginPage(),
            ),
            // BlocProvider(
            //   create: (_) => AuthCubit(AuthRepositoty()),
            //   child: const RegisterPage(),
            // ),
            BlocProvider(
              create: (_) => AuthCubit(AuthRepositoty()),
              child: const HomePage(),
            ),

            BlocProvider(
              create: (_) => FormCubit(),
            ),
            // BlocProvider(
            //   create: (_) => PhoneAuthCubit(FirebasePhoneAuthRepository()),
            //   child: const MobileAuthPage(),
            // ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: customTheme(),
            initialRoute: '/',
            onGenerateRoute: AppRoutes.generateRoute,
            home: const SplashScreen(),
          ),
        );
      }));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    if (_auth.currentUser != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } 
    
    
    else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3072fd),
      body: Center(
        child: SvgPicture.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            'assets/SVG/logo.svg'),
      ),
    );
  }
}
