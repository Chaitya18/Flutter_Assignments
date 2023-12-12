/*Write a program you have to print the Fibonacci series up to user given
number
*/

import 'dart:io';

void main() {
  int n;
  print("Enter Range:");
  n = int.parse(stdin.readLineSync()!);
  print('Fibonacci Series:');
  for (int i = 0; i < n; i++) {
    print(fs(i));
  }
}

int fs(n) {
  if (n <= 1) {
    return n;
  }
  return fs(n - 1) + fs(n - 2);
}
