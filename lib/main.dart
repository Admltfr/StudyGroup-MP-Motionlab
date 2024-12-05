import 'package:flutter/material.dart';
import 'package:flutter_motion1/detailpagebaju.dart';
import 'package:flutter_motion1/detailpageheadset.dart';
import 'package:flutter_motion1/detailpagejam.dart';
import 'package:flutter_motion1/detailpagesepatu.dart';
import 'package:flutter_motion1/homepage.dart';
import 'package:flutter_motion1/login_page.dart';
import 'package:flutter_motion1/registration_page.dart';
//import 'package:flutter_motion1/homepage.dart';

void main() {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loginpage(),
        '/register' : (context) => const RegistrationPage(),
        '/home': (context) => const Homepage(),
        '/baju': (context) => const Detailpagebaju(),
        '/headset': (context) => const Detailpageheadset(),
        '/jam': (context) => const Detailpagejam(),
        '/sepatu': (context) => const Detailpagesepatu(),
      },
    );
  }
}
