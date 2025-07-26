import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rumo/core/asset_images.dart';
import 'package:rumo/features/auth/repositories/auth_repository.dart';
import 'package:rumo/features/auth/widgets/forgot_password_dialog.dart';
import 'package:rumo/features/home/routes/home_routes.dart';

class LoginAccountScreen extends StatefulWidget {
  const LoginAccountScreen({super.key});

  @override
  State<LoginAccountScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool hidePassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AssetImages.logo,
                        width: 134,
                        height: 52,
                      ),
                      Text(
                        'Memórias na',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16.68,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'palma da mão.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.68,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AssetImages.loginAccountCharacter,
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 12),
                    child: IconButton.filled(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        iconSize: 32,
                      ),
                      color: Color(0xFF383838),
                      icon: Icon(Icons.chevron_left),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bem vindo (a) de volta!",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Preencha com os seus dados',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: Color(0xff1E1E1E),
                              fontWeight: FontWeight.w500,
                              height: 1.40,
                            ),
                          ),
                          SizedBox(height: 24),
                          Form(
                            key: _formKey,
                            child: Column(
                              spacing: 16,
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                  ),
                                  validator: (value) {
                                    final invalidEmailText =
                                        'Insira um e-mail válido';

                                    if (value == null || value.trim().isEmpty) {
                                      return invalidEmailText;
                                    }

                                    final email = value.trim();

                                    if (!email.contains('@') ||
                                        !email.contains('.')) {
                                      return invalidEmailText;
                                    }

                                    final parts = email.split('@');
                                    final firstPart = parts[0];

                                    if (firstPart.trim().isEmpty) {
                                      return invalidEmailText;
                                    }

                                    final lastPart = parts[1];

                                    if (lastPart.trim().isEmpty ||
                                        !lastPart.contains('.')) {
                                      return invalidEmailText;
                                    }

                                    if (lastPart.startsWith('.') ||
                                        lastPart.endsWith('.')) {
                                      return invalidEmailText;
                                    }

                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Senha',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      icon: Icon(
                                        hidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                  obscureText: hidePassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Senha incorreta';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 62),
                          SizedBox(
                            width: double.maxFinite,
                            child: FilledButton(
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      final isValid =
                                          _formKey.currentState?.validate() ??
                                          false;
                                      if (isValid) {
                                        try {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          final authRepository =
                                              AuthRepository();
                                          await authRepository.signInUser(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          );

                                          setState(() {
                                            isLoading = false;
                                          });

                                          if (!context.mounted) return;
                                          Navigator.of(
                                            context,
                                          ).popUntil((route) => route.isFirst);
                                          Navigator.pushReplacementNamed(
                                            context,
                                            HomeRoutes.homeScreen,
                                          );
                                        } on AuthException catch (error) {
                                          if (!context.mounted) return;

                                          setState(() {
                                            isLoading = false;
                                          });

                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Erro'),
                                                content: Text(
                                                  error.getMessage(),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    child: Text("OK"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                    },
                              child: Builder(
                                builder: (context) {
                                  if (isLoading) {
                                    return const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ForgotPasswordDialog();
                                    },
                                  );
                                },
                                child: const Text('Esqueci minha senha'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
