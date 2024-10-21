import 'package:flutter/material.dart';

enum PressableTextVariant { primary, secondary }

class PressableText extends StatefulWidget {
  const PressableText({
    super.key,
    required this.text,
    required this.onTap,
    required this.inActiveColor,
    required this.activeColor,
    this.textAlign,
    this.style,
  });

  final String text;
  final void Function() onTap;
  final Color inActiveColor;
  final Color activeColor;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  State<PressableText> createState() => _PressableTextState();
}

class _PressableTextState extends State<PressableText> {
  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    _backgroundColor = widget.inActiveColor;
    super.initState();
  }

  void _handleOnTapDown(TapDownDetails details) {
    setState(() {
      _backgroundColor = widget.activeColor;
    });
  }

  void _handleOnTapUp(TapUpDetails details) {
    setState(() {
      _backgroundColor = widget.inActiveColor;
    });
  }

  void _handleOnTapCancel() {
    setState(() {
      _backgroundColor = widget.inActiveColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleOnTapDown,
      onTapUp: _handleOnTapUp,
      onTapCancel: _handleOnTapCancel,
      onTap: widget.onTap,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 20),
        style: widget.style?.copyWith(color: _backgroundColor) ??
            TextStyle(color: _backgroundColor),
        child: Text(
          widget.text,
          textAlign: widget.textAlign,
        ),
      ),
    );
  }
}
