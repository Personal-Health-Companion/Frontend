
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:flutter/cupertino.dart';

class Post with ChangeNotifier {
  int? Id;
  late final String category;
  late final String title;
  late final String question;
  String docName;
  String answer;
  User? user;

  Post(
      {this.Id,
        required this.category,
        required this.title,
        required this.question,
        required this.docName,
        required this.answer,
        this.user});

  void setQuestion(String newCategory, String newTitle, String newQuestion) {
    category = newCategory;
    title = newTitle;
    question = newQuestion;
    notifyListeners();
  }

  void updateQuestion(String newTitle, String newQuestion) {
    title = newTitle;
    question = newQuestion;
    notifyListeners();
  }

  void setAnswer(String newDocName, String newAnswer) {
    docName = newDocName;
    answer = newAnswer;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'category': category,
      'title': title,
      'question': question,
      'docName': docName,
      'answer': answer,
    };
  }

  Post.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        title = json['title'],
        question = json['question'],
        docName = json['docName'],
        answer = json['answer'],
        Id = json['id'];

}