import 'package:capstonedesign_23_2/providers/UserDetail.dart';
import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/detailPages/Disease.dart';
import 'package:provider/provider.dart';

class AgeGender extends StatefulWidget {
  const AgeGender({super.key});

  @override
  State<AgeGender> createState() => _AgeGenderState();
}

class _AgeGenderState extends State<AgeGender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '             Age and Gender',
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      body: SingleChildScrollView( // 이 부분을 추가합니다.
        child: AgeGenderPanel(),
      ),
    );
  }
}

class AgeGenderPanel extends StatefulWidget {
  const AgeGenderPanel({super.key});

  @override
  _AgeGenderPanelState createState() => _AgeGenderPanelState();
}

class _AgeGenderPanelState extends State<AgeGenderPanel> {
  bool _agreedToTOS = false;
  String? _selectedGender;
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var detail = Provider.of<Details>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CheckboxListTile(
            title: Text("[필수] 이름, 성별 정보 수집에 동의합니다."),
            value: _agreedToTOS,
            onChanged: (bool? newValue) {
              setState(() {
                _agreedToTOS = newValue!;
              });
            },
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: Container(
            color: Color(0xFFF9F9FB),
            height: 50,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 0.80,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Color(0xFFF9F9FB),
                  isExpanded: true,
                  value: _selectedGender,
                  items: <String>["남성", "여성"].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text("성별을 선택해주세요."),
                  onChanged: _agreedToTOS ? (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  } : null,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _ageController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                labelText: "나이를 입력해주세요"
            ),
            keyboardType: TextInputType.number,
            enabled: _agreedToTOS,
          ),
        ),
        SizedBox(
          height: 300,
        ),
        TextButton(onPressed: () {
          detail.setAgeGender(_ageController.text, _selectedGender!);
          print(detail.age);
          print(detail.gender);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Disease()));
        }, child: Text("다음 >"))
      ],
    );
  }
}

