//Write a program to calculate sum of 5 subjects & find the percentage. Subject marks entered by user

import 'dart:io';

void main() {
  double? mathsm; //Maths Marks
  double? englishm; //English Marks
  double? sciencem; //Science Marks
  double? gujm; //Gujarati Marks
  double? hindim; //Hindi Marks
  double? totalm; //Total Marks
  double? percentage; //Percentage of Total marks

  print("Enter Maths Marks:");
  mathsm = double.parse(stdin.readLineSync()!);
  print("Enter English Marks:");
  englishm = double.parse(stdin.readLineSync()!);
  print("Enter Science Marks:");
  sciencem = double.parse(stdin.readLineSync()!);
  print("Enter Gujarati Marks:");
  gujm = double.parse(stdin.readLineSync()!);
  print("Enter Hindi Marks:");
  hindim = double.parse(stdin.readLineSync()!);

  totalm = (mathsm + englishm + sciencem + gujm + hindim);
  print("Total of all subjects out of 100 is $totalm");
  percentage = (totalm / 500) * 100;
  print("Percentage:$percentage");
}
