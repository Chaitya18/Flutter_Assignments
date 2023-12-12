//Write a program to print the number in reverse order

import 'dart:io';

void main() {
  print('Enter a number:');
  String num = stdin.readLineSync()!;
  print("Entered Number: $num");
  String rnum = num.split('').reversed.join();
  print('Reversed Number: $rnum');
}
