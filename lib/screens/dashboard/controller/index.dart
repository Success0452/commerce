import 'dart:convert';

import 'package:commerce/services/server.dart';
import 'package:commerce/util/toast.dart';
import 'package:get/get.dart';

import '../../../models/product.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;
  var productList = <ProductModel>[].obs;
  var searchQuery = ''.obs;

  void getProducts() async {
    try {
      isLoading.value = true;
      var response = await getRequest('products');
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        productList.value =
            (json as List).map((e) => ProductModel.fromJson(e)).toList();
      }
      isLoading.value = false;
    } catch (e) {
      showCustomToast(message: 'server error, please try again');
      isLoading.value = false;
    }
  }

  List<ProductModel> get filteredItems {
    if (searchQuery.value.isEmpty) {
      return productList;
    } else {
      return productList
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
}
