/*Write a program of to find out the Area of Triangle, Rectangle
and Circle using If Condition.(Must Be Menu Driven)
*/

import 'dart:io';

void main() {
  double? radius;
  double? breadth;
  double? height;
  double? length;
  double? width;
  double? atriangle; //Area of Triangle
  double? arectangle; //Area of Rectangle
  double? acircle; //Area of Circle
  int? choice;

  print(" 1.Area of Triangle \n 2.Area of Rectangle \n 3.Area of Circle");
  print("Enter Your Choice:");
  choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    print("Enter Breadth:");
    breadth = double.parse(stdin.readLineSync()!);
    print("Enter Height:");
    height = double.parse(stdin.readLineSync()!);
    atriangle = (0.5 * breadth * height);
    print("Area of Triangle is $atriangle");
  } else if (choice == 2) {
    print("Enter Length:");
    length = double.parse(stdin.readLineSync()!);
    print("Enter Width:");
    width = double.parse(stdin.readLineSync()!);
    arectangle = (length * width);
    print("Area of Rectangle is $arectangle");
  } else if (choice == 3) {
    print("Enter Radius:");
    radius = double.parse(stdin.readLineSync()!);
    acircle = (3.14 * radius * radius);
    print("Area of Circle is $acircle");
  } else {
    print("Invalid Choice");
  }
}
