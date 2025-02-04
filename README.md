## Daftar Isi

- [API](#api)
  - [Asynchronous Programming](#asynchronous-programming)
  - [Implementasi MVC](#implementasi-mvc)
    - [Model](#model)
    - [Service](#service)
    - [Controller](#controller)
    - [View](#view)
  - [Local Storage](#local-storage)

## API

- **API** atau **Application Programming Interface** merupakan sistem yang mengatur interaksi antar klien dan server, atau analoginya bisa dibilang seperti semacam sistem komunikasi dan pertukaran data.
- **API** sendiri biasanya digunakan dalam bentuk link url atau key unik yang berisikan data-data yang digunakan dalam suatu aplikasi dan biasanya dalam bentuk string dan berformat JSON.
- **API** memiliki kegunaan yang sangat penting dalam pengembangan aplikasi karena tidak mungkin kalau suatu aplikasi memiliki seluruh data di pada penyimpanan aplikasi tersebut.
- **API** biasanya memiliki data berbentuk key-value hingga memiliki beberapa fungsi yaitu GET(Untuk membaca data), POST(Untuk mengirim data/mengisi data), PUT(Untuk mengupdate data), dan DELETE(Untuk menghapus data).

### Asynchronous Programming

- **Asynchronous Programming** adalah pemrograman yang tidak terjadi secara spontan atau bisa dibilang tidak langsung dieksekusi/dieksekusi terlambat yang dimana faktor utamanya terikat erat dengan integrasi **API** yang dimana memerlukan koneksi internet yang dimana program harus mendapatkan data dari **API** terlebih dahulu, setelah itu baru bisa digunakan untuk sektor lain seperti UI.
- Bisa dibilang **Asynchronous Programming** memberikan fitur kepada suatu fungsi yang dieksekusi untuk mengantre/menunggu hingga fungsi yang harus dieksekusi disebelumnya telah sukses dieksekusi

```dart
Future<void> fungsi() async {
	print("NO1");
	await print("Aku harus dieksekusi terlebih dahulu dari NO2");
	print("NO2")
}
```

> Diatas merupakan contoh menggunakan Asynchronous Programming yang dimana await merupakan sintaks untuk memberi suatu fungsi untuk selalu ditunggu untuk dieksekusi lalu akan dilanjutkan ke NO2

### Implementasi MVC

- **MVC** seperti yang telah dijelaskan pada Project 4 merupakan suatu konsep penting dalam state management karena menjelaskan alur bagaimana state digunakan yang terdiri dari
  - Controller
    - Yaitu bagian yang memanipulasi model dan mengubah view
  - Model
    - Yaitu bagian yang berisikan logika dan aturan aturan dari suatu aplikasi
  - View
    - Yaitu bagian yang mentranslasikan model menjadi suatu tampilan/interface
- **MVC** dalam integrasi API sangat penting, guna untuk membuat kode menjadi lebih mudah dimengerti dan bersifat modular dan untuk urutannya secara teknis akan diurutkan dari Model-Service-Controller-View.

#### Model

- Model merupakan struktur dari data apa yang akan kita dapatkan dari API, disini saya menggunakan software Postman API terlebih dahulu untuk melakukan fungsi GET untuk bisa melihat data dari 'https://dummyjson.com/products/category-list'

```json
[
  "beauty",
  "fragrances",
  "furniture",
  "groceries",
  "home-decoration",
  "kitchen-accessories",
  "laptops",
  "mens-shirts",
  "mens-shoes",
  "mens-watches",
  "mobile-accessories",
  "motorcycle",
  "skin-care",
  "smartphones",
  "sports-accessories",
  "sunglasses",
  "tablets",
  "tops",
  "vehicle",
  "womens-bags",
  "womens-dresses",
  "womens-jewellery",
  "womens-shoes",
  "womens-watches"
]
```

> Ini merupakan tampilan Postman API ketika mendapatkan data dari link yang telah disediakan diatas

- Selanjutnya setelah mendapatkan data yang terdapat pada link tersebut kita harus mengkonversinya terlebih dahulu ke bahasa yang dikenali flutter yaitu dart, oleh karena itu disini saya menggunakan fitur dari aplikasi web https://app.quicktype.io/?l=dart
- Tetapi karena berhubung struktur JSONnya yang sederhana kita tidak perlu melakukan prosedur diatas karena link tersebut hanya menampilkan list dari string biasa yang datanya pasti akan langsung dikenali oleh flutter karena hanya berupa list string sederhana hingga bagian model dapat kita lewati (Kode lebih lengkap bisa dilihat pada project)

#### Service

- Service merupakan suatu kelas yang berisikan fungsi yang digunakan untuk pemanggilan API dan menentukan data apa yang diambil, hingga sangat penting untuk memahami tipe data apa yang akan digunakan untuk aplikasi.
- Untuk melakukan pemanggilan API pada flutter saya menggunakan package DIO

```dart
import  'package:dio/dio.dart';
var  dio  =  Dio();
String  url  =  'https://dummyjson.com';

class Service {
	Future<List<String>> getCategory() async {
	    try {
		    final  response  =  await  dio.get('$url/products/category-list');
		    if (response.statusCode  ==  200) {
			    return  List<String>.from(response.data);
		    }
		    return [];
	    } catch (e) {
		    return  throw  Exception(e);
	    }
	}
}
```

> Kode diatas digunakan untuk mengambil data dari 'https://dummyjson.com/products/category-list' apabila koneksi pada API berhasil yang ditandai dengan statuscode == 200, (Catatan kode status bisa berubah tergantung penetapan tim Backend

- Seperti yang terlihat terdapat beberapa sintaks penting lain dalam Asynchronous Programming yaitu try-catch atau bisa dibilang suatu fungsi yang dapat mengeksekusi pemanggilan API dengan lebih aman karena memiliki kemampuan error handling yang dilakukan dengan catch dengan parameter e atau error yang terjadi
- **PENTING!!!! PERHATIKAN TIPE DATA YANG DIPERLUKAN!!**

#### Controller

- Controller adalah sektor yang digunakan untuk memanipulasi state dan data yang digunakan pada UI aplikasi untuk penggunaannya sebagai berikut

```dart
List<String> categoryList  = [];
RxBool  isLoading  =  true.obs;
Service service = Service();

Future<List<String>> fetchCategory() async {
	try {
		List<String> fetchedCategory  =  await  service.getCategory();
		return  categoryList  = ["All", ...fetchedCategory];
	} finally {
		isLoading.value  =  false;
	}
}
```

> Diatas terlihat terdapat 3 variabel yang digunakan pada fungsi asinkron fetchCategory yang digunakan untuk mendapatkan data category yang ada pada 'https://dummyjson.com/products/category-list' yang telah dikonversi dari JSON ke String yang dikenali flutter, lalu dilanjutkan dengan memasukkannya pada suatu list yang sebelumnya telah di tambahkan "All" sebagai anggota pertamanya, dan jika semuanya telah tereksekusi dengan baik isLoading akan berubah valuenya

#### View

- View merupakan tampilan dari UI, yang merupakan implementasi utama yang digunakan untuk menjalankan aplikasi
- View terikat erat dengan controller karena memerlukannya untuk mengubah state sekaligus terjadinya pertukaran data, berikut contohnya

```dart
SizedBox(
	height:  40,
	child:  ListView.separated(
		shrinkWrap:  true,
		scrollDirection:  Axis.horizontal,
		clipBehavior:  Clip.none,
		itemCount:  controller.categoryList.length,
		separatorBuilder: (context, index) =>
			const  SizedBox(width:  12),
		itemBuilder: (context, index) {
		final  String  data  =
		controller.categoryList[index];
			return  InkWell(
				borderRadius:  BorderRadius.circular(50),
				onTap: () {},
				child:  Container(
				padding:  const  EdgeInsets.symmetric(
					horizontal:  24,
					vertical:  4
				)
				child:  Text(data)
		)
	)
)
```

> Diatas terlihat kalau listview.separated akan menghasilkan jumlah list sesuai dengan jumlah/panjang list dari categoryList yang berasal dari controller dan tiap iterasinya akan menampilkan string yang didapat dari list yang berasal dari 'https://dummyjson.com/products/category-list'

### Local Storage

- **Local Storage** adalah suatu fitur yang memungkinkan penyimpanan data aplikasi yang bersifat non-volatile alias tidak akan hilang apabila aplikasi direstart atau ditutup
- Fitur ini juga memungkinkan pengguna mengakses data mereka ketika tidak ada koneksi internet
- layaknya **API** data **Local Storage** biasanya memiliki data berbentuk key-value hingga memiliki beberapa fungsi yaitu GET(Untuk membaca data), SET(Untuk mengirim data/mengisi data serta dapat mengupdate data dengan hanya reassign), dan REMOVE(Untuk menghapus data), Contoh penggunaannya sebagai berikut (disini saya menggunakan package shared_preferences).

```dart
final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setInt('counter', 10);
await prefs.setBool('repeat', true);
await prefs.setDouble('decimal', 1.5);
await prefs.setString('action', 'Start');
await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
```

> Sintaks ini digunakan untuk mengatur dan menambahkan data ke local storage

```dart
final int? counter = prefs.getInt('counter');
final bool? repeat = prefs.getBool('repeat');
final double? decimal = prefs.getDouble('decimal');
final String? action = prefs.getString('action');
final List<String>? items = prefs.getStringList('items');
```

> Sintaks ini digunakan untuk membaca dan mendapatkan data dari local storage

```dart
await prefs.remove('counter');
```

> Sintaks ini digunakan untuk menghapus data dari local storage

- Seperti yang terlihat penggunaannya juga dibarengi dengan Asynchronous Programming hingga sintaks tersebut hanya bisa digunakan pada fungsi asinkron karena perlu waktu untuk memproses datanya.
- Implementasi lebih jauh dapat dilihat pada project
