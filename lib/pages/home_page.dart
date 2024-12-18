import 'package:flutter/material.dart';
import 'package:flutter_motion1/widgets/filter_button.dart';
import 'package:flutter_motion1/widgets/product_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        leadingWidth: 60,
        title: Image.asset(
          "assets/images/IconShop.png",
          width: 47,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/cart');
              },
              icon: const Icon(Icons.shop)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Card"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: "Notifications"),
        ],
        backgroundColor: const Color(0xFF00623B),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Our way of loving",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "you back",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(7),
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300]),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FilterButton(text: "All"),
                            FilterButton(text: "Watch"),
                            FilterButton(text: "Shirt"),
                            FilterButton(text: "Shoes"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Our Best Seller",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 450,
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.61,
                          ),
                          scrollDirection: Axis.vertical,
                          children: const [
                            ProductCard(
                              linkNav: '/jam',
                              linkAsset: "assets/images/Jam.png",
                              nameProduct: "Mi Band 8 Pro",
                              priceProduct: "\$54.00",
                            ),
                            ProductCard(
                              linkNav: '/baju',
                              linkAsset: "assets/images/Baju.png",
                              nameProduct: "Lycra Men's Shirt",
                              priceProduct: "\$12.00",
                            ),
                            ProductCard(
                              linkNav: '/headset',
                              linkAsset: "assets/images/Headset.png",
                              nameProduct: "Siberia 800",
                              priceProduct: "\$45.00",
                            ),
                            ProductCard(
                              linkNav: '/sepatu',
                              linkAsset: "assets/images/Sepatu.png",
                              nameProduct: "Strawberry Frappucino",
                              priceProduct: "\$35.00",
                            ),
                          ],
                        ),
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
