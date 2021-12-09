
import 'package:flutter/material.dart';

class  AppText extends StatelessWidget {
  final int size;
  final String text;
  final Color color;

  AppText({Key? key, this.size=16, required this.text, this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: color, fontSize: size.toDouble(), fontWeight: FontWeight.bold);
    return Text(text, style: textStyle,);
  }
}