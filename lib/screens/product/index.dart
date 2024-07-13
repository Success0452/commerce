import 'package:commerce/screens/product/controller/index.dart';
import 'package:commerce/screens/product/widgets/body.dart';
import 'package:commerce/screens/product/widgets/search.dart';
import 'package:commerce/widgets/add_header.dart';
import 'package:commerce/widgets/appbar.dart';
import 'package:commerce/widgets/loader.dart';
import 'package:commerce/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  final String categoryName;
  const ProductScreen({super.key, required this.categoryName});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    productController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomSheet: true,
      children: [
        const CustomAppBar(
          title: 'Products',
          enablePrev: true,
        ),
        ProductSearch(
          productController: productController,
          categoryName: widget.categoryName,
        ),
        AddHeader(title: 'Products', onTap: () {}),
        Obx(() => productController.isLoading.value
            ? const CustomLoader()
            : const ProductBody()),
      ],
    );
  }
}
