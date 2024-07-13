import 'package:commerce/widgets/sizedbox.dart';
import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? radius;
  final bool? obscureText;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final ValueChanged<String>? onChanged;
  const CustomTextField(
      {super.key,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderColor,
      this.borderWidth,
      this.obscureText,
      this.textColor,
      this.letterSpacing,
      this.fontWeight,
      this.fontSize,
      this.suffixIcon,
      this.prefixIcon,
      this.controller,
      this.hint,
      this.label,
      this.onChanged,
      this.radius});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        label != null
            ? CustomText(fontSize: 14, text: label ?? '')
            : const SizedBox(),
        label != null
            ? const EmptySpace(
                h: 8,
              )
            : const SizedBox(),
        Container(
          width: width ?? size.width,
          height: height ?? 38,
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.transparent,
              border: Border.all(
                  color: borderColor ?? Colors.grey, width: borderWidth ?? 1),
              borderRadius: BorderRadius.circular(radius ?? 10.0)),
          child: Center(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText ?? false,
              onChanged: onChanged,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.w400,
                letterSpacing: letterSpacing,
              ),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  hintText: hint,
                  hintStyle: const TextStyle(fontSize: 16),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
