import 'package:commerce/screens/category/controller/index.dart';
import 'package:flutter/material.dart';

import '../../../widgets/textfield.dart';

class CategorySearch extends StatelessWidget {
  final CategoryController categoryController;
  const CategorySearch({super.key, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomTextField(
        hint: 'Search Categories',
        prefixIcon: const Icon(Icons.search_outlined, color: Colors.black),
        onChanged: (String query) {
          categoryController.searchProduct(query);
        },
      ),
    );
  }
}
