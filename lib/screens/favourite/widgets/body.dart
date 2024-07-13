import 'package:commerce/screens/favourite/controller/favourite.dart';
import 'package:commerce/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  FavouriteController favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return SizedBox(
        height: size.height / 1.46,
        child: ListView.builder(
            itemCount: favouriteController.filteredItems.length,
            itemBuilder: (context, index) {
              final item = favouriteController.filteredItems[index];
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
