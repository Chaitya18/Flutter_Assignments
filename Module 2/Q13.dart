//Write a program to find the Max number from the given three number using Nested If

import 'dart:io';

void main() {
  int num1;
  int num2;
  int num3;

  print("Enter First Number:");
  num1 = int.parse(stdin.readLineSync()!);
  print("Enter Second Number:");
  num2 = int.parse(stdin.readLineSync()!);
  print("Enter Third Number:");
  num3 = int.parse(stdin.readLineSync()!);

  if (num1 >= num2) {
    if (num1 >= num3) {
      print("$num1 is Greater");
    } else {
      print("$num3 is Greater");
    }
  } else {
    if (num2 >= num1) {
      if (num2 >= num3) {
        print("$num2 is Greater");
      } else {
        print("$num3 is Greater");
      }
    }
  }
}
