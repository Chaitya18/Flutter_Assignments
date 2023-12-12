/*Write a Program of Addition, Subtraction ,Multiplication and Division
using Switch case.(Must Be Menu Driven)
*/

import 'dart:io';

void main() {
  double? num1;
  double? num2;
  double? addition;
  double? subtraction;
  double? multiplication;
  double? division;
  int? choice;

  //Fetching Data
  print("Enter First Number:");
  num1 = double.parse(stdin.readLineSync()!);
  print("Enter Second Number:");
  num2 = double.parse(stdin.readLineSync()!);

  //Fetching Choice Of Operation
  print(" 1.Addition \n 2.Subtraction \n 3.Multiplication \n 4.Division");
  print("Enter Your Chocie:");
  choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      {
        addition = num1 + num2;
        print("Addition is $addition");
        break;
      }
    case 2:
      {
        subtraction = num1 - num2;
        print("Subtraction is $subtraction");
        break;
      }
    case 3:
      {
        multiplication = num1 * num2;
        print("Multiplication is $multiplication");
        break;
      }
    case 4:
      {
        division = num1 / num2;
        print("Division is $division");
        break;
      }
    default:
      {
        print("Invalid Choice");
      }
  }
}
