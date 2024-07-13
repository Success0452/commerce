import 'dart:convert';

import 'package:commerce/models/category.dart';
import 'package:get/get.dart';

import '../../../services/server.dart';
import '../../../util/toast.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  var categoryList = <CategoryModel>[].obs;

  void getCategories() async {
    try {
      isLoading.value = true;
      var response = await getRequest('categories');
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        categoryList.value =
            (json as List).map((e) => CategoryModel.fromJson(e)).toList();
      }
      isLoading.value = false;
    } catch (e) {
      showCustomToast(message: 'server error, please try again');
      isLoading.value = false;
    }
  }

  List<CategoryModel> get filteredItems {
    if (searchQuery.value.isEmpty) {
      return categoryList;
    } else {
      return categoryList
          .where((item) => item.name!
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  var searchQuery = ''.obs;
  void searchProduct(String query) {
    searchQuery.value = query;
  }
}
