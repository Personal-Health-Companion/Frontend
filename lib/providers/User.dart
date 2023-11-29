
import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  int? Id;
  final String userID;
  final String userPassword;
  String userName;
  String location;

  User(
      {this.Id,
      required this.userID,
      required this.userPassword,
      required this.userName,
      required this.location});

  void setId(int? newId) {
    Id = newId;
    notifyListeners();
  }

  void setUserName(String newName) {
    userName = newName;
    notifyListeners();
  }

  void setLocation(String newLocation) {
    location = newLocation;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'userID': userID,
      'userPassword': userPassword,
      'userName': userName,
      'location': location,
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : Id = json['id'],
        userID = json['userID'],
        userPassword = json['userPassword'],
        userName = json['userName'],
        location = json['location'];
}
