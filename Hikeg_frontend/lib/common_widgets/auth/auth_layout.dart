import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svgs/sky.svg',
            width: MediaQuery.of(context).size.width,
          ),
          SvgPicture.asset(
            'assets/svgs/person.svg',
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(child: body),
        ],
      ),
    );
  }
}
