elaskan alur bagaimana state digunakan yang terdiri dari 
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