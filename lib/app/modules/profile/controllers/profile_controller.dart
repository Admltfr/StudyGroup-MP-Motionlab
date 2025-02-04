import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_group_flutter/app/data/models/user_model_api.dart';
import 'package:study_group_flutter/app/data/service/api_service.dart';

class ProfileController extends GetxController {
  Rx<User?> user = Rx<User?>(null);

  ApiService userService = ApiService();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', false);
    await prefs.remove('username'); 
    await prefs.remove('id');
    isLoading.value = false;
    Get.snackbar('Logged Out', 'You have been logged out');
    Get.offNamed('/login');
  }

  Future<void> fetchUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      final userData = await userService.getUserData(token);
      user.value = userData;
    } finally {
      isLoading.value = false;
    }
  }
}
