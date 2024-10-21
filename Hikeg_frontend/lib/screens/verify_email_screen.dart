import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hikeg/common_widgets/auth/auth_button.dart';
import 'package:hikeg/common_widgets/auth/auth_container.dart';
import 'package:hikeg/common_widgets/auth/auth_heading.dart';
import 'package:hikeg/common_widgets/pressable_text.dart';
import 'package:hikeg/constants/routes.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AuthHeading(
            title: 'Verify Email',
            description: 'Recover your account',
          ),
          const SizedBox(height: 32.0),
          const Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                'Please enter 4 digits code sent to your email',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DigitInputBox(),
                    DigitInputBox(),
                    DigitInputBox(),
                    DigitInputBox(),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: PressableText(
              text: 'Resend Code',
              onTap: () {},
              inActiveColor: Theme.of(context).colorScheme.secondary,
              activeColor: Theme.of(context).colorScheme.primary,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          AuthButton(
            text: 'Verify',
            onPressed: () {
              GoRouter.of(context).push(Routes.createNewPasswordScreen);
            },
          )
        ],
      ),
    );
  }
}

class DigitInputBox extends StatelessWidget {
  const DigitInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      width: 56.0,
      height: 56.0,
      child: const TextField(
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
