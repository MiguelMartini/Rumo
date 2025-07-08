import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rumo/core/asset_images.dart';
import 'package:rumo/features/auth/routes/auth_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context, AuthRoutes.createAccountScreen);
                  },
                  child: Text(
                    'Criar conta',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetImages.logo,
                width: 122,
                height: 44,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary,
                BlendMode.srcATop),
              ),
              SizedBox(height: 52),
              Image.asset(AssetImages.onboarding),
            ],
          ),
        ),
      ),
    );
  }
}
