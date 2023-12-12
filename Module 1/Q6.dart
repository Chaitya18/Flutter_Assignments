//Write a program to find the simple Interest
import 'dart:io';

void main() {
  double? pamount;
  double? rinterest;
  double? time;
  double? si;
  double? tamount;
  print("Enter Principal Amount:");
  pamount = double.parse(stdin.readLineSync()!);
  print("Enter Rate Of Interest:");
  rinterest = double.parse(stdin.readLineSync()!);
  print("Enter Time Period(In Years):");
  time = double.parse(stdin.readLineSync()!);

  si = (pamount * rinterest * time) / 100;
  tamount = si + pamount;
  print("Principal Amount:$pamount");
  print("Rate of Interest:$rinterest");
  print("Time Period(In Years):$time");
  print("Simpe Interest:$si");
  print("Total Amount:$tamount");
}
