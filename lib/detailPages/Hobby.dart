import 'package:flutter/material.dart';

class Hobby extends StatelessWidget {
  const Hobby({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '                     Hobby',
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      body: SingleChildScrollView( // 이 부분을 추가합니다.
        child: HobbyPanel(),
      ),
    );
  }
}

class HobbyPanel extends StatelessWidget {
  HobbyPanel({super.key});

  final _hobby1Controller = TextEditingController();
  final _hobby2Controller = TextEditingController();
  final _hobby3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("       1순위로 즐겨 하는 취미 활동을 알려주세요", style: TextStyle(color: Colors.grey),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: TextField(
            controller: _hobby1Controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.looks_one),
                labelText: "1순위 취미 활동"
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("       2순위로 즐겨 하는 취미 활동을 알려주세요", style: TextStyle(color: Colors.grey),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: TextField(
            controller: _hobby2Controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.looks_two),
                labelText: "2순위 취미 활동"
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("       3순위로 즐겨 하는 취미 활동을 알려주세요", style: TextStyle(color: Colors.grey),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: TextField(
            controller: _hobby3Controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.looks_3),
                labelText: "3순위 취미 활동"
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          height: 240,
        ),
        TextButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Hobby()));
        }, child: Text("완료"))
      ],
    );
  }
}

