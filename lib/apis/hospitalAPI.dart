import 'dart:convert';
import 'package:capstonedesign_23_2/providers/Hospital.dart';
import 'package:http/http.dart' as http;

class hospitalAPI {

  static const String baseUrl = 'http://3.39.13.133:8080';

  // 병원 반환
  static Future<List<Hospital>> getHospitals(int? userID) async {
    final url = Uri.parse('$baseUrl/hospital/address/$userID');
    final response = await http.get(url);

    // print('Response status: ${response.statusCode}'); // 응답 상태 코드 로그 출력
    // print('Response body: ${response.body}'); // 응답 본문 로그 출력

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }
    final List<dynamic> hospitals = jsonDecode(utf8.decode(response.bodyBytes));
    List<Hospital> hospitalInstance = hospitals.map((item) => Hospital.fromJson(item)).toList();
    return hospitalInstance;
  }

  // 병원 한 개 반환
  static Future<Hospital> getHospital(int? userID) async {
    final url = Uri.parse('$baseUrl/hospital/main/$userID');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }
    final hospital = jsonDecode(utf8.decode(response.bodyBytes));
    Hospital hospitalInstance = Hospital.fromJson(hospital);
    return hospitalInstance;
  }

}
