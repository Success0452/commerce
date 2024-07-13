import 'package:commerce/models/product.dart';
import 'package:commerce/screens/favourite/controller/favourite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class ProductActionItem extends StatelessWidget {
  final VoidCallback? onTap;
  final bool? marked;
  final String? title;
  final double? width;
  final ProductModel? productModel;
  const ProductActionItem(
      {super.key,
      this.onTap,
      this.marked,
      this.title,
      this.width,
      this.productModel});

  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController = Get.put(FavouriteController());
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            text: title ?? 'View',
            width: width ?? 60,
            onTap: onTap,
            backgroundColor: Colors.blueGrey,
          ),
          GestureDetector(
            onTap: () => favouriteController.addFavorite(productModel!),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                marked!
                    ? Icons.favorite_outlined
                    : Icons.favorite_border_outlined,
                color: marked! ? Colors.red : Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
