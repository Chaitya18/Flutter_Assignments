/*Write a program user enter the 5 subjects mark. 
You have to make a total and find the percentage.
 percentage > 75 you have to print “Distinction”
  percentage > 60 and percentage <= 75 you have to
print “First class” percentage >50 and percentage <= 60
 you have to print “Second class” percentage > 35 and percentage <= 50
  you have to print “Pass class” Otherwise print “Fail” 
*/

import 'dart:io';

void main() {
  //Declaring Variables
  double? mathsm; //Maths Marks
  double? englishm; //English Marks
  double? sciencem; //Science Marks
  double? gujm; //Gujarati Marks
  double? hindim; //Hindi Marks
  double? totalm; //Total Marks
  double? percentage; //Percentage of Total marks

  //User Data Entry
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

  //Total and Percentage of marks
  totalm = (mathsm + englishm + sciencem + gujm + hindim);
  print("Total of all subjects out of 100 is $totalm");
  percentage = (totalm / 500) * 100;
  print("Percentage:$percentage");

  if (percentage > 75) {
    print("Distinction");
  } else if (percentage > 60 && percentage <= 75) {
    print("First Class");
  } else if (percentage > 50 && percentage <= 60) {
    print("Second Class");
  } else if (percentage > 35 && percentage <= 50) {
    print("Pass Class");
  } else {
    print("Fail");
  }
}
