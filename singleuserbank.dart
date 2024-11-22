import 'dart:io';

class total {
  int amount;
  total(this.amount);
}
void main(){
  total balance = total(0);
  void checkBalance(total balance) => print("Currently your balance is ${balance.amount} \$");
  void depositBalance(total balance, int deposit) => balance.amount += deposit;
  void withdrawBalance(total balance, int withdraw) {
    if (balance.amount - withdraw >= 0) {
      balance.amount -= withdraw;
    } else {
      print("Insufficient balance");
    }
  }
  final Function() divider = () => print("----------------------------------------");
  final Function() Menu = () {
    divider();
    print("Welcome to the bank application,\nPlease select the menu you want to use\n 1. Check balance\n 2. Deposit balance\n 3. Withdraw balance\n 0. Exit Program");
    divider();
    stdout.write("Choose menu: ");
  };
  final Function() endProgram = () => print("Thanks for using this app");

  Menu();
  String? switchMenu = stdin.readLineSync(); 
  while (switchMenu != "0") {
    if (switchMenu == "1") {
      checkBalance(balance);
      if (balance.amount == 0) {
        print("Try to deposit some balance to this account");
      }
      divider();
    } else if (switchMenu == "2") {
      stdout.write("Enter the amount you want to deposit: ");
      int deposit = int.parse(stdin.readLineSync()!);
      depositBalance(balance, deposit);
      divider();
    } else if (switchMenu == "3") {
      stdout.write("Enter the amount you want to withdraw: ");
      int withdraw = int.parse(stdin.readLineSync()!);
      withdrawBalance(balance, withdraw);
      divider();
    } else {
      final Function() switchMenuErr = () =>
        print("Please select a valid menu");
      ;
      switchMenuErr();
      divider();
    }
    Menu();
    switchMenu = stdin.readLineSync();
  }
  endProgram();
}