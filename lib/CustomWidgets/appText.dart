import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  const AppText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontSize,
      this.textColor,
        this.decoration, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
        decoration: decoration,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: textColor,
      ),
    );
  }
}
