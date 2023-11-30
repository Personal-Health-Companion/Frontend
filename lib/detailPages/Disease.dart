import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/detailPages/SurgeryMedicine.dart';

class Disease extends StatefulWidget {
  const Disease({super.key});

  @override
  State<Disease> createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '                    Disease',
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      body: SingleChildScrollView( // 이 부분을 추가합니다.
        child: DiseasePanel(),
      ),
    );
  }
}

class DiseasePanel extends StatefulWidget {
  const DiseasePanel({super.key});

  @override
  _DiseasePanelState createState() => _DiseasePanelState();
}

class _DiseasePanelState extends State<DiseasePanel> {
  bool _agreedToTOS = false;

  bool _hypertension = false;           // 고혈압
  bool _diabete = false;                // 당뇨병
  bool _myocardialInfarction = false;   // 심근경색
  bool _anginaPectoris = false;         // 협심증
  bool _stroke = false;                 // 뇌졸증
  bool _pulmonaryTuberculosis = false;  // 폐결핵
  bool _hepatitisB = false;             // B형간염 (보균)
  bool _hepatitisC = false;             // C형간염
  bool _liverDisease = false;           // 간질환
  bool _stomachUlcers = false;          // 위궤양
  bool _duodenalUlcer = false;          // 십이지장궤양
  bool _gastritis = false;              // 위염
  bool _cholelithiasis = false;         // 담석증
  bool _cancer = false;                 // 암
  bool _thyroidDisease = false;         // 갑상선질환
  bool _kidneyDisease = false;          // 신장질환
  bool _urolithiasis = false;           // 요로결석
  bool _breastDiseases = false;         // 유방질환
  bool _asthma = false;                 // 천식
  bool _womenHealth = false;            // 자궁, 난소, 나팔관 (여성질환)
  bool _allergies = false;              // 알레르기
  bool _adverseDrugReactions = false;   // 약물부작용

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CheckboxListTile(
            title: Text("[필수] 의료 정보 수집에 동의합니다."),
            value: _agreedToTOS,
            onChanged: (bool? newValue) {
              setState(() {
                _agreedToTOS = newValue!;
              });
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            child: GridView (
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 가로 방향에 배치할 항목 수
                childAspectRatio: 2.9, // 항목의 가로 세로 비율
              ),
              children: [
                CheckboxListTile(
                  title: Text('고혈압'),
                  value: _hypertension,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _hypertension = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('당뇨병'),
                  value: _diabete,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _diabete = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('심근경색'),
                  value: _myocardialInfarction,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _myocardialInfarction = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('협심증'),
                  value: _anginaPectoris,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _anginaPectoris = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('뇌졸증'),
                  value: _stroke,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _stroke = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('폐결핵'),
                  value: _pulmonaryTuberculosis,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _pulmonaryTuberculosis = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('B형간염'),
                  value: _hepatitisB,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _hepatitisB = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('C형간염'),
                  value: _hepatitisC,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _hepatitisC = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('간질환'),
                  value: _liverDisease,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _liverDisease = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('위궤양'),
                  value: _stomachUlcers,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _stomachUlcers = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('십이지장궤양'),
                  value: _duodenalUlcer,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _duodenalUlcer = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('위염'),
                  value: _gastritis,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _gastritis = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('담석증'),
                  value: _cholelithiasis,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _cholelithiasis = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('암'),
                  value: _cancer,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _cancer = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('갑상선질환'),
                  value: _thyroidDisease,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _thyroidDisease = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('신장질환'),
                  value: _kidneyDisease,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _kidneyDisease = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('요로결석'),
                  value: _urolithiasis,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _urolithiasis = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('유방질환'),
                  value: _breastDiseases,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _breastDiseases = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('천식'),
                  value: _asthma,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _asthma = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('자궁, 난소, 나팔관'),
                  value: _womenHealth,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _womenHealth = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('알레르기'),
                  value: _allergies,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _allergies = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),

                CheckboxListTile(
                  title: Text('약물부작용'),
                  value: _adverseDrugReactions,
                  onChanged: (bool? value) {
                    // 현재 선택된 체크박스의 개수를 계산합니다.
                    int numSelected = (_hypertension ? 1 : 0)
                        + (_diabete ? 1 : 0)
                        + (_myocardialInfarction ? 1 : 0)
                        + (_anginaPectoris ? 1 : 0)
                        + (_stroke ? 1 : 0)
                        + (_pulmonaryTuberculosis ? 1 : 0)
                        + (_hepatitisB ? 1 : 0)
                        + (_hepatitisC ? 1 : 0)
                        + (_liverDisease ? 1 : 0)
                        + (_stomachUlcers ? 1 : 0)
                        + (_duodenalUlcer ? 1 : 0)
                        + (_gastritis ? 1 : 0)
                        + (_cholelithiasis ? 1 : 0)
                        + (_cancer ? 1 : 0)
                        + (_thyroidDisease ? 1 : 0)
                        + (_kidneyDisease ? 1 : 0)
                        + (_urolithiasis ? 1 : 0)
                        + (_breastDiseases ? 1 : 0)
                        + (_asthma ? 1 : 0)
                        + (_womenHealth ? 1 : 0)
                        + (_allergies ? 1 : 0)
                        + (_adverseDrugReactions ? 1 : 0);
                    if (value == true && numSelected >= 3) {
                      // 이미 3개의 체크박스가 선택되어 있고, 사용자가 추가로 체크하려고 하면
                      // 아무런 동작을 하지 않습니다.
                    } else {
                      // 그렇지 않으면, 체크박스의 상태를 업데이트합니다.
                      setState(() {
                        _adverseDrugReactions = value!;
                      });
                    }
                  },
                  enabled: _agreedToTOS,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        TextButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SurgeryMedicine()));
        }, child: Text("다음 >"))
      ],
    );
  }
}

