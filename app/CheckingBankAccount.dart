// FILE NAME:   CHECKINGBANKACCOUNT.DART
// AUTHOR:      RYAN LEMOLE
// DATE:        5/16/2025

import 'BankAccount.dart';

// SUBCLASS OF BANKACCOUNT
class CheckingBankAccount extends BankAccount{
  //initialize a $0.00 balance in the account
  double balance = 0;

  //getter to return account balance as a double for arithmetic
  @override
  double get_balance() => balance;

  // Parameter: BankAccount account - current bank account selection
  // Action: Print out the balance of the current bank account in command line
  @override
  void check_balance(BankAccount account) {print(balance);}

  // Parameter: double amount - user input from stdio deposit will be performed with
  // Action: add the amount parameter from current balance in account
  @override
  void deposit_funds(double amount) {balance += amount;}

  // Parameter: double amount - user input from stdio withdraw will be performed with
  // Action: subtract the amount parameter from current balance in account
  @override
  void withdraw_funds(double amount) {balance -= amount;}
}