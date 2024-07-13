import 'package:cached_network_image/cached_network_image.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/screens/dashboard/widgets/label.dart';
import 'package:commerce/util/functions.dart';
import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final ProductModel? item;
  const DetailsItem({super.key, required this.item});

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
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomText(fontSize: 18, text: 'Product Section'),
            ),
            CachedNetworkImage(imageUrl: filterString(item!.images![0])),
            LabelItem(title: 'Product Name', description: item!.title ?? ''),
            LabelItem(
                title: 'Product Description',
                enable: true,
                description: item!.description ?? ''),
            LabelItem(title: 'Product Price', description: 'N${item!.price}'),
            CustomText(
                fontSize: 12,
                text: 'Created: ${formatDate(item!.creationAt!)}'),
            CustomText(
                fontSize: 12,
                text: 'Last Updated: ${formatDate(item!.updatedAt!)}'),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 10),
              child: CustomText(fontSize: 18, text: 'Category Section'),
            ),
            CachedNetworkImage(imageUrl: filterString(item!.category!.image!)),
            LabelItem(
                title: 'Product Category',
                description: item!.category!.name ?? ''),
            LabelItem(
                title: 'Product Category',
                description: item!.category!.name ?? ''),
            CustomText(
                fontSize: 12,
                text: 'Created: ${formatDate(item!.category!.creationAt!)}'),
            CustomText(
                fontSize: 12,
                text: 'Last Updated: ${formatDate(item!.category!.updatedAt!)}')
          ],
        ),
      ),
    );
  }
}
