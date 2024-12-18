import 'package:flutter/material.dart';
import 'package:flutter_motion1/widgets/splash_nav_button.dart';
import 'package:flutter_motion1/widgets/input_form_set.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //jika sudah hafal packagenya coba ctrl + shift + p lalu dan klik add dependency
                Lottie.asset('assets/lottie/lottie_login.json'),
                //ctrl + shift + p lalu user preference lalu ke json dan pakai fixall (edit di editornya)
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Welcome!",
                  //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                  )),
                ),
                Text(
                  "Happy shopping all",
                  //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                    fontSize: 18,
                    letterSpacing: .5,
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                const InputboxTextdata(
                  text: "Email",
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputboxTextdata(
                  text: "Password",
                  obscure: true,
                ),

                const SizedBox(
                  height: 30,
                ),

                const SplashButton(linkNav: '/home', text: "Login"),
                const SizedBox(
                  height: 10,
                ),
                const BottomTextButton(
                    questionText: "Don't have an account?",
                    linkNav: '/register',
                    buttonText: "Register"),

                const SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
