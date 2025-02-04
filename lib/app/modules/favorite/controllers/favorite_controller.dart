import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_group_flutter/app/data/models/product_model_api.dart';

class FavoriteController extends GetxController {
   RxList<ProductElement> favoriteProducts = <ProductElement>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void addFavorite(ProductElement product) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
      saveFavorites();
    }
  }

  void removeFavorite(ProductElement product) {
    favoriteProducts.remove(product);
    saveFavorites();
  }

  bool isFavorite(ProductElement product) {
    return favoriteProducts.any((p) => p.id == product.id);
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteJsonList =
        favoriteProducts.map((p) => jsonEncode(p.toJson())).toList();
    await prefs.setStringList('favorites', favoriteJsonList);
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJsonList = prefs.getStringList('favorites');

    if (favoriteJsonList != null) {
      favoriteProducts.assignAll(favoriteJsonList
          .map((json) => ProductElement.fromJson(jsonDecode(json)))
          .toList());
    }
  }
}
