import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String linkNav;
  final String linkAsset;
  final String nameProduct;
  final String priceProduct;
  const ProductCard(
      {super.key,
      required this.linkNav,
      required this.linkAsset,
      required this.nameProduct,
      required this.priceProduct});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.linkNav);
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              child: Image.asset(
                widget.linkAsset,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.nameProduct),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.priceProduct,
                          style: TextStyle(color: Color(0xFF00623B)),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLike = !isLike;
                            });
                          },
                          child: Icon(
                              isLike ? Icons.favorite_border : Icons.favorite,
                              color: isLike ? Colors.grey : Colors.red),
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
    );
  }
}

/*jika ada widget yang sama yang ingin digunakan coba gunakan ini
                    dalam lib pisah page di folder page, dan widget sedangkan main.dart diluar
                    untuk widget sendiri bisa gunakan di folder widgets, buat stl nah di return placeholdernya masukin widgetnya 
                    lalu didalam namafile/widget(superkey,this.variabelnya) lalu jika ingin dinamis maka harus pakai parameter kan
                    kita pakai di dalam pemaggilannya
                    namafile(fungsi yang dipakai misal hintext : 'ayam') gitu
                
                    
                    */