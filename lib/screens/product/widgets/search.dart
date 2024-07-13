import 'package:commerce/screens/product/controller/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/textfield.dart';

class ProductSearch extends StatefulWidget {
  final ProductController productController;
  final String categoryName;
  const ProductSearch(
      {super.key, required this.productController, required this.categoryName});

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  var searchQuery = TextEditingController();
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    productController.searchQuery.value = widget.categoryName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ever(productController.searchQuery, (query) {
      searchQuery.text = query;
    });
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomTextField(
        controller: searchQuery,
        hint: 'Search Products',
        prefixIcon: const Icon(Icons.search_outlined, color: Colors.black),
        onChanged: (String query) {
          widget.productController.searchProduct(query);
        },
      ),
    );
  }
}
