import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
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
      body: MainPanel(),
    );
  }
}

class MainPanel extends StatelessWidget {
  const MainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

