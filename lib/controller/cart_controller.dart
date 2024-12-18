import 'package:get/get.dart';

class CartController extends GetxController {
  //gunakan getxcontroller
  final quantity = 0.obs;
  //obs digunakan untuk agar si value ini bisa berubah/observable

  void quantityIncrement() {
    quantity.value++;
  }

  //nambah kuantitas
  void quantityDecrement() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  //mengurangi kuantitas
}

//untuk getx simple gak boleh pake obx namun memakai
// GetBuilder( 
//  builder: (controller),
//  init : cartController
//  return scaffold)
// class CartController extends GetxController {
//   //gunakan getxcontroller
//   int quantity = 0;
//   //obs digunakan untuk agar si value ini bisa berubah/observable
//   void quantityIncrement() {
//     quantity++;
//     update();
//    }
//   //nambah kuantitas
//   void quantityDecrement() {
//     quantity--;
//     update();
//    }
//   //mengurangi kuantitas
// }
