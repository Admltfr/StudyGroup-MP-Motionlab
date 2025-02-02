import 'package:get/get.dart';
import 'package:study_group_flutter/app/data/service/product_service.dart';
import '../../../data/models/product_model_api.dart';

class HomeController extends GetxController {
  //Variable model
  Rx<Product> product = Product().obs;
  List<String> categoryList = [];
  RxList<ProductElement> onCategoryProducts = <ProductElement>[].obs;
  //Variabel non-model
  ProductService productService = ProductService();
  RxBool isLoading = true.obs;
  String selectedCategory = "All";
  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    fetchCategory();
    filterProductsByCategory(selectedCategory);
  }

  Future<void> fetchProduct() async {
    try {
      product.value = await productService.getProducts() ?? product();
      onCategoryProducts.assignAll(product.value.products ?? []);
      filterProductsByCategory(selectedCategory);
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<String>> fetchCategory() async {
    try {
      List<String> fetchedCategory = await productService.getCategory();
      return categoryList = ["All", ...fetchedCategory];
    } finally {
      isLoading.value = false;
    }
  }

  void filterProductsByCategory(String inCategory) {
    selectedCategory = inCategory;
    update();
    // print("Selected Category: $inCategory");
    if (inCategory == "All") {
      // onCategoryProducts = product.value.products;
      onCategoryProducts.assignAll(product.value.products ?? []);
    } else {
      // onCategoryProducts = product.value.products
      //     ?.where((product) => product.category.toString() == inCategory)
      //     .toList();
      // update();
      onCategoryProducts.assignAll(product.value.products?.where((product) {
            // print(
            //     "Checking Product: '${product.title}' -> Category: '${product.category.toString().toLowerCase()}'");
            return product.category?.toString().toLowerCase() ==
                "category.$inCategory";
          }).toList() ??
          []);
    }
  }
}
