import 'package:commerce/screens/favourite/controller/favourite.dart';
import 'package:commerce/screens/product/controller/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/textfield.dart';

class FavouriteSearch extends StatefulWidget {
  final FavouriteController favouriteController;
  const FavouriteSearch({super.key, required this.favouriteController});

  @override
  State<FavouriteSearch> createState() => _FavouriteSearchState();
}

class _FavouriteSearchState extends State<FavouriteSearch> {
  var searchQuery = TextEditingController();
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    ever(productController.searchQuery, (query) {
      searchQuery.text = query;
    });
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomTextField(
        controller: searchQuery,
        hint: 'Search Favourite Products',
        prefixIcon: const Icon(Icons.search_outlined, color: Colors.black),
        onChanged: (String query) {
          widget.favouriteController.searchProduct(query);
        },
      ),
    );
  }
}
