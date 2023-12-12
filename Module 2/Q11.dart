//Write a Program to check the given year is leap year or not
import 'dart:io';

void main() {
  int year;

  print("Enter Year:");
  year = int.parse(stdin.readLineSync()!);
  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        print("It is a leap year.");
      } else {
        print("It is not a leap year.");
      }
    } else {
      print("It is a leap year.");
    }
  } else {
    print("It is not a leap year.");
  }
}
