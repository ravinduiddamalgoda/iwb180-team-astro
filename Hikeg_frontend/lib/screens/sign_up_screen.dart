import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hikeg/common_widgets/auth/auth_button.dart';
import 'package:hikeg/common_widgets/auth/auth_container.dart';
import 'package:hikeg/common_widgets/auth/auth_divider.dart';
import 'package:hikeg/common_widgets/auth/auth_heading.dart';
import 'package:hikeg/common_widgets/auth/auth_input_field.dart';
import 'package:hikeg/common_widgets/auth/auth_provider_button.dart';
import 'package:hikeg/common_widgets/pressable_text.dart';
import 'package:hikeg/constants/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
            title: 'Sign Up',
            description: 'Sign up to your account',
          ),
          const SizedBox(height: 60.0),
          AuthInputField(label: 'Username', controller: _usernameController),
          AuthInputField(label: 'Email', controller: _emailController),
          AuthInputField(label: 'Password', controller: _passwordController),
          const SizedBox(height: 18.0),
          AuthButton(
            text: 'Sign Up',
            onPressed: () {
              GoRouter.of(context).replace(Routes.homeScreen);
            },
          ),
          const AuthDivider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthProviderButton(imagePath: 'assets/pngs/google_logo.png'),
              SizedBox(width: 32.0),
              AuthProviderButton(imagePath: 'assets/pngs/facebook_logo.png')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(width: 8.0),
              PressableText(
                text: 'Sign In',
                onTap: () {
                  GoRouter.of(context).pop();
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
    );
  }
}
