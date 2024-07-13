import 'package:cached_network_image/cached_network_image.dart';
import 'package:commerce/models/category.dart';
import 'package:commerce/screens/dashboard/widgets/label.dart';
import 'package:commerce/screens/detail/category.dart';
import 'package:commerce/widgets/action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/functions.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryModel? item;
  const CategoryListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: item!.image!),
            LabelItem(title: 'Category Name', description: item!.name!),
            LabelItem(
                title: 'Created At',
                description: formatDate(item!.creationAt!)),
            LabelItem(
                title: 'Updated At', description: formatDate(item!.updatedAt!)),
            ProductActionItem(
              onTap: () => Get.to(CategoryDetails(categoryModel: item!)),
              marked: false,
            )
          ],
        ),
      ),
    );
  }
}
