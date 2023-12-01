import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/providers/Post.dart';
import 'package:capstonedesign_23_2/apis/postAPI.dart';

class PostList extends ChangeNotifier {
  List<Post> allPostList = [];

  // 모든 게시물 불러오기
  Future<void> updatePostList() async {
    allPostList = await postAPI.getPosts();
    notifyListeners();
  }
}
