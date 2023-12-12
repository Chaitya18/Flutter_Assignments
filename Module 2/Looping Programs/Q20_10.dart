/*
Write a program you have to make a summation of first
 and last Digit. (E.g. 1234 ans:-5) 
*/
import 'dart:io';

void main() {
  int number;
  print("Enter a Number:");
  number = int.parse(stdin.readLineSync()!);
  int sum = sumOfFirstAndLastDigit(number);
  print('Number: $number');
  print('Sum of first and last digits: $sum');
}

int sumOfFirstAndLastDigit(int number) {
  bool isNegative = false;
  if (number < 0) {
    isNegative = true;
    number = -number;
  }
  int firstDigit = number;
  while (firstDigit >= 10) {
    firstDigit ~/= 10;
  }
  int lastDigit = number % 10;
  int sum = firstDigit + lastDigit;
  return isNegative ? -sum : sum;
}
