//Write a Program to show swap of two No's without using third variable

import 'dart:io';

void main() {
  int? num1;
  int? num2;

  print("Enter Number 1:");
  num1 = int.parse(stdin.readLineSync()!);
  print("Enter Number 2:");
  num2 = int.parse(stdin.readLineSync()!);

  //Before Swapping
  print("Before Swapping");
  print("Number1 :$num1");
  print("Number2 :$num2");

  //Swapping Numbers
  num1 = num1 + num2;
  num2 = num1 - num2;
  num1 = num1 - num2;

  //After Swapping
  print("After Swapping:");
  print("Number1 :$num1");
  print("Number2 :$num2");
}
