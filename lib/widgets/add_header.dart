import 'package:commerce/widgets/button.dart';
import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';

class AddHeader extends StatelessWidget {
  final String title;
  final String? label;
  final VoidCallback? onTap;
  const AddHeader({super.key, required this.title, this.onTap, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(fontSize: 16, text: title),
          CustomButton(
            onTap: onTap,
            text: label ?? 'Add +',
            width: 80,
            height: 30,
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
