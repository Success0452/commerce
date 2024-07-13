import 'package:commerce/screens/category/controller/index.dart';
import 'package:commerce/screens/category/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return SizedBox(
        height: size.height / 1.46,
        child: ListView.builder(
            itemCount: categoryController.filteredItems.length,
            itemBuilder: (context, index) {
              final item = categoryController.filteredItems[index];
              return CategoryListItem(item: item);
            }),
      );
    });
  }
}
