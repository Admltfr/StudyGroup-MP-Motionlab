import 'package:flutter/material.dart';
import 'package:flutter_motion1/widgets/splash_nav_button.dart';

class Detailpagejam extends StatelessWidget {
  const Detailpagejam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            /*widget layouting yaitu column, row dan stack, untuk row dan column terdapat atribut 
          children dalam bentuk array/list dan dapat disi widget container,text dan lainnya dan juga memiliki atribut alignment property dalam bentuk
          mainaxis dan crossaxis (yang keduanya memiliki atrbut center,start,end dan sebagainya) perlu banyak eksperimen sih*/
            //untuk wrap suatu widget maka diblock dulu lalu ctrl+. atau bisa pakai tekan kanan+refractor
            child: Padding(
              //padding ini digunakan untuk mewrap seluruh widget yang ada di dalamnya dan menerapkannya agar terdapat jarak dengan ujung layar
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //3 icon ini jika jarknya simetris maka iya bisa ditaro di appbar aja jika perlu kustomisasi maka disini aja
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
                    //dengan expanded widget bisa menyesuaikan heightnya secara dinamis seperti jarak jarak sekaligus ukuran antar widget yang ada diatas dan dibawahnya
                    child: SingleChildScrollView(
                      //agar bisa scroll tapi masih error karena widgetnya tidak bisa otomatis di resize heightnya oleh karena itu akan digunakan expanded
                      child: Column(
                        //saat ditambahkan column semua textnya jadi ketengah lagi, oleh karena dia punya parent baru
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset(
                              "assets/images/Jam.png",
                              //double infinity agar dia menyesuaikan widthnya (kayak mediaquery width)
                              width: double.infinity,
                              //selalu gunakan height dari figmanya
                              height: 401,
                              fit: BoxFit.contain,
                            ),
                          ),
                          //agar kedua text ini bisa allign left maka ingat parentnya juga harus left maka jadi axis start yaitu si column pertama
                          //tapi column itu main axisnya top dan botton sedangkan text kanan kiri maka kita gunakan crossaxis untuk column dan row utnuk mainaxis
                          const Text(
                            "Mi Band 8 Pro",
                            //disini sebenarnya textalign tidak perlu karena parentnya sudah mengimplementasikannya duluan
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            //untuk memberi gap
                            height: 10,
                          ),
                          const Text(
                            "\$54.00",
                            //disini sebenarnya textalign tidak perlu karena parentnya sudah mengimplementasikannya duluan
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Color(0xFF00623B)),
                          ),
                          const SizedBox(
                            //untuk memberi gap
                            height: 10,
                          ),
                          const Text(
                            "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                            //disini sebenarnya textalign tidak perlu karena parentnya sudah mengimplementasikannya duluan
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            //untuk memberi gap
                            height: 10,
                          ),
                          const SplashButton(
                              linkNav: '/cart', text: "Add to cart"),
                          const SizedBox(
                            //untuk memberi gap
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
