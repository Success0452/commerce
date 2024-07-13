import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  const CustomText(
      {super.key,
      required this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.letterSpacing,
      this.color,
      this.maxLines,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? Colors.black,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
