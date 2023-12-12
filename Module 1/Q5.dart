//Write a program to find the Area of Triangle
import 'dart:io';

void main() {
  double? base;
  double? height;
  double? area;

  print("Enter Base:");
  base = double.parse(stdin.readLineSync()!);
  print("Enter Height:");
  height = double.parse(stdin.readLineSync()!);
  area = (0.5 * base * height);

  print("Area of Triangle:$area");
}
