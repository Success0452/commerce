import 'package:commerce/screens/category/index.dart';
import 'package:commerce/screens/dashboard/index.dart';
import 'package:commerce/screens/favourite/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.blue,
          border: Border(top: BorderSide(color: Colors.white, width: 1)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 18.0, right: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.off(const DashboardScreen());
              },
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.off(const CategoryScreen());
              },
              child: const Icon(
                Icons.category_rounded,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => Get.off(const FavouriteScreen()),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
