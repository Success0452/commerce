import 'package:flutter/material.dart';

import '../../../widgets/text.dart';

class LabelItem extends StatelessWidget {
  final String title;
  final String description;
  final bool? enable;
  const LabelItem(
      {super.key, required this.title, required this.description, this.enable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            text: title,
            color: Colors.black,
          ),
          CustomText(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            text: description,
            color: Colors.black,
            textAlign: TextAlign.start,
            maxLines: enable != null ? 1 : 4,
          ),
        ],
      ),
    );
  }
}
