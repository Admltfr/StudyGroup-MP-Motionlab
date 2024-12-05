import 'package:flutter/material.dart';
import 'package:flutter_motion1/homepage.dart';
import 'package:flutter_motion1/registration_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //jika sudah hafal packagenya coba ctrl + shift + p lalu dan klik add dependency
                  Lottie.asset('assets/lottie/lottie_login.json'),
                  //ctrl + shift + p lalu user preference lalu ke json dan pakai fixall (edit di editornya)
                  /*jika ada widget yang sama yang ingin digunakan coba gunakan ini
                    dalam lib pisah page di folder page, dan widget sedangkan main.dart diluar
                    untuk widget sendiri bisa gunakan di folder widgets, buat stl nah di return placeholdernya masukin widgetnya 
                    lalu didalam namafile/widget(superkey,this.variabelnya) lalu jika ingin dinamis maka harus pakai parameter kan
                    kita pakai di dalam pemaggilannya
                    namafile(fungsi yang dipakai misal hintext : 'ayam') gitu
                
                    
                    */
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Welcome!",
                    //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .5,
                    )),
                  ),
                  Text(
                    "Happy shopping all",
                    //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      fontSize: 18,
                      letterSpacing: .5,
                    )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          fontSize: 14,
                          letterSpacing: .5,
                        )),
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          fontSize: 14,
                          letterSpacing: .5,
                        )),
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  //semakin banyak page yang numpuk semakin berat

                  //untuk material page route sebenarnya ada cara lebih mudah,
                  //hapus navigator dlu lalu pindah ke material app, didalamnya atribut routes kita daftarkan di awal contoh
                  //routes :
                  //  {'/': (context) => const Loginpage()}
                  //  {'/Register': (context => const Registerpage)}
                  //kan pasti error maka kita gak bisa pake home kita harus pakai
                  //initialroute: '/'
                  //maksudnya initial route akan langsung berapa di alamat route '/'
                  // kan ada 2 '/' dan '/register' nahh
                  //oh ya ini di main.dart
                  //untuk ngepush maka
                  //pakai navigator.pushname(context,'/register');

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size.fromHeight(55),
                      backgroundColor: Color(0xFF00623B),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Homepage();
                        }),
                      );
                    },
                    child: Text(
                      "Login",

                      //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        letterSpacing: .5,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const RegistrationPage();
                              }),
                            );
                          },
                          child: Text("Register")),
                    ],
                  ),

                  const SizedBox(
                    height: 500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
