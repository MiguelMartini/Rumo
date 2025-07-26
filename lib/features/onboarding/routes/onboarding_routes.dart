
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:rumo/features/home/screens/home_screen.dart';
import 'package:rumo/features/onboarding/onboarding_screen.dart';

class OnboardingRoutes {
  static const String onboardingScreen = "/";// armazena a rota da tela inicial
  
  // variavel de objeto e valor (map), onde passa um valor em string e depois uma função que retorna um widget (própria tela)
 static final Map<String, Widget Function(BuildContext)> routes = {
    onboardingScreen: (context) {
      final isLogged = FirebaseAuth.instance.currentUser != null;

      if (isLogged) {
        return const HomeScreen();
      }

      return const OnboardingScreen();
    },
  };
}