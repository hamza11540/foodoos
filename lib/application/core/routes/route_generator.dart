

import 'package:flutter/material.dart';
import 'package:foodoos/application/core/routes/route_path.dart';
import 'package:foodoos/application/core/routes/routes.dart';
import 'package:foodoos/ui/views/otp_screen/otp_screen.dart';
import 'package:foodoos/ui/views/sign_in_screen/sign_in_screen.dart';
import 'package:foodoos/ui/views/sign_up_screen/sign_up_screen.dart';
import 'package:foodoos/ui/views/splash_screen/splash_screen.dart';
import 'package:foodoos/ui/views/welcome_screen/welcome_screen.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePath.initialRoute:
        return PageRouter.fadeScale(() => const SplashScreen());
      case RoutePath.welcomeScreen:
        return PageRouter.fadeScale(() => const WelcomeScreen());
      case RoutePath.signInScreen:
        return PageRouter.fadeScale(() => const SignInScreen());
      case RoutePath.signUpScreen:
        return PageRouter.fadeScale(() => const SignUpScreen());
      case RoutePath.otpScreen:
        return PageRouter.fadeScale(() => const OtpScreen());


      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: const Text('Page Not Found'),
          ),
        ),
      );
    });
  }
}
