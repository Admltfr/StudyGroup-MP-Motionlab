import 'dart:io';

class total {
  int amount;

  //tiga fungsi utama, cek, deposit, penarikan saldo

  void checkBalance(total balance) {
    print("Currently your balance is ${balance.amount} \$");
    if (balance.amount == 0) {
      print("Try to deposit some balance to this account");
    }
  }

  void depositBalance(total balance, int deposit) => balance.amount += deposit;
  void withdrawBalance(total balance, int withdraw) {
    if (balance.amount - withdraw >= 0) {
      balance.amount -= withdraw;
    } else {
      print("Insufficient balance");
    }
  }

  total(this.amount);
}

void main() {
  //deklarasi variabel dari class
  total balance = new total(0);

  //tiga fungsi print divider, menu, pesan akhir program dan pesan error saat memasukkan opsi menu yang salah
  final Function() divider =
      () => print("----------------------------------------");
  final Function() Menu = () {
    divider();
    print(
        "Welcome to the bank application,\nPlease select the menu you want to use\n 1. Check balance\n 2. Deposit balance\n 3. Withdraw balance\n 0. Exit Program");
    divider();
    stdout.write("Choose menu: ");
  };
  final Function() endProgram = () => print("Thanks for using this app");

  //fungsi yang akan mengembalikan opsi yang valid (jika tidak, user akan diminta untuk memasukkan opsi yang benar)
  String optionValidator(List<String> optionList, String? options) {
    while (!optionList.contains(options)) {
      stdout.write("Please enter a valid option $optionList : ");
      options = stdin.readLineSync();
    }
    divider();
    return options!;
  }

  //algoritma perulangan untuk menggunakan cek saldo, deposit saldo dan penarikan saldo

  Menu();
  String? switchMenu = stdin.readLineSync();
  //masukan user akan di validasi, jika tidak user akan terus diminta untuk memasukkan opsi yang benar
  switchMenu = optionValidator(["0", "1", "2", "3"], switchMenu);
  while (switchMenu != "0") {
    if (switchMenu == "1") {
      /*jika opsi yang dipilih 1 maka sistem akan mengeksekusi fungsi cek saldo
         jika saldo jumlahnya 0 akan memunculkan pesan saran untuk melakukan deposit*/
      balance.checkBalance(balance);
      divider();
    } else if (switchMenu == "2") {
      //jika opsi yang dipilih 2 maka sistem akan meminta user memasukkan jumlah deposit dan mengeksekusi fungsi deposit saldo
      int deposit = int.parse(stdin.readLineSync()!);
      balance.depositBalance(balance, deposit);
      divider();
    } else if (switchMenu == "3") {
      /*jika opsi yang dipilih 3 maka sistem akan meminta user memasukkan jumlah penarikan dan mengeksekusi fungsi penarikan saldo, 
        jika  tidak cukup akan muncul pesan saldo tidak cukup*/
      stdout.write("Enter the amount you want to withdraw: ");
      int withdraw = int.parse(stdin.readLineSync()!);
      balance.withdrawBalance(balance, withdraw);
      divider();
    }
    //mengulang proses awal
    Menu();
    switchMenu = stdin.readLineSync();
    switchMenu = optionValidator(["0", "1", "2", "3"], switchMenu);
  }
  //menampilkan pesan penutup
  endProgram();
}
