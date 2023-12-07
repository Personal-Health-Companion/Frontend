import 'dart:convert';
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:http/http.dart' as http;

import '../providers/Chats.dart';

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

  // 사용자의 챗봇 이용 내역
  static Future<List<Chats>> getUserChats(int userId) async {
    final url = Uri.parse('http://3.39.13.133:8080/userChats/$userId');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }

    final List<dynamic> chats = jsonDecode(utf8.decode(response.bodyBytes));
    List<Chats> chatsInstances = chats.map((chat) => Chats.fromJson(chat)).toList();
    return chatsInstances;
  }

}