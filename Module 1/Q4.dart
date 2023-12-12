//Write a program to find the Area of Circle
import 'dart:io';

void main() {
  double? radius;
  double? area;

  print("Enter Radius:");
  radius = double.parse(stdin.readLineSync()!);
  area = (3.14 * radius * radius);
  print("Area of a circle is:$area");
}
