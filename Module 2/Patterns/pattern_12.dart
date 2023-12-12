void printRightAnglePattern() {
  List<int> numbers = [1, 4, 4, 9, 9, 9, 16, 16, 16, 16, 25, 25, 25, 25, 25];
  for (int i = 0; i < numbers.length; i++) {
    String row = '';
    for (int j = 0; j <= i; j++) {
      row += '${numbers[i]} ';
    }
    print(row);
  }
}

void main() {
  printRightAnglePattern();
}
