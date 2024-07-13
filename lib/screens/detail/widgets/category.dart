import 'package:cached_network_image/cached_network_image.dart';
import 'package:commerce/models/category.dart';
import 'package:commerce/screens/dashboard/widgets/label.dart';
import 'package:commerce/screens/product/index.dart';
import 'package:commerce/util/functions.dart';
import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/action.dart';

class CategoryDetailsItem extends StatelessWidget {
  final CategoryModel? item;
  const CategoryDetailsItem({super.key, required this.item});

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
            CachedNetworkImage(imageUrl: filterString(item!.image!)),
            LabelItem(title: 'Product Category', description: item!.name ?? ''),
            LabelItem(title: 'Product Category', description: item!.name ?? ''),
            CustomText(
                fontSize: 12,
                text: 'Created: ${formatDate(item!.creationAt!)}'),
            CustomText(
                fontSize: 12,
                text: 'Last Updated: ${formatDate(item!.updatedAt!)}'),
            ProductActionItem(
              title: 'See Products',
              width: 100,
              onTap: () => Get.to(ProductScreen(categoryName: item!.name!)),
            )
          ],
        ),
      ),
    );
  }
}
