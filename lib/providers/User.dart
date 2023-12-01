import 'package:flutter/cupertino.dart';
import 'package:capstonedesign_23_2/providers/UserDetail.dart';

class User with ChangeNotifier {
  int? Id;
  final String userID;
  final String userPassword;
  String userName;
  String location;
  Details? details;

  User(
      {this.Id,
      required this.userID,
      required this.userPassword,
      required this.userName,
      required this.location,
      this.details});

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

  void setDetails(Details? newDetails) {
    details = newDetails;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'userID': userID,
      'userPassword': userPassword,
      'userName': userName,
      'location': location,
      'details': details,
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : Id = json['id'],
        userID = json['userID'],
        userPassword = json['userPassword'],
        userName = json['userName'],
        location = json['location'],
        details = json['details'] != null ? Details.fromJson(json['details'] as Map<String, dynamic>) : null;
}
