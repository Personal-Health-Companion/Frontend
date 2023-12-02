
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:flutter/cupertino.dart';

class Answer with ChangeNotifier {
  String docName;
  String answer;

  Answer(
      {
        required this.docName,
        required this.answer,
      });

  void setAnswer(String newDocName, String newAnswer) {
    docName = newDocName;
    answer = newAnswer;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'docName': docName,
      'answer': answer,
    };
  }

}