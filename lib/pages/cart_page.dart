import 'package:flutter/material.dart';
import 'package:flutter_motion1/widgets/cart_card.dart';
import 'package:flutter_motion1/widgets/splash_nav_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              icon: const Icon(Icons.chevron_left)),
        ),
        leadingWidth: 60,
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CartCard(
                      linkAsset: 'assets/images/Jam.png',
                      titleText: "Mi Band 8 Pro - Brand New",
                      subtitleText: "\$54.00",
                    ),
                    CartCard(
                      linkAsset: 'assets/images/Baju.png',
                      titleText: "Lycra Men’s shirt",
                      subtitleText: "\$12.00",
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SplashButton(linkNav: '/transaction', text: "Buy Now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
