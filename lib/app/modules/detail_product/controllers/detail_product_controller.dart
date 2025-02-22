import 'package:get/get.dart';
import 'package:study_group_flutter/app/data/models/product_model_api.dart';

import '../../../data/service/api_service.dart';

class DetailProductController extends GetxController {
  final id = Get.arguments['id'];
  var detailProduct = ProductElement().obs;
  var isLoading = true.obs;
  @override
  onInit() {
    fetchDetailProduct();
    super.onInit();
  }

  void fetchDetailProduct() async {
    detailProduct.value =
        await ApiService().getDetailsProducts(id: id) ?? ProductElement();
    isLoading.value = false;
  }
}
