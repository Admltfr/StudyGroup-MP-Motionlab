import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


class CustomTextButton extends StatelessWidget {
  final String questionText;
  final String linkNav;
  final String buttonText;

  const CustomTextButton(
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
              Get.toNamed(linkNav);
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
