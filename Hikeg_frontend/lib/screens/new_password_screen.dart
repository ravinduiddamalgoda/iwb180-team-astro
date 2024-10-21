import 'package:flutter/material.dart';
import 'package:hikeg/common_widgets/auth/auth_button.dart';
import 'package:hikeg/common_widgets/auth/auth_container.dart';
import 'package:hikeg/common_widgets/auth/auth_heading.dart';
import 'package:hikeg/common_widgets/auth/auth_input_field.dart';
import 'package:hikeg/common_widgets/pressable_text.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AuthHeading(
            title: 'Create new password',
            description: 'Recover your account',
          ),
          Column(
            children: [
              const SizedBox(height: 128.0),
              const Text(
                textAlign: TextAlign.center,
                'Enter your new password',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 32.0),
              AuthInputField(
                label: 'New Password',
                controller: _newPasswordController,
              ),
              const SizedBox(height: 16.0),
              AuthInputField(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
              ),
            ],
          ),
          Center(
            child: PressableText(text: 'Change Password',
              inActiveColor: Theme.of(context).colorScheme.secondary,
              activeColor: Theme.of(context).colorScheme.primary,
              style: const TextStyle(
                fontSize: 18.0,
              ),
              onTap: () {

              },
            ),
          ),
          AuthButton(
            text: 'Save',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
