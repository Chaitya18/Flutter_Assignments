import 'dart:io';

void Pyramid(int n) {
  for (int i = 1; i <= n; i++) {
    String spaces = ' ' * (n - i);
    String stars = '*' * (2 * i - 1);
    print(spaces + stars);
  }
}

void main() {
  int rows;
  print("Enter Rows:");
  rows = int.parse(stdin.readLineSync()!);
  Pyramid(rows);
}
