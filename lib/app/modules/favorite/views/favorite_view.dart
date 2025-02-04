import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:study_group_flutter/app/data/models/product_model_api.dart';

import 'package:study_group_flutter/app/routes/app_pages.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (_) {
        return Obx(() => Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.menu_rounded),
                            ),
                            Image.asset(
                              'assets/icons/ic_logo.png',
                              height: kToolbarHeight - 16.h,
                              fit: BoxFit.contain,
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.CART);
                              },
                              icon: const Icon(
                                Icons.shopping_bag_outlined,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.favoriteProducts.length,
                            itemBuilder: (context, index) {
                              final ProductElement product =
                                  controller.favoriteProducts[index];
                              return ListTile(
                                leading: Image.network(
                                  product.thumbnail ?? "",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  product.title ?? "No Title",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: const Color(0xFF00623B),
                                      ),
                                ),
                                subtitle: Text("\$${product.price}"),
                                trailing: IconButton(
                                  icon: const Icon(Icons.favorite,
                                      color: Colors.red),
                                  onPressed: () {
                                    controller.removeFavorite(product);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}

// ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: controller.favoriteProducts.length,
//               itemBuilder: (context, index) {
//                 final ProductElement product =
//                     controller.favoriteProducts[index];
//                 return ListTile(
//                   leading: Image.network(
//                     product.thumbnail ?? "",
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(product.title ?? "No Title"),
//                   subtitle: Text("\$${product.price}"),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.favorite, color: Colors.red),
//                     onPressed: () {
//                       controller.removeFavorite(product);
//                     },
//                   ),
//                 );
//               },
//             );