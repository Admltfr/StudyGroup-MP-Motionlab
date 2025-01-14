import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_shop/app/modules/home/views/home_view.dart';

class DashboardController extends GetxController {
 var selectedIndex = 0.obs;  // Using GetX's reactive variables

  // List of pages
  final List<Widget> pages = [
    const HomeView(),
    const Center(
      child: Text('Favorite Page \nSabar dlu yahhhh'),
    ),
    const Center(
      child: Text('Ini ganti jadi profile aja yaaak'),
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;  // Update the selected index
  }
}
