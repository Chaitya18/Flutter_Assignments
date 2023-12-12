import 'dart:io';

void RangleRside(int n) {
  for (int i = 1; i <= n; i++) {
    String spaces = ' ' * (n - i);
    String row = '';
    for (int j = i; j >= 1; j--) {
      row += '$j ';
    }
    print(spaces + row);
  }
}

void main() {
  int rows;
  print("Enter Rows:");
  rows = int.parse(stdin.readLineSync()!);
  RangleRside(rows);
}
