import 'package:flutter/material.dart';
import 'package:flutter_motion1/detailpagejam.dart';
import 'package:flutter_motion1/detailpageheadset.dart';
import 'package:flutter_motion1/detailpagebaju.dart';
import 'package:flutter_motion1/detailpagesepatu.dart';

//untuk buat widget kita tentu harus membuat class contohnya adalah myapp (sebagai root) (namanya juga boleh berubah)
//untuk extends statelesswidget ia harus import  'import 'package:flutter/material.dart';'
//shortcutnya ketik stl
//method yang digunakan dalam class ini adalah build
//GUNAKAN CTRL+. ke elemennya untuk memasukkan const (jika ada error biru)
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _MyAppState();
}

class _MyAppState extends State<Homepage> {
  bool is_like1 = false;
  bool is_like2 = false;
  bool is_like3 = false;
  bool is_like4 = false;

  @override
  Widget build(BuildContext context) {
    //cuman return text gini dia pasti error dia harus dibungkus sesuai dengan pohon widget yang berurutan (gak bisa skip skip)
    //untuk yang pertama yaitu materialapp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home merupakan atribut dari materialapp
      //selanjutnya digunakan scaffold (sesuai urutan)
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "Card"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: "Notifications"),
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.menu,
                              size: 23,
                            ),
                            Image.asset(
                              "assets/images/IconShop.png",
                              width: 47,
                            ),
                            const Icon(
                              Icons.shopify,
                              size: 23,
                            ),
                          ],
                        ),
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.all(10),
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300]),
                                child: const Text(
                                  "All",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.all(10),
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300]),
                                child: const Text(
                                  "Watch",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.all(10),
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300]),
                                child: const Text(
                                  "Shirt",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.all(10),
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300]),
                                child: const Text(
                                  "Shoes",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
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
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Detailpagejam()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2.0,
                                          offset: Offset(1, 1),
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: double.infinity,
                                        child: Image.asset(
                                          'assets/images/Jam.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Mi Band 8 Pro"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "\$54.00",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF00623B)),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        is_like1 = !is_like1;
                                                      });
                                                    },
                                                    child: Icon(
                                                        is_like1
                                                            ? Icons
                                                                .favorite_border
                                                            : Icons.favorite,
                                                        color: is_like1
                                                            ? Colors.grey
                                                            : Colors.red),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Detailpagebaju()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2.0,
                                          offset: Offset(1, 1),
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: double.infinity,
                                        child: Image.asset(
                                          'assets/images/Baju.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Lycra Men's Shirt"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "\$12.00",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF00623B)),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        is_like2 = !is_like2;
                                                      });
                                                    },
                                                    child: Icon(
                                                        is_like2
                                                            ? Icons
                                                                .favorite_border
                                                            : Icons.favorite,
                                                        color: is_like2
                                                            ? Colors.grey
                                                            : Colors.red),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Detailpageheadset()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2.0,
                                          offset: Offset(1, 1),
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: double.infinity,
                                        child: Image.asset(
                                          'assets/images/Headset.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Siberia 800"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "\$45.00",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF00623B)),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        is_like3 = !is_like3;
                                                      });
                                                    },
                                                    child: Icon(
                                                        is_like3
                                                            ? Icons
                                                                .favorite_border
                                                            : Icons.favorite,
                                                        color: is_like3
                                                            ? Colors.grey
                                                            : Colors.red),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Detailpagesepatu()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2.0,
                                          offset: Offset(1, 1),
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: double.infinity,
                                        child: Image.asset(
                                          'assets/images/Sepatu.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Strawberry Frappucino"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "\$35.00",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF00623B)),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        is_like4 = !is_like4;
                                                      });
                                                    },
                                                    child: Icon(
                                                        is_like4
                                                            ? Icons
                                                                .favorite_border
                                                            : Icons.favorite,
                                                        color: is_like4
                                                            ? Colors.grey
                                                            : Colors.red),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
        //safearea agar tidak menabrak elemen widget yang seharusnya tidak disentuh pada layar
        //untuk mengetahui semua atribut yang bisa digunakan gunakan ctrl+i (blok/tempatkan cursor pengetikan dulu dalam kurung parameternya)
        //kalau namanya yang di ctrl+i maka dia akan ngasih yang mirip

        /*Image.asset(
              //image.asset digunakan untuk import image secara local yang dimana harus diregister terlbih dahulu di pubspec.yaml,
              //gunakan uncomment ctrl+/ untuk uncomment templatenya
              "assets/images/Profile-image.png"),*/

        /*Icon(
              //untuk icon flutter memiliki import bawaan
              Icons.abc_outlined)*/
        /*Container(
              //untuk container sendiri ini digunakan untuk membungkus suatu widget 
              width: 290,
              height: 290,
              color: Colors.amber),*/

        /*button dan sebagainya*/
      ),
    );
  }
}
