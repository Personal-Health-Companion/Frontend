import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/providers/Chats.dart';
import 'package:capstonedesign_23_2/apis/chatAPI.dart';

class ChatsList with ChangeNotifier {
  List<Chats> allChatList = [];

  // 모든 사용자 채팅 불러오기
  Future<void> updateUserChatList(int userId) async {
    allChatList = await ChatAPI.getUserChats(userId);
    notifyListeners();
  }
}
