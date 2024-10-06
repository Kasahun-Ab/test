import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/features/cubit/auth_cubit.dart';
import 'package:testapp/features/cubit/phoneauth_cubit.dart';
import 'package:testapp/features/repostories/auth_repostories.dart';
import 'package:testapp/features/repostories/phoneauth_repostories.dart';
import 'package:testapp/features/view/homePage.dart';
import 'package:testapp/features/view/loginPage.dart';
import 'package:testapp/features/view/mobileauthpage.dart';
import 'package:testapp/features/view/otpPage.dart';
import 'package:testapp/features/view/registerPage.dart';

import 'app/appTheme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: customTheme(),
          initialRoute: '/', 
          routes: {
            '/login': (context) => BlocProvider(
                  create: (_) => AuthCubit(AuthRepositoty()),
                  child: const LoginPage(),
                ),
            '/register': (context) => BlocProvider(
                  create: (_) => AuthCubit(AuthRepositoty()),
                  child: const RegisterPage(),
                ),
            '/home': (context) => BlocProvider(
                  create: (_) => AuthCubit(AuthRepositoty()),
                  child: HomePage(),
                ),
            '/mobile': (context) => BlocProvider(
                  create: (_) => PhoneAuthCubit(FirebasePhoneAuthRepository()),
                  child: const MobileAuthPage(),
                ),
            '/otppage': (context) => const OtpPage()
          },

          home: SplashScreen(),
        );
      }));
}


// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
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
