import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      body: Obx(() {
        // Use Obx to rebuild the body whenever selectedIndex changes
        return controller.pages[controller.selectedIndex.value];
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,  // Use reactive selectedIndex
        onTap: controller.onItemTapped,  // Call the onItemTapped method from controller
        backgroundColor: const Color(0xFF00623B),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            activeIcon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
