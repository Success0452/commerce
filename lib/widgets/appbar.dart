import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? backButton;
  final Widget? suffixWidget;
  final bool? enablePrev;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.backButton,
      this.suffixWidget,
      this.enablePrev});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        enablePrev != null
            ? GestureDetector(
                onTap: () => Get.back(),
                child:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black))
            : const SizedBox(),
        CustomText(
          fontSize: 18,
          text: title,
          color: Colors.blueGrey,
        ),
        suffixWidget != null
            ? suffixWidget!
            : const SizedBox(
                width: 20,
              )
      ],
    );
  }
}
