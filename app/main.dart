// FILE NAME:   MAIN.DART
// AUTHOR:      RYAN LEMOLE
// DATE:        5/13/2025
// DESCRIPTION: TO DEMONSTRATE OBJECT ORIENTED PROGRAMMING
//              PRINCIPLES (ENCAPSULATION, ABSTRACTION,
//              POLYMORPHISM, AND INHERITANCE) WITH THE USE
//              OF A SIMPLE BANK ACCT

/*superclass and subclass imports, standard io imports, async imports*/
import 'dart:io';
import 'dart:async';
import 'BankAccount.dart';
import 'CheckingBankAccount.dart';
import 'SavingsBankAccount.dart';

void main() async{
  /*declaring bank account variables with default values*/
  BankAccount account1 = new SavingsBankAccount();                              // Superclass BankAccount, subclass SavingsBankAccount
  BankAccount account2 = new CheckingBankAccount();                             // Superclass BankAccount, subclass CheckingBankAccount

while(true) {                                                                   // Always active loop to prompt account selection until 'exit' is input in command line
    print('Welcome! Please select an account (1) savings, (2) checking');       // show user the program has started
    String accountNumber = stdin.readLineSync()!.toLowerCase();                 // prompt user to input account number string
    if (accountNumber == 'exit') {                                              // terminate program if the user inputs 'exit'
      print('Thank you for using our banking system. Goodbye!');                // indicate that program is terminating
      break;
    }
  if (accountNumber == "1") {                                                   // User input reads Account 1
      while(true){                                                              // Always active loop to prompt account 1 actions until 'exit' is input in command line
        print('What would you like to do? '
            '(deposit, withdraw, check balance, exit):');
        String action = stdin.readLineSync().toString().toLowerCase();          // prompt user to input action string
        if (action == "deposit") {                                              // in case 'deposit' is input by user
          print('How much would you like to ${action} in this account?:');
          double amount = double.parse(stdin.readLineSync()!);                  // prompt user to input the amount they want to perform the action on
          account1.deposit_funds(amount);                                       // call deposit_funds() from SavingsBankAccount class to add user input amount to account1
          print("deposit of \$${amount.toStringAsFixed(2)} successful");        // show the user in command line that the action was successful
        }
        else if (action == "withdraw") {                                        // in case 'withdraw' is input by user
          print('How much would you like to ${action} from this account?:');
          double amount = double.parse(stdin.readLineSync()!);                  // prompt user to input amount string
          if (amount <= account1.get_balance()) {                               // condition to make sure account doesn't get overdrafted
            account1.withdraw_funds(amount);                                    // if the withdrawal amount meets above condition,
            print("withdrawal of \$${amount.toStringAsFixed(2)} successful");   // show the user in command line that the action was successful
          }
          else {                                                                // user is trying to overdraft account, action cannot be performed
            print("ACCOUNT HAS INSUFFICIENT FUNDS, TRY AGAIN");                 //
            await Future.delayed(Duration(milliseconds: 1000));                 //
          }
        }
        else if (action == "check balance") {                                   // in case 'check balance' is input by user
          print('Current Balance of Account 1 is \$' + account1.get_balance()
              .toStringAsFixed(2));                                             // format string to 2 decimal points and call get_balance() on SavingsBankAccount object
        }
        else if (action == "exit"){                                             // in case 'exit' is input by user
          break;                                                                // break out of action loop to the account selection
        }
        else {                                                                  // in case an invalid action is input by user
          print("INVALID ACTION, PLEASE TRY AGAIN");                            // alert the user
          await Future.delayed(Duration(milliseconds: 1000));                   // add a 1 second delay until next action prompt
        }
      }
    }
    // User input reads Account 2
    else if (accountNumber == "2") {
      while(true){                                                              // Always active loop to prompt account 1 actions until 'exit' is input in command line
        print('What would you like to do? '
            '(deposit, withdraw, check balance, exit):');
        String action = stdin.readLineSync()!.toLowerCase();                    // prompt user to input action string
        if (action == "deposit") {                                              // in case 'deposit' is input by user
          print('How much would you like to ${action} in this account?:');
          double amount = double.parse(stdin.readLineSync()!);                  // prompt user to input the amount they want to perform the action on
          account2.deposit_funds(amount);                                       // call deposit_funds() from CheckingBankAccount class to add user input amount to account2
          print("deposit of \$${amount.toStringAsFixed(2)} successful");        // show the user in command line that the action was successful
        }
        else if (action == "withdraw") {                                        // in case 'withdraw' is input by user
          print('How much would you like to ${action} from this account?:');
          double amount = double.parse(stdin.readLineSync()!);                  // prompt user to input amount string
          if (amount <= account2.get_balance()) {                               // condition to make sure account doesn't get overdrafted
            account2.withdraw_funds(amount);                                    //
            print("withdrawal of \$${amount.toStringAsFixed(2)} successful");   // show the user in command line that the action was successful
          }
          else {                                                                // user is trying to overdraft account, action cannot be performed
            print("ACCOUNT HAS INSUFFICIENT FUNDS, TRY AGAIN");                 // alert the user
            await Future.delayed(Duration(milliseconds: 1000));                 // add a 1 second delay until next action prompt
          }
        }
        else if (action == "check balance") {                                   // in case 'check balance' is input by user
          print('Current Balance of Account 2 is \$' + account2.get_balance()
              .toStringAsFixed(2));                                             // format string to 2 decimal points and call get_balance() on SavingsBankAccount object
        }
        else if (action == "exit"){                                             // in case 'exit' is input by user
          break;                                                                // break out of this loop to the account selection outer loop
        }
        else {                                                                  // in case any invalid string is input by user
          print("INVALID ACTION, PLEASE TRY AGAIN");                            // alert the user
          await Future.delayed(Duration(milliseconds: 1000));                   // add a 1 second delay until next action prompt
        }
      }
    }
    else{                                                                       // in case 'exit' is input by user
      print("ACCOUNT NOT FOUND, PLEASE ENTER A VALID ACCOUNT NUMBER");          // alert the user
      await Future.delayed(Duration(milliseconds: 1000));                       // add a 1 second delay until next action prompt
    }
  }
}