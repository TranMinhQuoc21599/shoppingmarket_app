import 'package:flutter/material.dart';
import 'package:supermarket_app/screens/login_screen.dart';
import 'package:supermarket_app/screens/onboarding_screen.dart';
import 'package:supermarket_app/screens/create_account_screen.dart';
import 'package:supermarket_app/screens/verify_code_screen.dart';
import 'package:supermarket_app/screens/new_password_screen.dart';
import 'package:supermarket_app/screens/complete_profile_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/create-account':
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case '/verify-code':
        return MaterialPageRoute(builder: (_) => const VerifyCodeScreen());
      case '/new-password':
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());
      case '/complete-profile':
        return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
