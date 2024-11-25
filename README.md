Ringkasan materi pertemuan WEEK-1
Ringkasan Ditulis dalam bentuk code dan comments

void main() {

  //basic variabel dan print
  String nama = "Adam Lutfi Ramadhan";
  int umur = 20;
  double tinggi = 173.5;
  bool dewasa = umur >= 20;
  print(nama);
  print(umur);
  print(tinggi);
  print(dewasa);


  print("Halo Nama saya $nama, saya berumur $umur" );

  //untuk petik dua tapi tetap diprint petik duanya
  print("saya \"mahasiswa\"");

  //penggunaan var
  //var digunakan untuk agar si dart bisa otomatis mendeteksi variabelnya apa
  var sigma = "adam";
  var pi = 3.14;
  var skor = 4;

  //inisiasi / assign variabel
  //sigma = 2;
  // assign diatas itu tidak bisa karena dart itu variabelnya strongly typed hingga gak bisa seenaknya diubah
  sigma = "mada";
  pi = 2.1;
  print(sigma);
  print(pi);
  print(skor);

  // untuk mengubah variabel secara bebas pakai dynamic (SANGAT TIDAK DISARANKAN)
  dynamic lingkaran = "lingkaran";
  lingkaran = 20;
  print(lingkaran);

  //introduction final variable (membuat variabel tidak bisa diubah sama sekali walau diassign pun gak mungkin diubah) dan performanya paling cepat (prioritas jika variabelnya memang tak akan diubah)
  //beda const dan final
  //const itu dibuat selalu saat setelah dirun
  //klo final itu di run time jadi baru dibuat klo dipake
  //const biasanya dipakai untuk config seperti nama versi dll
  //intinya perbedaannya cuman pada masa pembuatan variabel
  final String prinsip = "gigih";
  //prinsip = "menyerah";
  //jika diassign dengan apapun walau dengan tipe data sama tak akan bisa
  print(prinsip);

  //tipe data null
  //int number1;
  int? number2;
  print(number2);
  //print(number1)
  // number2 bisa dirun karena dia null ditandai dengan tanda tanya di depan nama variabelnya
  //number1 gak bisa karena aturannya null safety walau number1 dicoba diassign null pun tetep error


  //operasi aritmatika
  //pembagian WAJIB PAKAI VARIABLE DOUBLE

  //int hasil = 4/2; gak bisa
  //double hasil = 4/2; bisa

  //khusus untuk yang pasti dapet bilangan bulat bisa dipakai

  int hasil = 4 ~/2 ;

  print(hasil);

  //percabangan kurang lebih cukup umum syntaxnya

  if (dewasa) {
    sigma = "Adam";
  } else {
    print("kurang umur");
  }

  //perulangan
  for (int i = 1; i < 2; i++) {
    print(i);
  }

  //fungsi
  //contoh yang ada pengembalian nilai

  double nilaipi() {
    print("ini fungsi");
    return 3.14;
  }

  pi = nilaipi();
  nilaipi();
  //jika diassign dia dpt nilai dr return
  //jika dipanggil doang dia tetap lakuin isi fungsi tanpa ngasi pengembalian nilai
  //Unik !!

  //contoh yang tanpa pengembalian nilai

  void sapa() {
    print("halo");
  }

  sapa();
  
  //void berarti dia hanya ngerjain isi prosedur tanpa ada mengembalikan nilai (tanpa return)

  //fungsi juga bisa disimpan dalam suatu variabel

  final Function() suatufungsi = () {
    print("ayam");
  };

  Function suatuvariabel = suatufungsi;

  suatuvariabel();

  //fungsi berparameter

  String namaorang = "mada";
  void saya(String namaorang) {
    print("halo saya adam kamu $namaorang ya?");
  };

  saya(namaorang);

  //arrow function

  /*int ambilnilai() {
    return 20;
  }*/

  //bisa ditulis menjadi
  //int ambilnilai() => 20;

  //anonymous function biasanya ditaro dalam variabel
  (){print("a");};
  //list data penyimpan nilai
  final nilai = ["a","b"];
  final nim = [1,2,3,4];
  
  //atau bisa
  /*
  final List<String> nilai = ["a","b"];
  final List<int> nim = [1,2,3,4];
  */

  //untuk cari isinya aatau explore isinya bisa pake perulangan

  //contoh nilai indeks kedua
  for (int i = 0; i < 2; i++) {
    print(nilai[i]);
    print(nim[i]);
  }

  //length ini berarti sampai listnya habis ingat jangan sampai SAMA DENGAN nilai.length karena dia mengembalikan nilai jumlahnya bukan indeks aslinya (indeks mulai dr 0)
  for (int i = 0; i < nilai.length; i++) {
    print(nilai[i]);
    print(nilai.length);
  }

  //map data isinya key dan pasangan nilai

  //misal
  final contohmap = {
    "nim" : 10,
    "umur" : 20
  };
  /*
  final Map<String, int> contohmap = {
    "nim" : 10,
    "umur" : 20
  };

  <type1, type2>

  type1 = tipedata key
  type2 = tipedata data

  jika ingin nimnya jadi string kan gak bisa maka dia menjadi
  final Map<String, dynamic> contohmap = {
    "nim" : "10",
    "umur" : 20
  };

  */



  print(contohmap["nim"]);

  //beda dg list dia indeksnya bukan kek 1 2 3 bukan tapi sesuai dengan key datanya contohnya klo diatas yaitu "nama" dan "umur"
  //untuk memperlihatkan seluruh map

  print(contohmap.keys);
  //atau
  print(contohmap.values);

  //class blueprint untuk membuat sebuah object

  //karena class tidak bisa dalam fungsi maka lihat kurung kurawal dibawah void main

  //contoh akses class
  //sebelumnya deklarasi dulu
  final contohsiswa = siswa("adam", 11);
  print(contohsiswa.name);
  print(contohsiswa.age);
  contohsiswa.berjalan();
  //atau bisa dicombine jadi list

  final List<siswa> listsiswa = [
    siswa("a", 1),
    siswa("b",2)
  ];

  //print objek index pertama tapi yang agenya doang
  print(listsiswa[0].age);



}

class siswa {
  String name;
  int age;

  void berjalan() {
    print("object");
  }

  siswa(this.name, this.age);
  //untuk public/private asal masih dalam file yang sama masih bisa diakses

}
