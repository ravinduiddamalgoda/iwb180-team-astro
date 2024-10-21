import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}
