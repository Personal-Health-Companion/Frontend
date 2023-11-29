import 'package:flutter/material.dart';

class Hospital extends StatelessWidget {
  const Hospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Hospital',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF101522),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 0.08,
            ),
          ),
        ),
      ),
      body: HospitalPanel(),
    );
  }
}

class HospitalPanel extends StatelessWidget {
  const HospitalPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

