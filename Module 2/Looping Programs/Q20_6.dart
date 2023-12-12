//Write a program you have to print the table of given number

import 'dart:io';

void main() {
  int num;
  int i;
  print("Enter Table number:");
  num = int.parse(stdin.readLineSync()!);
  print("\n");
  for (i = 1; i <= 10; i++) {
    print("$num * $i = ${num * i}");
  }
}
