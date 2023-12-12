//Write Program use switch statement. Display Monday to Sunday

import 'dart:io';

void main() {
  int? choice;

  print(" 1.Monday \n 2.Tuesday \n 3.Wednesday \n 4.Thursday"
      "\n 5.Friday \n 6.Saturday \n 7.Sunday");
  print("Enter Your Choice From 1-7:");
  choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      {
        print("Mondya");
        break;
      }
    case 2:
      {
        print("Tueday");
        break;
      }
    case 3:
      {
        print("Wednesday");
        break;
      }
    case 4:
      {
        print("Thursday");
        break;
      }
    case 5:
      {
        print("Friday");
        break;
      }
    case 6:
      {
        print("Saturday");
        break;
      }
    case 7:
      {
        print("Sunday");
        break;
      }
    default:
      {
        print("Invalid Chocie");
      }
  }
}
