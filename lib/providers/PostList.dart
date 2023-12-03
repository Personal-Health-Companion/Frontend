import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/providers/Post.dart';
import 'package:capstonedesign_23_2/apis/postAPI.dart';

import 'Answer.dart';

class PostList extends ChangeNotifier {
  List<Post> allPostList = [];
  List<Post> searchPostList = [];

  List<Post> allNeurologyList = [];
  List<Post> allOrthopedicList = [];
  List<Post> allInternalMedicineList = [];
  List<Post> allDentistryList = [];
  List<Post> allTraumaList = [];
  List<Post> allENTList = [];
  List<Post> allObstetricsList = [];

  List<Post> searchNeurologyList = [];
  List<Post> searchOrthopedicList = [];
  List<Post> searchInternalMedicineList = [];
  List<Post> searchDentistryList = [];
  List<Post> searchTraumaList = [];
  List<Post> searchENTList = [];
  List<Post> searchObstetricsList = [];

  // 모든 게시물 불러오기
  Future<void> updatePostList() async {
    allPostList = await postAPI.getPosts();
    notifyListeners();
  }

  // 게시물 검색
  Future<void> updateSearchPostList(String keyword) async {
    searchPostList = await postAPI.getSearchPosts(keyword);
    allPostList = searchPostList;
    notifyListeners();
  }

  // 신경과 게시물 불러오기
  Future<void> updateNeurologyPostList() async {
    allNeurologyList = await postAPI.getCategoryPosts("Neurology");
    notifyListeners();
  }
  // 정형외과 게시물 불러오기
  Future<void> updateOrthopedicPostList() async {
    allOrthopedicList = await postAPI.getCategoryPosts("Orthopedic");
    notifyListeners();
  }
  // 내과 게시물 불러오기
  Future<void> updateInternalMedicinePostList() async {
    allInternalMedicineList = await postAPI.getCategoryPosts("InternalMedicine");
    notifyListeners();
  }
  // 치의학 게시물 불러오기
  Future<void> updateDentistryPostList() async {
    allDentistryList = await postAPI.getCategoryPosts("Dentistry");
    notifyListeners();
  }
  // 외상 게시물 불러오기
  Future<void> updateTraumaPostList() async {
    allTraumaList = await postAPI.getCategoryPosts("Trauma");
    notifyListeners();
  }
  // 이비인후과 게시물 불러오기
  Future<void> updateENTPostList() async {
    allENTList = await postAPI.getCategoryPosts("ENT");
    notifyListeners();
  }
  // 산부인과 게시물 불러오기
  Future<void> updateObstetricsPostList() async {
    allObstetricsList = await postAPI.getCategoryPosts("Obstetrics");
    notifyListeners();
  }

  // 신경과 게시물 검색
  Future<void> searchNeurologyPostList(String keyword) async {
    searchNeurologyList = await postAPI.getSearchCategoryPosts("Neurology", keyword);
    allNeurologyList = searchNeurologyList;
    notifyListeners();
  }
  // 정형외과 게시물 검색
  Future<void> searchOrthopedicPostList(String keyword) async {
    searchOrthopedicList = await postAPI.getSearchCategoryPosts("Orthopedic", keyword);
    allOrthopedicList = searchOrthopedicList;
    notifyListeners();
  }
  // 내과 게시물 검색
  Future<void> searchInternalMedicinePostList(String keyword) async {
    searchInternalMedicineList = await postAPI.getSearchCategoryPosts("InternalMedicine", keyword);
    allInternalMedicineList = searchInternalMedicineList;
    notifyListeners();
  }
  // 치의학 게시물 검색
  Future<void> searchDentistryPostList(String keyword) async {
    searchDentistryList = await postAPI.getSearchCategoryPosts("Dentistry", keyword);
    allDentistryList = searchDentistryList;
    notifyListeners();
  }
  // 외상 게시물 검색
  Future<void> searchTraumaPostList(String keyword) async {
    searchTraumaList = await postAPI.getSearchCategoryPosts("Trauma", keyword);
    allTraumaList = searchTraumaList;
    notifyListeners();
  }
  // 이비인후과 게시물 검색
  Future<void> searchENTPostList(String keyword) async {
    searchENTList = await postAPI.getSearchCategoryPosts("ENT", keyword);
    allENTList = searchENTList;
    notifyListeners();
  }
  // 산부인과 게시물 검색
  Future<void> searchObstetricsPostList(String keyword) async {
    searchObstetricsList = await postAPI.getSearchCategoryPosts("Obstetrics", keyword);
    allObstetricsList = searchObstetricsList;
    notifyListeners();
  }

  // 게시물 추가하기
  Future<void> addPostList(int userID, Post post) async {
    bool result = await postAPI.savePost(userID, post);
    if (result) {
      print('추가 성공!');
    } else {
      print('추가 실패');
    }

    if(post.category == "else") {
      allPostList.add(post);
    } else if(post.category == "Neurology") {
      allNeurologyList.add(post);
    } else if(post.category == "Orthopedic") {
      allOrthopedicList.add(post);
    } else if(post.category == "InternalMedicine") {
      allInternalMedicineList.add(post);
    } else if(post.category == "Dentistry") {
      allDentistryList.add(post);
    } else if(post.category == "Trauma") {
      allTraumaList.add(post);
    }
    notifyListeners();
  }

  // 게시물 답변하기
  Future<bool> answerPostList(int docID, int postID, Answer answer) async {
    bool result = await postAPI.answerPost(docID, postID, answer);
    if (result) {
      print('추가 성공!');
      // postID와 일치하는 게시물 찾기
      var targetPost = allPostList.firstWhere((post) => post.Id == postID);
      // 찾은 게시물에 답변 추가
      targetPost.setAnswer(answer.docName, answer.answer);
      return true;
    } else {
      print('추가 실패');
      return false;
    }

    notifyListeners();
  }

}
