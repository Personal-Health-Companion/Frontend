import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/apis/hospitalAPI.dart';
import 'package:capstonedesign_23_2/providers/Hospital.dart';

class HospitalList with ChangeNotifier {
  List<Hospital> allHospital = [];
  List<Hospital> searchHospital = [];

  // 지역의 모든 병원
  Future<void> updateHospitalList(int? userID) async {
    allHospital = await hospitalAPI.getHospitals(userID);
    notifyListeners();
  }

  // 지역의 병원 중 검색 결과
  Future<void> updateSearchHospitalList(int? userID, String type) async {
    searchHospital = await hospitalAPI.getSearchHospitals(userID, type);
    allHospital = searchHospital;
    notifyListeners();
  }
}
