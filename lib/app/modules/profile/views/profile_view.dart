import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_group_flutter/app/common/widgets/custom_button.dart';
import 'package:study_group_flutter/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) {
        return Obx(
          () => Scaffold(
            body: SafeArea(
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
                      height: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                controller.user.value?.image ??
                                    'https://via.placeholder.com/150'),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "${controller.user.value?.firstName} ${controller.user.value?.lastName}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: const Color(0xFF00623B),
                                ),
                          ),
                          Text(
                            "Gender: ${controller.user.value?.gender}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: const Color(0xFF00623B),
                                ),
                          ),
                          Text(
                            "Email: ${controller.user.value?.email}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: const Color(0xFF00623B),
                                ),
                          ),
                          const SizedBox(height: 20),
                        ]),
                    const Expanded(child: SizedBox()),
                    controller.isLoading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            child: CircularProgressIndicator(
                              color: Color(0xFF00623B),
                            ),
                          )
                        : CustomButton(
                            text: 'Logout',
                            onTap: () {
                              controller.logout();
                            },
                          ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
