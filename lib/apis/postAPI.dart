import 'dart:convert';
import 'package:capstonedesign_23_2/providers/Post.dart';
import 'package:http/http.dart' as http;

import '../providers/Answer.dart';

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
    final url = Uri.parse('$baseUrl/post?category=$category');
    final response = await http.get(url);

    // print('Response status: ${response.statusCode}'); // 응답 상태 코드 로그 출력
    // print('Response body: ${response.body}'); // 응답 본문 로그 출력

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }

    final List<dynamic> posts = jsonDecode(utf8.decode(response.bodyBytes));
    List<Post> postInstances = posts.map((schedule) => Post.fromJson(schedule)).toList();
    return postInstances;
  }

  // 게시물 추가하기
  static Future<bool> savePost(int userID, Post post) async {
    final url = Uri.parse('$baseUrl/post/$userID');
    final body = {
      "category": post.category,
      "title": post.title,
      "question": post.question,
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

  // 게시물 답변하기
  static Future<bool> answerPost(int docID, int postID, Answer answer) async {
    final url = Uri.parse('$baseUrl/post/$docID/$postID');
    final body = {
      "docName": answer.docName,
      "answer": answer.answer,
    };

    final response = await http.put(url,
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