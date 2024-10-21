import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hikeg/common_widgets/auth/auth_button.dart';
import 'package:hikeg/common_widgets/auth/auth_container.dart';
import 'package:hikeg/common_widgets/auth/auth_heading.dart';
import 'package:hikeg/common_widgets/auth/auth_input_field.dart';
import 'package:hikeg/common_widgets/pressable_text.dart';
import 'package:hikeg/constants/routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AuthHeading(
            title: 'Forgot Password',
            description: 'Recover your account',
          ),
          const SizedBox(height: 32.0),
          Column(
            children: [
              const Text(
                textAlign: TextAlign.center,
                'Please enter your email address to receive a verification code',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 16.0),
              AuthInputField(label: 'Email', controller: _emailController),
            ],
          ),
          Center(
              child: PressableText(
            text: 'Try another way',
            onTap: () {},
            inActiveColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.primary,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          )),
          AuthButton(
            text: 'Send',
            onPressed: () {
              GoRouter.of(context).push(Routes.verifyEmailScreen);
            },
          )
        ],
      ),
    );
  }
}
