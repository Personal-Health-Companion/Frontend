import 'dart:convert';
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:http/http.dart' as http;

class userAPI {

  static const String baseUrl = 'http://3.39.13.133:8080';

  static Future<bool> join(User user) async {
    final url = Uri.parse('$baseUrl/join');
    final body = {
      "userID": user.userID,
      "userPassword": user.userPassword,
      "userName": user.userName,
      "location": user.location
    };

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));

    if (response.statusCode != 200) {
      print(response.statusCode);
      return false;
    }
    return true;
  }

  static Future<bool> login(User user) async {
    final url = Uri.parse('$baseUrl/login');
    final body = {
      "userID": user.userID,
      "userPassword": user.userPassword
    };

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));

    if (response.statusCode != 200) {
      print(response.statusCode);
      return false;
    }
    return true;
  }
}