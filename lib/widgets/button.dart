import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? radius;
  final VoidCallback? onTap;
  final String? text;
  final Color? color;
  const CustomButton(
      {super.key,
      this.radius,
      this.borderWidth,
      this.borderColor,
      this.backgroundColor,
      this.height,
      this.onTap,
      this.text,
      this.color,
      this.width});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 38,
        width: width ?? size.width,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(radius ?? 10),
            border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1)),
        child: Center(
            child: CustomText(
          fontSize: 14,
          text: text!,
          color: color ?? Colors.white,
        )),
      ),
    );
  }
}
