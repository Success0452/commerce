import 'package:cached_network_image/cached_network_image.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/screens/dashboard/widgets/label.dart';
import 'package:commerce/screens/detail/product.dart';
import 'package:commerce/util/functions.dart';
import 'package:commerce/widgets/action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final ProductModel? item;
  final bool? isFav;
  const ProductItem({super.key, required this.item, this.isFav});

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
            CachedNetworkImage(imageUrl: filterString(item!.images![0])),
            LabelItem(title: 'Product Name', description: item!.title ?? ''),
            LabelItem(
                title: 'Product Description',
                description: item!.description ?? ''),
            LabelItem(
                title: 'Product Category',
                description: item!.category!.name ?? ''),
            LabelItem(title: 'Product Price', description: 'N${item!.price}'),
            ProductActionItem(
              onTap: () => Get.to(DetailsScreen(productModel: item!)),
              marked: isFav ?? false,
              productModel: item!,
            )
          ],
        ),
      ),
    );
  }
}
