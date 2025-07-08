
import 'package:flutter/widgets.dart';
import 'package:rumo/features/auth/create_account/create_account_screen.dart';

class AuthRoutes {
  static const String createAccountScreen = "/create-account";
  // mesma coisa que o onboarding_routes
  static final Map<String, Widget Function(BuildContext)> routes = {
    createAccountScreen: (context) => CreateAccountScreen(),
  };
}