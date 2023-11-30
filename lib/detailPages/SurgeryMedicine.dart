import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/detailPages/Disease.dart';
import 'package:capstonedesign_23_2/detailPages/Hobby.dart';

class SurgeryMedicine extends StatefulWidget {
  const SurgeryMedicine({super.key});

  @override
  State<SurgeryMedicine> createState() => _SurgeryMedicineState();
}

class _SurgeryMedicineState extends State<SurgeryMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '          Surgery or Medicine',
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      body: SingleChildScrollView( // 이 부분을 추가합니다.
        child: SurgeryMedicinePanel(),
      ),
    );
  }
}

class SurgeryMedicinePanel extends StatefulWidget {
  const SurgeryMedicinePanel({super.key});

  @override
  _SurgeryMedicinePanelState createState() => _SurgeryMedicinePanelState();
}

class _SurgeryMedicinePanelState extends State<SurgeryMedicinePanel> {
  bool _agreedToTOS = false;
  final _surgeryController = TextEditingController();
  final _medicineController = TextEditingController();

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
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TextField(
            controller: _surgeryController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.masks),
                labelText: "수술 하신 적이 있다면 이름을 알려주세요"
            ),
            keyboardType: TextInputType.number,
            enabled: _agreedToTOS,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _medicineController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.medication_rounded),
                labelText: "복용 중인 약을 알려주세요"
            ),
            keyboardType: TextInputType.number,
            enabled: _agreedToTOS,
          ),
        ),
        SizedBox(
          height: 300,
        ),
        TextButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Hobby()));
        }, child: Text("다음 >"))
      ],
    );
  }
}

