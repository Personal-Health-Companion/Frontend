import 'package:flutter/material.dart';
import 'JoinPage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Login',
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
      body: LoginPanel(),
    );
  }
}

class LoginPanel extends StatelessWidget {
  LoginPanel({Key? key}) : super(key: key);

  TextEditingController IDController = TextEditingController();
  TextEditingController PWController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: ListView(
        children: [
          Container(
            child: Image(image: AssetImage('assets/images/mainLogo.png'))
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: IDController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF9F9FB),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                borderRadius: BorderRadius.circular(24),
              ),
              prefixIcon: const Icon(Icons.account_circle_outlined),
              labelText: "ID"
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: PWController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                labelText: "Password"
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Container(
            height: 56,
            child: ElevatedButton(
                onPressed: () {  },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFa9d18e)),
                ),
                child: const Text('로그인',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('회원가입을 아직 안 하셨나요?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Join()));
                },
                child: Text('회원가입',
                  style: TextStyle(
                    color: Color(0xFF199A8E),
                  ),
                ),
              )],
          ),
        ],
      ),
    );
  }
}