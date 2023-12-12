/*Display This Information using print
• Your Name
• Your Birth date
• Your Age
• Your Address
*/
import 'dart:io';

void main() {
  String? name;
  String? dob;
  int? age;
  String? address;

  print("Enetr Your Name:");
  name = stdin.readLineSync();
  print("Enter Your Date of birth:");
  dob = stdin.readLineSync();
  print("Enter Your Age:");
  age = int.parse(stdin.readLineSync()!);
  print("Enter Your Address:");
  address = stdin.readLineSync();

  print("Your Name:$name");
  print("Your Date Of Birth:$dob");
  print("Your Age:$age");
  print("Your Address:$address");
}
