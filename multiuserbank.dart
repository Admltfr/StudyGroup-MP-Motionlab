import 'dart:io';

void main() {
  //Map user beserta balance (karena map memiliki fitur pass by reference dan dapat menyimpan data lebih dari 1)
  Map<String, int> balance = {"Adam": 0, "Lutfi": 0, "Ramadhan": 0};

  //divider sebagai border tiap menu
  final Function() divider =
      () => print("----------------------------------------");

  //Menu untuk menampilkan menu
  final Function() Menu = () {
    divider();
    print(
        "Welcome to the bank application, \nPlease select the menu you want to use\n 1. Check balance\n 2. Deposit balance\n 3. Withdraw balance\n 0. Exit Program");
    divider();
    stdout.write("Choose menu: ");
  };

  //endprogram untuk pesan setelah selesai menggunakan program
  final Function() endProgram = () => print("Thanks for using this app");

  void checkBalance(Map<String, int> balance, String user) {
    //fungsi untuk cek saldo user key tertentu, menampilkan peringatan jika tidak ada user key pada data map
    if (balance.containsKey(user)) {
      print("Currently your balance is ${balance[user]} \$");
    } else {
      print("That user does not exist");
    }
    if (balance[user] == 0) {
      print("Try to deposit some balance to this account");
    }
    divider();
  }

  void depositBalance(Map<String, int> balance, String user, int deposit) {
    //fungsi untuk deposit saldo user key tertentu, menampilkan peringatan jika tidak ada user key pada data map
    if (balance.containsKey(user)) {
      balance[user] = balance[user]! + deposit;
    } else {
      print("That user does not exist");
    }
    divider();
  }

  void withdrawBalance(Map<String, int> balance, String user, int withdraw) {
    /*fungsi untuk penarikan saldo user key tertentu, menampilkan peringatan jika saldo tidak cukup, 
      dan menampilkan peringatan jika tidak ada user key pada data map*/
    if (balance.containsKey(user)) {
      if (balance[user]! - withdraw >= 0) {
        balance[user] = balance[user]! - withdraw;
      } else {
        print("Insufficient balance");
      }
    } else {
      print("That user does not exist");
    }
    divider();
  }

  String userValidator(String? user) {
    /*fungsi digunakan untuk memvalidasi keberadaan data user pada map dan mengembalikan nilainya, 
      jika tidak ada pengguna akan diperintahkan untuk memasukkan user key yang benar*/
    while (!balance.containsKey(user)) {
      print(
          "That user does not exist, please try another user account ${balance.keys}");
      divider();
      stdout.write("Enter Username: ");
      user = stdin.readLineSync();
    }
    divider();
    return user!;
  }

  String optionValidator(List<String> optionList, String? options) {
    /*fungsi digunakan untuk memvalidasi keberadaan opsi yang dimasukkan pengguna dan mengembalikan nilainya, 
      jika tidak ada pengguna akan diperintahkan untuk memasukkan opsi yang benar*/
    while (!optionList.contains(options)) {
      stdout.write("Please enter a valid option $optionList : ");
      options = stdin.readLineSync();
    }
    divider();
    return options!;
  }

  //deklarasi variabel penggantian user
  String? switchUser;

  //asumsi jika tidak mengganti akun, program akan berhenti ibaratnya "terlogout"
  while (switchUser != "N") {
    //pengguna memasukkan user key dari data map
    stdout.write("Enter Username: ");
    String? user = stdin.readLineSync();
    //masukan user key dari pengguna akan divalidasi
    user = userValidator(user);
    //menampilkan menu
    Menu();
    //user diminta untuk memasukkan opsi menu, sekaligus akan divalidasi opsinya
    String? switchMenu = stdin.readLineSync();
    switchMenu = optionValidator(["1", "2", "3", "0"], switchMenu);
    //perulangan untuk proses utama
    while (switchMenu != "0") {
      if (switchMenu == "1") {
        /*jika opsi yang dipilih 1 maka sistem akan mengeksekusi fungsi cek saldo
         jika saldo jumlahnya 0 akan memunculkan pesan saran untuk melakukan deposit*/
        checkBalance(balance, user);
      } else if (switchMenu == "2") {
        //jika opsi yang dipilih 2 maka sistem akan meminta user memasukkan jumlah deposit dan mengeksekusi fungsi deposit saldo
        stdout.write("Enter the amount you want to deposit: ");
        int deposit = int.parse(stdin.readLineSync()!);
        depositBalance(balance, user, deposit);
      } else if (switchMenu == "3") {
        /*jika opsi yang dipilih 3 maka sistem akan meminta user memasukkan jumlah penarikan dan mengeksekusi fungsi penarikan saldo, 
        jika  tidak cukup akan muncul pesan saldo tidak cukup*/
        stdout.write("Enter the amount you want to withdraw: ");
        int withdraw = int.parse(stdin.readLineSync()!);
        withdrawBalance(balance, user, withdraw);
      }
      //menampilkan menu
      Menu();
      //
      switchMenu = stdin.readLineSync();
      switchMenu = optionValidator(["1", "2", "3", "0"], switchMenu);
    }
    //user diminta untuk memasukkan opsi ganti user atau keluar program, sekaligus akan divalidasi opsinya
    stdout.write("Switch account/Quit app [Y/N] : ");
    switchUser = stdin.readLineSync();
    switchUser = optionValidator(["Y", "N"], switchUser);
  }
  //menampilkan kata kata penutup
  endProgram();
}
