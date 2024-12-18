import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashButton extends StatelessWidget {
  final String linkNav;
  final String text;
  const SplashButton({super.key, required this.linkNav, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: const Color.fromARGB(255, 177, 198, 189),
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