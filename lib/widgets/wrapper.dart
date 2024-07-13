import 'package:commerce/widgets/bottomsheet.dart';
import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  final List<Widget> children;
  final Color? backgroundColor;
  final bool? bottomSheet;
  const ScreenWrapper(
      {super.key,
      required this.children,
      this.backgroundColor,
      this.bottomSheet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor ?? Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
      bottomSheet:
          bottomSheet != null ? const CustomBottomSheet() : const SizedBox(),
    );
  }
}
