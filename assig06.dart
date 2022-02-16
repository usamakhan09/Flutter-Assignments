import 'dart:io';

class Contact {
  String name = "";
  String phno = "";
  String email = "";
  String dateOfBirth = "";

  bool checkinf() {
    if (this.name.isEmpty || this.email.isEmpty || this.dateOfBirth.isEmpty) {
      return false;
    }
    return true;
  }

  void enterDetails() {
    String nam = "";
    String ph = "";
    String mail = "";
    String DOB = "";

    print("Enter Your Name: ");
    nam = stdin.readLineSync()!;
    print("Enter Your Phone Number: ");
    ph = stdin.readLineSync()!;

    while (true) {
      print("Enter Your Email: ");
      mail = stdin.readLineSync()!;
      if (!mail.contains('@gmail.com')) {
        print("Invalid Email Address \n");
      } else {
        break;
      }
    }
    print("Enter Your Date Of Birth: ");
    DOB = stdin.readLineSync()!;
    if (ph.isNotEmpty && nam.isNotEmpty && mail.isNotEmpty && DOB.isNotEmpty) {
      this.name = nam;
      this.email = mail;
      this.dateOfBirth = DOB;
      this.phno = ph;
    } else {
      print("Information is incomplete");
    }
  }

  void veiwDetails() {
    print("    Name     : ${this.name}");
    print("Phone Number : ${this.phno}");
    print("    Email    : ${this.email}");
    print("Date Of birth: ${this.dateOfBirth}");
  }
}

void main() {
  int i = 0;
  String choice;
  List<Contact> array = [];
  var caller = Helper();

  while (true) {
    choice = caller.returnDetails();
    // print(choice);

    if (choice == 'A' || choice == 'a') {
      array.add(Contact());
      array[i].enterDetails();
    } else if (choice == 'B' || choice == 'b') {
      caller.caseB(array);
    } else if (choice == 'C' || choice == 'c') {
      array.forEach((element) => {element.veiwDetails()});
    } else if (choice == 'D' || choice == 'd') {
      caller.caseD(array);
    } else {
      break;
    }
  }
}

class Helper {
  String returnDetails() {
    String choice;
    print("My phone Book");
    print(
        "A--> For Add Contact:\nB-->For Update Contact:\nC-->For View Contact:\nD-->For Delete Contact:\nE-->For Exit");
    print("Please Enter Your Choice!!!Here ");
    choice = stdin.readLineSync()!;
    return choice;
  }

  void caseB(dynamic array) {
    print("Please Enter The Index Number: ");
    int index = int.parse(stdin.readLineSync()!);
    if (array[index].checkinf()) {
      print("Please Enter Your Detail Again: ");
      array[index].enterDetails();
    }
  }

  void caseD(dynamic array) {
    print("Please Enter The Index Number: ");
    int index = int.parse(stdin.readLineSync()!);
    if (array[index].checkinf()) {
      array.remove(array[index]);
      print("Record Deleted!");
    } else {
      print("Index Not Found");
    }
  }
}
