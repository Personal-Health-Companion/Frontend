import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/providers/User.dart';

class Chats with ChangeNotifier {
  int id;
  String requestText;
  String responseText;
  User user;

  Chats(
      {
        required this.id,
        required this.requestText,
        required this.responseText,
        required this.user
      });

  Chats.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        requestText = json['requestText'],
        responseText = json['responseText'],
        user = User.fromJson(json['users'] as Map<String, dynamic>);
}
