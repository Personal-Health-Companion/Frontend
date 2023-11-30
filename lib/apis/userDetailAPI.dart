import 'dart:convert';
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:capstonedesign_23_2/providers/UserDetail.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class userDetailAPI {
  static const String baseUrl = 'http://3.39.13.133:8080';

  // 사용자 정보 저장
  static Future<bool> save(User user, Details details) async {
    final url = Uri.parse('$baseUrl/detail/${user.Id}');
    final body = {
      'id': details.id,
      'age': details.age,
      'gender': details.gender,
      'disease1': details.disease1,
      'disease2': details.disease2,
      'disease3': details.disease3,
      'surgery': details.surgery,
      'hobby1': details.hobby1,
      'hobby2': details.hobby2,
      'hobby3': details.hobby3,
      'medicine': details.medicine,
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