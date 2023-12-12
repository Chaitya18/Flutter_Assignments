import 'dart:io';

void Rpatternnum(int n) {
  for (int i = 1; i <= n; i++) {
    String row = '';
    for (int j = 1; j <= i; j++) {
      row += '$j ';
    }
    print(row);
  }
}

void main() {
  int rows;
  print("Enter Rows:");
  rows = int.parse(stdin.readLineSync()!);
  Rpatternnum(rows);
}
