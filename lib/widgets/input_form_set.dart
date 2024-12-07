import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputboxTextdata extends StatelessWidget {
  final String text;
  final bool obscure;
  const InputboxTextdata(
      {super.key, required this.text, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: GoogleFonts.roboto(
              textStyle: const TextStyle(
            fontSize: 14,
            letterSpacing: .5,
          )),
          prefixIcon: const Icon(Icons.mail),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}

class SplashButton extends StatelessWidget {
  final String linkNav;
  final String text;
  const SplashButton({super.key, required this.linkNav, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: Color.fromARGB(255, 177, 198, 189),
      onTap: () {
        Navigator.pushNamed(context, linkNav);
      },
      child: Ink(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFF00623B),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,

            //untuk panggil googlefonts tinggal, GoogleFonts.namafont
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              letterSpacing: .5,
            )),
          ),
        ),
      ),
    );
  }
}

class BottomTextButton extends StatelessWidget {
  final String questionText;
  final String linkNav;
  final String buttonText;

  const BottomTextButton(
      {super.key,
      required this.questionText,
      required this.linkNav,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, linkNav);
            },
            child: Text(
              buttonText,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontSize: 15,
                color: Colors.blue,
                letterSpacing: .5,
              )),
            )),
      ],
    );
  }
}
