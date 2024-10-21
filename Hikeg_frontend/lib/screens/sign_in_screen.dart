import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hikeg/common_widgets/auth/auth_button.dart';
import 'package:hikeg/common_widgets/auth/auth_container.dart';
import 'package:hikeg/common_widgets/auth/auth_divider.dart';
import 'package:hikeg/common_widgets/auth/auth_heading.dart';
import 'package:hikeg/common_widgets/pressable_text.dart';
import 'package:hikeg/common_widgets/auth/auth_input_field.dart';
import 'package:hikeg/common_widgets/auth/auth_provider_button.dart';
import 'package:hikeg/constants/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeading(
            title: 'Sign In',
            description: 'Sign in to your account',
          ),
          const SizedBox(height: 72.0),
          Column(
            children: [
              AuthInputField(
                label: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 32.0),
              AuthInputField(
                label: 'Password',
                controller: _passwordController,
              ),
              const SizedBox(height: 8.0),
              Container(
                alignment: Alignment.centerRight,
                child: PressableText(
                  text: 'Forget Password?',
                  inActiveColor: Colors.grey.shade800,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),
                  onTap: () {
                    GoRouter.of(context).push(Routes.forgotPasswordScreen);
                  },
                ),
              ),
              const SizedBox(height: 32.0),
              AuthButton(
                text: 'Sign In',
                onPressed: () {
                  GoRouter.of(context).replace(Routes.homeScreen);
                },
              ),
            ],
          ),
          const AuthDivider(),
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthProviderButton(imagePath: 'assets/pngs/google_logo.png'),
                  SizedBox(width: 32.0),
                  AuthProviderButton(
                    imagePath: 'assets/pngs/facebook_logo.png',
                  ),
                ],
              ),
              const SizedBox(height: 36.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  PressableText(
                    text: 'Sign Up',
                    onTap: () {
                      GoRouter.of(context).push(Routes.signUpScreen);
                    },
                    inActiveColor: Theme.of(context).colorScheme.primary,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
