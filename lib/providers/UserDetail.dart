import 'package:flutter/cupertino.dart';

class Details with ChangeNotifier {
  int? id;
  String age;
  String gender;
  String disease1 = '';
  String disease2 = '';
  String disease3 = '';
  String surgery = '';
  String hobby1 = '';
  String hobby2 = '';
  String hobby3 = '';
  String medicine = '';

  Details(
  {this.id,
  required this.age,
  required this.gender,
  required this.disease1,
  required this.disease2,
  required this.disease3,
  required this.surgery,
  required this.hobby1,
  required this.hobby2,
  required this.hobby3,
  required this.medicine});

  void setAgeGender(String newAge, String newGender) {
    age = newAge;
    gender = newGender;
    notifyListeners();
  }

  void setDiseases(String d1, String d2, String d3) {
    if(d1.isNotEmpty) {
      disease1 = d1;
    }
    if(d2.isNotEmpty) {
      disease2 = d2;
    }
    if(d3.isNotEmpty) {
      disease3 = d3;
    }
    notifyListeners();
  }

  void setSurgeryMedicine(String newSurgery, String newMedicine) {
    if(newSurgery.isNotEmpty) {
      surgery = newSurgery;
    }
    if(newMedicine.isNotEmpty) {
      medicine = newMedicine;
    }
    notifyListeners();
  }

  void setHobby(String h1, String h2, String h3) {
    if(h1.isNotEmpty) {
      hobby1 = h1;
    }
    if(h2.isNotEmpty) {
      hobby2 = h2;
    }
    if(h3.isNotEmpty) {
      hobby3 = h3;
    }
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'age': age,
      'gender': gender,
      'disease1': disease1,
      'disease2': disease2,
      'disease3': disease3,
      'surgery': surgery,
      'hobby1': hobby1,
      'hobby2': hobby2,
      'hobby3': hobby3,
      'medicine': medicine,
    };
  }

  Details.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        age = json['age'],
        gender = json['gender'],
        disease1 = json['disease1'],
        disease2 = json['disease2'],
        disease3 = json['disease3'],
        surgery = json['surgery'],
        hobby1 = json['hobby1'],
        hobby2 = json['hobby2'],
        hobby3 = json['hobby3'],
        medicine = json['medicine'];
}