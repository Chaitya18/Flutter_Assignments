void printNumberPattern(int n) {
  for (int i = 1; i <= n; i++) {
    String row = '';
    for (int j = 1; j <= i; j++) {
      row += '$i';
    }
    print(row);
  }
}

void main() {
  int height = 5; // Adjust the height of the pattern here
  printNumberPattern(height);
}
