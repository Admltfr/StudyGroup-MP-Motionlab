import 'package:flutter/material.dart';
import 'package:flutter_motion1/pages/cart_page.dart';
import 'package:flutter_motion1/pages/detailpagebaju.dart';
import 'package:flutter_motion1/pages/detailpageheadset.dart';
import 'package:flutter_motion1/pages/detailpagejam.dart';
import 'package:flutter_motion1/pages/detailpagesepatu.dart';
import 'package:flutter_motion1/pages/home_page.dart';
import 'package:flutter_motion1/pages/login_page.dart';
import 'package:flutter_motion1/pages/registration_page.dart';
import 'package:flutter_motion1/pages/transaction_page.dart';
import 'package:get/get.dart';

void main() {
  //untuk load semua package
  WidgetsFlutterBinding.ensureInitialized();
  //dalam flutter kita harus menggunakan runapp
  //(gak bisa langsung print gitu kayak dart langsung) runapp menerima sebuah parameter yaitu class yang akan dirun contohnya myapp
  runApp(const MyApp());
}

//untuk buat widget kita tentu harus membuat class contohnya adalah myapp (sebagai root) (namanya juga boleh berubah)
//untuk extends statelesswidget ia harus import  'import 'package:flutter/material.dart';'
//shortcutnya ketik stl
//method yang digunakan dalam class ini adalah build
//GUNAKAN CTRL+. ke elemennya untuk memasukkan const (jika ada error biru)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Loginpage(),
        '/register': (context) => const RegistrationPage(),
        '/home': (context) => const Homepage(),
        '/baju': (context) => const Detailpagebaju(),
        '/headset': (context) => const Detailpageheadset(),
        '/jam': (context) => const Detailpagejam(),
        '/sepatu': (context) => const Detailpagesepatu(),
        '/cart': (context) => const CartPage(),
        '/transaction': (context) => const TransactionPage(),
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}