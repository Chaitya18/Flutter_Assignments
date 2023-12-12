//Write a program to convert temperature from degree centigrade to Fahrenheit

import 'dart:io';

void main() {
  double? celcius;
  double? answer;

  print("Enter Celcius:");
  celcius = double.parse(stdin.readLineSync()!);

  answer = ((celcius * 9) / 5) + 32;
  print("$celcius celcius To Fahrenheit is  $answer");
}
