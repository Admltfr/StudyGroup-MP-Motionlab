import 'package:flutter/material.dart';
import 'package:flutter_motion1/widgets/splash_nav_button.dart';

class Detailpagejam extends StatelessWidget {
  const Detailpagejam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
           child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/home');
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          size: 33,
                        ),
                      ),
                      const Text(
                        "Product",
                        style: TextStyle(fontSize: 22),
                      ),
                      const Icon(
                        Icons.favorite,
                        size: 33,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset(
                              "assets/images/Jam.png",
                              width: double.infinity,
                              height: 401,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text(
                            "Mi Band 8 Pro",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "\$54.00",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Color(0xFF00623B)),
                          ),
                          const SizedBox(
                           height: 10,
                          ),
                          const Text(
                            "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                           height: 10,
                          ),
                          const SplashButton(
                              linkNav: '/cart', text: "Add to cart"),
                          const SizedBox(
                           height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
