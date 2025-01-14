import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motion_shop/app/common/widgets/custom_button.dart';
import 'package:motion_shop/app/common/widgets/custom_textfield.dart';
import '../controllers/login_controller.dart';
import 'package:lottie/lottie.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.h,
                child: Lottie.asset('assets/lottie/lottie_login.json'),
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Happy Shopping All',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xFF707070),
                    ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Email',
                icon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xFF344E41),
                ),
                textInputType: TextInputType.emailAddress,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Password',
                icon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF344E41),
                ),
                isPassword: true,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Login',
                onTap: () {
                  Get.offAllNamed('/dashboard');
                },
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/register',
                      );
                    },
                    child: const Text(
                      'Register',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
