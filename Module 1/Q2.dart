//Write a program to make addition, Subtraction, Multiplication and Division of Two Numbers

import 'dart:io';

void main() {
  double? num1;
  double? num2;
  double? addition;
  double? subtraction;
  double? multiplication;
  double? division;

  print("Enter Numer 1:");
  num1 = double.parse(stdin.readLineSync()!);
  print("Enter Numer 2:");
  num2 = double.parse(stdin.readLineSync()!);

  addition = num1 + num2;
  print("Addition:$addition");

  subtraction = num1 - num2;
  print("Subtraction:$subtraction");

  multiplication = num1 * num2;
  print("Multiplication:$multiplication");

  division = num1 / num2;
  print("Division:$division");
}
