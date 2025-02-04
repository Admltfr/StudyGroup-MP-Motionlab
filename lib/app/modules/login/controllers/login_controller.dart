import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_group_flutter/app/data/models/user_model_api.dart';
import 'package:study_group_flutter/app/data/service/api_service.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ApiService userService = ApiService();

  bool isLoading = false;
  String errorMessage = '';

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }

  String? validateInput() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty) {
      return 'Username cannot be empty';
    } else if (username.length < 3) {
      return 'Username must be at least 3 characters long';
    }

    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  Future<void> login() async {
    final validationError = validateInput();
    if (validationError != null) {
      Get.snackbar('Validation Error', validationError);
      return;
    }

    isLoading = true;
    update();

    try {
      final UserModel user = await userService.userLogin(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', true);
      await prefs.setString('username', user.username);
      await prefs.setString('token', user.accessToken);

      Get.snackbar('Login Successful', 'Welcome, ${user.firstName}');
      Get.offNamed('/dashboard');
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
