import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:motion_shop/app/data/models/product_models.dart';
import 'package:motion_shop/app/data/utils/data_dummy.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Get.toNamed('/cart');
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Our way of loving \nyou back',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 25.sp),
              ),
              const SizedBox(height: 30),
              SearchBar(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                elevation: const WidgetStatePropertyAll(0),
                leading: const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.search,
                    color: Color(0xFF868A91),
                  ),
                ),
                hintText: 'Search',
                hintStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    color: Colors.grey,
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll(
                  Color(0xFFF2F2F2),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: DataDummy.listDummyCategories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final String data = DataDummy.listDummyCategories[index];

                    return Obx(() {
                      return InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () => controller.filterProducts(data),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 4,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: controller.selectedCategory.value == data
                                ? const Color(0xFF00623B)
                                : const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            data,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color:
                                      controller.selectedCategory.value == data
                                          ? Colors.white
                                          : const Color(0xFF4D4D4D),
                                ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Our Best Seller',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.67,
                  ),
                  itemCount: controller.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final ProductModel data =
                        controller.filteredProducts[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Get.toNamed('/product-details', arguments: data.id);
                        // Navigator.pushNamed(
                        //   context,
                        //   '/product-details',
                        //   arguments: data.id,
                        // );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFFCFFFE),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                data.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                top: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.name,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${data.price}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              color: const Color(0xFF00623B),
                                            ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite,
                                          color: data.isFavorite
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
