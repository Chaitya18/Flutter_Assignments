//Right Angle * pattern
import 'dart:io';

void Rpattern(int n) {
  for (int i = 1; i <= n; i++) {
    String stars = '*' * i;
    print(stars);
  }
}

void main() {
  int rows;
  print("Enter Rows:");
  rows = int.parse(stdin.readLineSync()!);
  Rpattern(rows);
}
