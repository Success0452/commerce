import 'package:commerce/screens/category/controller/index.dart';
import 'package:commerce/screens/category/widgets/body.dart';
import 'package:commerce/screens/category/widgets/search.dart';
import 'package:commerce/widgets/add_header.dart';
import 'package:commerce/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbar.dart';
import '../../widgets/loader.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    categoryController.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(bottomSheet: true, children: [
      const CustomAppBar(title: 'Product Categories'),
      CategorySearch(categoryController: categoryController),
      AddHeader(title: 'Category', onTap: () {}),
      Obx(() => categoryController.isLoading.value
          ? const CustomLoader()
          : const CategoryBody()),
    ]);
  }
}
