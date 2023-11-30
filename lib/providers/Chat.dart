import 'package:flutter/material.dart';

class Chat with ChangeNotifier {
  List<String> _chatHistory = [];
  String question = '';
  String? answer;

  void setQuestion(String ques) {
    question = ques;
    notifyListeners();
  }

  void setAnswer(String ans) {
    answer = ans;
    notifyListeners();
  }

  List<String> get chatHistory => _chatHistory;

  void addChat(String chat) {
    _chatHistory.add(chat);
    notifyListeners();
  }
}
