## Daftar Isi 
- [Modularitas](#modularitas) 
	- [Aturan Penamaan](#aturan-penamaan) 
	- [Reusable Widget](#reusable-widget) 
- [Package](#package) 
- [Navigasi](#navigasi) 
  -  [Aturan Navigasi](#aturan-navigasi) 
  -  [Push](#push)
  -  [Pop](#pop)
- [Shortcut](#shortcut) Penting!

## Modularitas
- **Modularisasi** adalah praktik membagi fungsionalitas menjadi modul-modul yang terpisah dan independen. Dalam pengembangan aplikasi adalah cara yang efisien untuk mengatur komponen-komponen aplikasi dan memungkinkan kolaborasi dalam tim-tim pengembangan.
### Aturan Penamaan
- Dalam penamaan file di framework flutter sendiri biasanya digunakan x_y.dart sebagai penamaan secara umumnya
### Reusable Widget
- **Reusable Widget** adalah widget yang bisa digunakan kembali, untuk mempermudah pembacaan dan pembuatan algoritma terdapat suatu prinsip penting yaitu modularisasi fungsi/code untuk menghindari duplikasi suatu code yang berpotensi membingungkan programmer lain dan mempersulit proses debugging, oleh karena itu dalam flutter sendiri widget dapat digunakan kembali. Contohnya
> Widget.dart
```dart
class  ReusableWidget  extends  StatelessWidget {
	final  String  text;
	const  ReusableWidget({super.key,required  this.text});
	@override
	Widget  build(BuildContext  context) {
		return  Container(
			child:  Text(text)
		);
	}
}
```
File widget,dart diatas biasanya disimpan di direktori lib/pages/Widget.dart

Lalu untuk memanggil widgetnya sendiri, perlu mengimport file widget tersebut dan disini dapat dilakukan pemanggilan
> Main.dart
```dart
import  'package:project_name/pages/Widget.dart';
class  MyApp  extends  StatelessWidget {
	const  MyApp({super.key});
	@override
	Widget  build(BuildContext  context) {
		return  MaterialApp(
			home:  Scaffold(
				body: ReusableWidget(text : "DRY"), 
			),
		);
	}
}
```

## Package
- **Package** dalam framework flutter adalah kumpulan kode dart yang dapat memudahkan atau mengakses file dart yang membantu proses pengembangan aplikasi. Contohnya seperti Lottie dan Google Fonts yang dimana package ini dapat memudahkan pengembang atau developer dalam mengembangkan suatu aplikasi dengan fungsional yang lebih baik. Contoh instalasi :
format: nama_package : ^versi
> Pubspec.yaml
```yaml
dependencies:
	flutter:
		sdk: flutter
	cupertino_icons: ^1.0.8
	lottie: ^3.1.3
	google_fonts: ^6.2.1
```
Lalu run di terminal
```cmd
flutter pub get 
```
Lalu diimport pada file.dart yang menggunakan package tersebut. Contoh :
```dart
import  'package:google_fonts/google_fonts.dart';
```
Lalu terakhir masukkan sintaks untuk melakukan load semua package saat aplikasi dimulai pada main.dart didalam fungsi void main()
```dart
WidgetsFlutterBinding.ensureInitialized();
```
## Navigasi
- Navigasi merupakan suatu mekanisme untuk berpindah pada satu page ke page yang lain, disini mekanisme navigasi sangat penting untuk diterapkan pada setiap aplikasi yang ada hingga sifatnya wajib untuk diterapkan untuk di berbagai proyek yang memiliki lebih dari 1 page.

### Aturan Navigasi
- Navigasi page sendiri dapat dianalogikan sebagai stack/tumpukan yang dimana memiliki konsep Last In, First Out hingga memiliki 2 proses yaitu Push dan Pop
- Dalam framework flutter terdapat atribut dari MaterialApp yaitu routes yang dimana ini digunakan untuk menginisialisasi semacam map untuk melakukan navigasi. Contoh : 
> Main.dart
```dart
class  MyApp  extends  StatelessWidget {
	const  MyApp({super.key});
	@override
	Widget  build(BuildContext  context) {
		return  MaterialApp(
			debugShowCheckedModeBanner:  false,
			initialRoute:  '/login',
			routes: {
				'/login': (context) =>  const  Loginpage(),
				'/register': (context) =>  const  RegistrationPage(),
				'/home': (context) =>  const  Homepage(),
				'/baju': (context) =>  const  Detailpagebaju(),
				'/headset': (context) =>  const  Detailpageheadset(),
				'/jam': (context) =>  const  Detailpagejam(),
				'/sepatu': (context) =>  const  Detailpagesepatu(),
			},
		);
	}
}
```
Disini terdapat initialRoute yang digunakan sebagai halaman utama aplikasi saat dibuka, lalu di dalam routes terdapat beberapa key ('/key') dengan page sebagai valuenya, key ini berguna untuk memanggil mekanisme navigasi pada page.

**Penting**
Tiap page kecuali main.dart jangan ada yang memiliki MaterialApp lain karena dalam routing ia akan otomatis mencari Inisialisasi MaterialApp terdekat hingga menimbulkan anomali/error
### Push
- Push merupakan proses dalam navigasi untuk berpindah ke halaman selanjutnya dari aplikasi 
```dart
Navigator.popAndPushNamed(context, '/baju');
```
Sintaks diatas digunakan untuk melakukan navigasi ke page yang memiliki key '/baju' yang dimana telah terdaftar untuk navigasi ke page Detailpagebaju
### Pop
- Pop merupakan proses dalam navigasi untuk berpindah ke halaman sebelumnya dari aplikasi 
```dart
Navigator.popAndPushNamed(context, '/home');
```
Sintaks diatas digunakan untuk melakukan navigasi ke page yang memiliki key '/home' yang dimana telah terdaftar untuk navigasi ke page HomePage()

## Shortcut
- Membuat Template Stateless Widget
> - Ketik "stl" 
-	Mengakses menu refractor
> - Ctrl + .
- Melihat semua atribut pada widget yang digunakan
> - Ctrl + i
