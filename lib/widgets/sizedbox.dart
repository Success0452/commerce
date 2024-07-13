import 'package:flutter/cupertino.dart';

class EmptySpace extends StatelessWidget {
  final double? w;
  final double? h;
  const EmptySpace({super.key, this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}
