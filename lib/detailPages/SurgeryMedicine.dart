import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/detailPages/Disease.dart';
import 'package:capstonedesign_23_2/detailPages/Hobby.dart';
import 'package:provider/provider.dart';

import '../providers/UserDetail.dart';

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
          '       수술 이력, 복용중인 약',
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
  final _surgeryController = TextEditingController();
  final _medicineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var detail = Provider.of<Details>(context);
    return Column(
      children: [
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
          ),
        ),
        SizedBox(
          height: 370,
        ),
        TextButton(onPressed: () {
          _surgeryController.text ??= '';
          _medicineController.text ??= '';
          detail.setSurgeryMedicine(_surgeryController.text, _medicineController.text);

          print(_surgeryController.text);
          print(_medicineController.text);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Hobby()));
        }, child: Text("다음 >"))
      ],
    );
  }
}

