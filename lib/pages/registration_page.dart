import 'package:flutter/material.dart';
import 'package:flutter_motion1/widgets/input_form_set.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Register",
                //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .5,
                )),
              ),
              Text(
                "Create your account for Happy Shopping",
                //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  fontSize: 15,
                  letterSpacing: .5,
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              const InputboxTextdata(
                text: "Full Name",
                obscure: false,
              ),
              const SizedBox(
                height: 10,
              ),
              const InputboxTextdata(text: "Email", obscure: false),
              const SizedBox(
                height: 10,
              ),
              const InputboxTextdata(text: "Password", obscure: true),
              const SizedBox(
                height: 10,
              ),
              const InputboxTextdata(text: "Confirm Password", obscure: true),
              const SizedBox(
                height: 30,
              ),
              const SplashButton(linkNav: '/login', text: "Register"),
              const SizedBox(
                height: 10,
              ),
              const BottomTextButton(
                  questionText: "Already have an account?",
                  linkNav: '/login',
                  buttonText: "Login"),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
