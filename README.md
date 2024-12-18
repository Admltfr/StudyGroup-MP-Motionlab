## Daftar Isi 
- [State](#state-management) 
	- [Stateless Widget](#stateless-widget) 
	- [Stateful Widget](#stateful-widget) 
- [State Management](#state-management) 
  -  [MVC](#mvc)
  -  [Inherited Widget](#inherited-widget) 
  -  [GetX](#getx)
- [Shortcut](#shortcut) Penting!


## State
- **State** merupakan suatu kondisi sesuatu pada waktu tertentu atau saat diberi aksi tertentu, bisa dibilang ini state adalah keadaan suatu hal.
- Dalam flutter sendiri state tentu merupakan hal yang penting karena state merupakan hal utama yang dapat membuat suatu aplikasi menjadi interaktif dan dapat digunakan dengan baik.
- State dalam flutter terbagi menjadi 2 yaitu stateless widget dan stateful widget

### Stateless Widget
- **Stateless widget** adalah widget yang tidak memiliki kemampuan untuk merubah statenya
Berikut merupakan salah satu inisialisasi paling umum dari stataless widget :
```dart
class  MyWidget  extends  StatelessWidget {
	const  MyWidget({super.key});
	@override
	Widget  build(BuildContext  context) {
		return  Scaffold();
	}
}
```
- Stateless widget biasanya digunakan pada tampilan/interface yang tidak memerlukan perubahan state

### Stateful Widget
- **Stateless widget** adalah widget yang memiliki kemampuan untuk merubah statenya hingga memiliki suatu fitur khusus untuk bisa mengubah state yang ada pada widget
Berikut merupakan salah satu inisialisasi paling umum dari stateful widget :
```dart
class  MyWidget  extends  StatefulWidget {
	const  MyWidget({super.key});
	@override
	State<MyWidget> createState() =>  _MyWidgetState();
}

class  _MyWidgetState  extends  State<MyWidget> {
	@override
	Widget  build(BuildContext  context) {
		return  Scaffold();
	}
}
```
- Seperti yang terlihat perbedaannya dari stateless widget, disini stateful widget memiliki method createstate yang diimplementasikan pada _MyWidgetState() 
- Stateful widget biasanya digunakan pada tampilan/interface yang memerlukan perubahan state, dan mengutamakan interaktifitas yang biasanya menggunakan setState()
- Sangat disarankan memakai Stateless widget untuk widget yang tidak memerlukan perubahan state karena stateful widget dapat mempengaruhi performa aplikasi

## State Management
- **State management** adalah sistem pengelolaan state dalam suatu aplikasi
- Peruntukan state ada 2 yaitu 
   - Shared State
      - Yaitu state yang diperuntukkan widget yang memakainya dengan sistem shared hingga memberikan seluruh widget yang menggunakannya state yang sama, biasanya digunakan untuk widget yang mengharuskan widget lainnya memiliki perubahan state yang sama.
   - Ephemeral State 
      - Yaitu state yang diperuntukkan widget yang memakainya dengan sistem individual hingga tiap widget yang menggunakannya memiliki pemakaian state yang berbeda satu sama lain, biasanya digunakan untuk widget yang memiliki sifat state yang khusus/tidak berkorelasi dengan perubahan widget lain yang memiliki penggunaan yang serupa.

### MVC
- MVC merupakan konsep penting dalam state management karena menjelaskan alur bagaimana state digunakan yang terdiri dari 
	- Controller
	  - Yaitu bagian yang memanipulasi model dan mengubah view
    - Model
	  - Yaitu bagian yang berisikan logika dan aturan aturan dari suatu aplikasi
   - View
	  - Yaitu bagian yang mentranslasikan model menjadi suatu tampilan/interface
- Berikut merupakan alur kerja MVC :
	-  **User** berinteraksi dengan tampilan (View), misalnya menekan tombol atau memasukkan teks.
	- **Controller** menerima input dari View dan memutuskan tindakan apa yang harus dilakukan.
	- **Controller** meminta data ke **Model** atau memperbarui data pada Model.
	-  **Model** mengirimkan data yang sudah diubah/diambil ke Controller.
	-  **Controller** memperbarui **View** dengan data terbaru dari Model.
### Inherited Widget
- Merupakan sistem pewarisan state widget parent ke suatu widget child hingga statenya dapat digunakan, atau bisa dibilang inherited widget ini merupakan penyedia data state dari parent ke childnya.
- Namun dalam implementasinya inherited widget terbilang rumit terutama untuk pemula serta kurang fleksibel, hingga untuk mempermudahnya, digunakan package GetX
### GetX
- GetX merupakan suatu package yang sangat powerful yang bekerja layaknya sihir (Hiperbola).
- Dokumentasi GetX dapat dilihat pada tautan berikut (https://github.com/jonataslaw/getx/blob/master/README.id-ID.md)
- Fitur yang ditawarkan GetX sangat banyak seperti pengaturan state yang fleksibel dan lebih efisien, serta navigasi yang lebih simple dan masih banyak lagi fiturnya

