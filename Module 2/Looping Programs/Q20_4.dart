//Write a program you have to find the factorial of given number.

import 'dart:io';

void main() {
  int i = 1;
  int num;
  int fact = 1;
  print("Enter Number:");
  num = int.parse(stdin.readLineSync()!);
  for (i = 1; i <= num; i++) {
    fact = fact * i;
  }
  print("Factorial of $num Numbers is $fact");
}
