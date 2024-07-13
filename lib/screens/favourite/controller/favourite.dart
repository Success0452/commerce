import 'package:commerce/util/toast.dart';
import 'package:get/get.dart';

import '../../../models/product.dart';
import '../../../services/product_sqflite.dart';

class FavouriteController extends GetxController {
  var favoriteList = <ProductModel>[].obs;
  var isLoading = false.obs;
  var searchQuery = ''.obs;

  List<ProductModel> get filteredItems {
    if (searchQuery.value.isEmpty) {
      return favoriteList;
    } else {
      return favoriteList
          .where((item) =>
              item.category!.name!
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              item.title!
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void searchProduct(String query) {
    searchQuery.value = query;
  }

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    favoriteList.value = await DatabaseHelper.instance.getFavorites();
  }

  void addFavorite(ProductModel product) async {
    await DatabaseHelper.instance.addFavorite(product);
    favoriteList.add(product);
    showCustomToast(message: '${product.title} added to favourite');
  }

  void removeFavorite(int id) async {
    await DatabaseHelper.instance.removeFavorite(id);
    favoriteList.removeWhere((product) => product.id == id);
  }
}
