import 'package:commerce/models/category.dart';
import 'package:commerce/screens/detail/widgets/category.dart';
import 'package:flutter/material.dart';

import '../../widgets/add_header.dart';
import '../../widgets/appbar.dart';
import '../../widgets/wrapper.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryDetails({super.key, required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(children: [
      const CustomAppBar(title: 'Category Details', enablePrev: true),
      AddHeader(title: 'Details', label: 'Update', onTap: () {}),
      CategoryDetailsItem(
        item: widget.categoryModel,
      )
    ]);
  }
}
