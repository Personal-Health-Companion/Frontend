import 'dart:convert';
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:http/http.dart' as http;

class ChatAPI {

  static const String baseUrl = 'http://3.39.13.133:8000';

  // 채팅 저장
  static Future<String> saveChat(User user, String text) async {
    final url = Uri.parse('$baseUrl/bard/${user.Id}/?text=$text');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode);
      return 'Error: ${response.statusCode}';
    }
    return response.body;
  }

}