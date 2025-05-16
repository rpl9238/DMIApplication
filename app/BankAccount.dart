// FILE NAME:   BANKACCOUNT.DART
// AUTHOR:      RYAN LEMOLE
// DATE:        5/16/2025

// SUPERCLASS FOR CHECKING AND SAVINGS ACCOUNTS
abstract class BankAccount{

  // All BankAccounts can have an amount deposited
  void deposit_funds(double amount);

  // All BankAccounts can have an amount withdrawn
  void withdraw_funds(double amount);

  // All BankAccounts can have their balance checked
  void check_balance(BankAccount account);

  // All BankAccounts can have their balance returned in order to perform actions
  // Returns: balance of the account as a double
  double get_balance();
}