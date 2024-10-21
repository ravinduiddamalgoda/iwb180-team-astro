import 'package:flutter/material.dart';

class AuthProviderButton extends StatelessWidget {
  const AuthProviderButton({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            imagePath,
            width: 30.0,
          ),
        ),
      ),
    );
  }
}
