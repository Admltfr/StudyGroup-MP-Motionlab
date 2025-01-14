import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_shop/app/common/widgets/custom_button.dart';
import 'package:motion_shop/app/data/models/product_models.dart';
import 'package:motion_shop/app/data/utils/data_dummy.dart';
import 'package:motion_shop/app/modules/cart/controllers/cart_controller.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    //final String id = ModalRoute.of(context)!.settings.arguments as String;
    final String id = Get.arguments as String;

    final ProductModel product = DataDummy.listDummyProducts.firstWhere(
      (product) => product.id == id,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Product'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: product.isFavorite ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 12),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: const Color.fromARGB(255, 0, 154, 92),
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          text: 'Add to Cart',
          onTap: () {
            final cartController = Get.find<CartController>();
            cartController.incrementQuantity(product.id);
            Navigator.pushNamed(context, '/cart');
          },
        ),
      ),
    );
  }
}
