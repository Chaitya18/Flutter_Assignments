void printPattern() {
  String pattern = '';
  for (int i = 1; i <= 15; i++) {
    pattern += (i % 2 == 0) ? '0 ' : '1 ';
  }
  print(pattern.trim());
}

void main() {
  printPattern();
}
