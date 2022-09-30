import 'package:test_app/view/Project%20code/PersonalDetails.dart';

class ToDoModel {
  late final String firstname;
  late final String middlename;
  late final String lastname;
  late final String email;
  late final String mobile;
  late final String DOB;

  static const String tablename = "PersonalDetails";

  ToDoModel(
      {required this.firstname,
      required this.middlename,
      required this.lastname,
      required this.email,
      required this.mobile,
      required this.DOB});

  Map<String, dynamic> toMap() {
    // Map<String, dynamic> map = Map();
    var map = <String, dynamic>{
      'firstname': firstname,
      'middlename': middlename,
      'lastname': lastname,
      'email': email,
      'mobile': mobile,
      'DOB': DOB,
    };
    return map;
  }

  //map to model
  ToDoModel.fromMap(Map<String, dynamic> map) {
    firstname = map['firstname'];
    middlename = map['middlename'];
    lastname = map['lastname'];
    email = map['email'];
    mobile = map['mobile'];
    DOB = map['DOB'];
  }

  //  @override
  String toString() {
    return 'ToDoModel{firstname: $firstname,email: $email,lastname: $lastname,DOB: $DOB,mobile: $mobile,middlename: $middlename}';
  }
}
