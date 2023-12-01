import 'dart:convert';
import 'package:capstonedesign_23_2/providers/Post.dart';
import 'package:http/http.dart' as http;

class postAPI {

  static const String baseUrl = 'http://3.39.13.133:8080';

  // 모든 게시물 반환
  static Future<List<Post>> getPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }
    
    final List<dynamic> posts = jsonDecode(utf8.decode(response.bodyBytes));
    List<Post> postInstances = posts.map((item) => Post.fromJson(item)).toList();
    return postInstances;
  }

  // 카테고리별 게시물 반환
  static Future<List<Post>> getCategoryPosts(String category) async {
    final url = Uri.parse('$baseUrl/post/?category=$category');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }

    final List<dynamic> posts = jsonDecode(utf8.decode(response.bodyBytes));
    List<Post> postInstances = posts.map((schedule) => Post.fromJson(schedule)).toList();
    return postInstances;
  }

}