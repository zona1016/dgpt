import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  const AnimatedText({Key? key, required this.text, required this.textStyle}) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  String _displayText = "";
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTextAnimation();
  }

  void _startTextAnimation() async {
    for (int i = 0; i <= widget.text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 50)); // 控制字符出现速度
      if (mounted) {
        setState(() {
          _displayText = widget.text.substring(0, i);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayText,
      style: widget.textStyle,
    );
  }
}
