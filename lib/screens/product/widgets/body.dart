import 'package:commerce/screens/favourite/controller/favourite.dart';
import 'package:commerce/screens/product/controller/index.dart';
import 'package:commerce/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key});

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  ProductController productController = Get.put(ProductController());
  FavouriteController favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return SizedBox(
        height: size.height / 1.46,
        child: ListView.builder(
            itemCount: productController.filteredItems.length,
            itemBuilder: (context, index) {
              final item = productController.filteredItems[index];
              bool isFavorite = favouriteController.favoriteList
                  .any((fav) => fav.id == item.id);
              return ProductItem(
                item: item,
                isFav: isFavorite,
              );
            }),
      );
    });
  }
}
