import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  final double? textHeight;
  final FontWeight? fontWeight;
 final TextAlign? textAlign;

  const AppText(
      {required this.text,
      this.fontSize,
        this.textAlign,
      this.textColor,
      this.textHeight,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(textAlign:textAlign,
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
            height: textHeight),
      ),
    );
  }
}
