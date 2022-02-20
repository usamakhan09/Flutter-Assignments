import 'dart:io';

abstract class Product {
  String _name = '';
  int _stockQuantity = 0;
  int _price = 0;
  Product(this._name, this._price, this._stockQuantity);
  set updatestockQuantity(int Quantity) {
    this._stockQuantity = Quantity;
  }

  set updatePrice(int P) {
    this._price = P;
  }

  set updatename(String myname) {
    this._name = myname;
  }

  int get stockQuantity => _stockQuantity;
  String get name => _name;
  int get price => _price;
}

class Usb extends Product {
  Usb(String name, int price, int stockQuantity)
      : super(name, price, stockQuantity);
}

class Tshirt extends Product {
  Tshirt(String name, int price, int stockQuantity)
      : super(name, price, stockQuantity);
}

class Realme extends Product {
  Realme(String name, int price, int stockQuantity)
      : super(name, price, stockQuantity);
}

class havinghelper {
  void optionsdisplay(dynamic obj) {
    int i = 0;
    for (var product in obj) {
      print("Press ${++i} to select ${product.name} ");
    }
    print('Press 0 for Exit');
  }

  void case1(dynamic obj, dynamic cart) {
    print('Enter the Quantity Of Kingston Usb');
    int qty = int.parse(stdin.readLineSync()!);
    if (obj[0].name == 'Kingstone') {
      //  print('QTY= ${item.stockQuantity}');
      if (qty <= obj[0].stockQuantity) {
        int hold = obj[0].stockQuantity;
        hold = hold - qty;
        obj[0].updatestockQuantity = hold;
        cart.add(Usb(obj[0].name, obj[0].price, qty));
        print('Product Added In Cart');
      } else {
        print('Sorry:pobj[1].t is out of Stock!');
      }
    }
  }

  bool checkout() {
    print('Do you want to CheckOut!Yes or No(Y/N) ');
    String choice = stdin.readLineSync()!;
    if (choice == 'y' || choice == 'Y') {
      return true;
    } else {
      return false;
    }
  }

  void case2(dynamic obj, dynamic cart) {
    print('Enter the Quantity Of Tommy Shirts ');
    int qty = int.parse(stdin.readLineSync()!);
    if (obj[1].name == 'TommyShirt') {
      //  print('QTY= ${item.stockQuantity}');
      if (qty <= obj[1].stockQuantity) {
        int hold = obj[1].stockQuantity;
        hold = hold - qty;
        obj[1].updatestockQuantity = hold;
        cart.add(Tshirt(obj[1].name, obj[1].price, qty));
        print('Product Added In Cart');
      } else {
        print('Sorry:product is out of Stock!');
      }
    }
  }

  void case3(dynamic obj, dynamic cart) {
    print('Enter the Quantity Of Realmi9i mobile: ');
    int qty = int.parse(stdin.readLineSync()!);
    if (obj[2].name == 'Realme9i') {
      //  print('QTY= ${item.stockQuantity}');
      if (qty <= obj[2].stockQuantity) {
        int hold = obj[2].stockQuantity;
        hold = hold - qty;
        obj[2].updatestockQuantity = hold;
        cart.add(Realme(obj[2].name, obj[2].price, qty));
        print('Product Added In Cart');
      } else {
        print('Sorry:product is out of Stock!');
      }
    }
  }

  void yourOrder(dynamic order) {
    List<int> total = [0, 0, 0];
    int i = 0;
    print("===============Order================\n");
    for (var item in order) {
      if (item.stockQuantity > 0) {
        total[i] = total[i] + (item.price * item.stockQuantity) as int;
        print(
            "${item.stockQuantity} X ${item.name} : Total ${item.price * item.stockQuantity}");
      }
    }
    print('Your Total Bill = ${total[0] + total[1] + total[2]}');
    print('=====================================');
  }
}
