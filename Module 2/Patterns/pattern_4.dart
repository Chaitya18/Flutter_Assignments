import 'dart:io';

void RangleRsidenum(int n) {
  for (int i = 1; i <= n; i++) {
    String spaces = ' ' * (n - i);
    String stars = '*' * i;
    print(spaces + stars);
  }
}

void main() {
  int rows;
  print("Enter Rows:");
  rows = int.parse(stdin.readLineSync()!);
  RangleRsidenum(rows);
}
