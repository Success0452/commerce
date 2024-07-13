import 'package:commerce/screens/favourite/controller/favourite.dart';
import 'package:commerce/screens/favourite/widgets/body.dart';
import 'package:commerce/screens/favourite/widgets/search.dart';
import 'package:commerce/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbar.dart';
import '../../widgets/loader.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  FavouriteController favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(bottomSheet: true, children: [
      const CustomAppBar(
        title: 'Favourite',
        enablePrev: true,
      ),
      FavouriteSearch(favouriteController: favouriteController),
      Obx(() => favouriteController.isLoading.value
          ? const CustomLoader()
          : const FavouriteBody()),
    ]);
  }
}
