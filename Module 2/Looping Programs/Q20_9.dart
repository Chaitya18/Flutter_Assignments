/*
Write a program make a summation of given number
(E.g. 1523 ans :-11)
 */

import 'dart:io';

void main() {
  int number;

  print("Enter a Number:");
  number = int.parse(stdin.readLineSync()!);

  int sum = calculateSumOfDigits(number);

  // Printing the sum
  print('Number: $number');
  print('Sum of digits: $sum');
}

int calculateSumOfDigits(int number) {
  // Handling negative numbers
  bool isNegative = false;
  if (number < 0) {
    isNegative = true;
    number = -number;
  }

  int sum = 0;

  // Calculating the sum of digits
  while (number > 0) {
    int digit = number % 10;
    sum += digit;
    number ~/= 10;
  }

  return isNegative ? -sum : sum;
}
