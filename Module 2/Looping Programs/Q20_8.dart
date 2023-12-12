/*Write a program to find out the max from given number 
(E.g. No: -1562 Max number is 6
*/

import 'dart:io';

void main() {
  int number;

  print("Enter a Number:");
  number = int.parse(stdin.readLineSync()!);
  // Finding the maximum digit
  int maxDigit = findMaxDigit(number);
  // Printing the maximum digit
  print('Number: $number');
  print('Max number is: $maxDigit');
}

int findMaxDigit(int number) {
  // Handling negative numbers
  number = number.abs();
  if (number == 0) {
    return 0;
  }
  int maxDigit = 0;
  while (number > 0) {
    int digit = number % 10;
    if (digit > maxDigit) {
      maxDigit = digit;
    }
    number ~/= 10;
  }

  return maxDigit;
}
