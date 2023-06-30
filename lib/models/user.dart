import 'package:cloud_firestore/cloud_firestore.dart';


class User {
  final String userID;
  final String firstName;
  final String lastName;
  final String meterNumber;
  final String phoneNumbers;
  final String email;
  final String password;
  final String confirmPwd;

  User({this.userID, this.firstName, this.lastName, this.meterNumber, this.phoneNumbers, this.email, this.password, this.confirmPwd});

  

  
  Map<String, Object> toJson() {
    return {
      "userID": userID,
      "firstName": firstName,
      "lastName": lastName,
      "meterNumber": meterNumber,
      "phoneNumbers": phoneNumbers,
      "email": email == null ? '' : email,
      "password": password,
    };
  }


  factory User.fromJson(Map<String, Object> doc) {
    User user = User(
      userID: doc['userID'],
      firstName: doc['firstName'],
      lastName: doc['lastName'],
      meterNumber: doc['meterNumber'],
      phoneNumbers: doc['phoneNumbers'],
      email: doc['email'],
      password: doc['password']
    );
    return user;
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }

}