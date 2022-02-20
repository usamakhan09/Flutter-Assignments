import 'dart:io';
import 'productheader.dart';

void main(List<String> args) {
  List<Product> obj = [];
  List<Product> cart = [Usb('', 0, 0), Tshirt('', 0, 0), Realme('', 0, 0)];
  havinghelper help = havinghelper();

  obj.add(Usb('Kingstone', 800, 20));
  obj.add(Tshirt('TommyShirt', 1000, 100));
  obj.add(Realme('Realme9i', 90000, 5));

  while (true) {
    help.optionsdisplay(obj);
    print('Enter Your Choice');
    int choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      help.case1(obj, cart);
    } else if (choice == 2) {
      help.case2(obj, cart);
    } else if (choice == 3) {
      help.case3(obj, cart);
    } else {
      print('Wrong Input: ');
      break;
    }
    if (help.checkout()) {
      break;
    }
    print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  }
  help.yourOrder(cart);
}
