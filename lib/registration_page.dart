import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_motion1/login_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Register",
                  //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                  )),
                ),
                Text(
                  "Create your account for Happy Shopping",
                  //untuk panggil googlefonts tinggal, GoogleFonts.namafont
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                    fontSize: 15,
                    letterSpacing: .5,
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Full Name',
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
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
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
                        return const Loginpage();
                      }),
                    );
                  },
                  child: Text(
                    "Register",

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
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const Loginpage();
                            }),
                          );
                        },
                        child: Text("Login")),
                  ],
                ),

                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
