import 'package:flutter/material.dart';

import '../../screens/index.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = "/login";
  static const String mobile = '/mobile';
  static const String register = "/register";
  static const String otppage = '/otppage';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      // case register:
      //   return MaterialPageRoute(builder: (_) => const RegisterPage());

      case mobile:
        return MaterialPageRoute(builder: (_) => const MobileAuthPage());
      case otppage:
        return MaterialPageRoute(builder: (_) => const OtpPage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Page Not Found')),
                ));
    }
  }
}
