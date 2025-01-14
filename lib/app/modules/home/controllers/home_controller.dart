import 'package:get/get.dart';
import 'package:motion_shop/app/data/models/product_models.dart';
import 'package:motion_shop/app/data/utils/data_dummy.dart';

class HomeController extends GetxController {
  var selectedCategory = 'All'.obs;  // Reactive variable for selected category
  var filteredProducts = <ProductModel>[].obs;  // Reactive list of filtered products

  @override
  void onInit() {
    super.onInit();
    filteredProducts.value = DataDummy.listDummyProducts;  // Initialize with all products
  }

  void filterProducts(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      filteredProducts.value = DataDummy.listDummyProducts;
    } else {
      filteredProducts.value = DataDummy.listDummyProducts
          .where((product) => product.type == category)
          .toList();
    }
  }
}
