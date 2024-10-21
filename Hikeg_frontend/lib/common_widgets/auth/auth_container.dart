import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 64.0,
      ),
      child: child,
    );
  }
}
