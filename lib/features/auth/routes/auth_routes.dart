
import 'package:flutter/widgets.dart';
import 'package:rumo/features/auth/create_account/create_account_screen.dart';
import 'package:rumo/features/auth/login_account/login_account_screen.dart';

class AuthRoutes {
  static const String createAccountScreen = "/create-account";
  static const String loginAccountSreen = "/login-account";
  // mesma coisa que o onboarding_routes
  static final Map<String, Widget Function(BuildContext)> routes = {
    createAccountScreen: (context) => const CreateAccountScreen(),
    loginAccountSreen: (context) => const LoginAccountScreen(),
  };
}