import 'package:flutter/material.dart';
import 'LoginPage.dart';

class MyPage extends StatelessWidget {
  final String userName;

  const MyPage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '$userName 님',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildButtonWithIcon(
                    onPressed: () {
                      // '내 정보 수정' 버튼 눌렀을 때 수행할 작업 추가
                    },
                    label: '내 정보 수정',
                    icon: Icons.edit,
                  ),
                  const Divider(),
                  buildButtonWithIcon(
                    onPressed: () {
                      // '내가 쓴 질문글' 버튼 눌렀을 때 수행할 작업 추가
                    },
                    label: '내가 쓴 질문글',
                    icon: Icons.speaker_notes,
                  ),
                  const Divider(),
                  buildButtonWithIcon(
                    onPressed: () {
                      _showCustomerServiceDialog(context);
                    },
                    label: '고객센터',
                    icon: Icons.help_center,
                  ),
                  const Divider(),
                  buildButtonWithIcon(
                    onPressed: () {
                      // '사용자 권한 변경 요청' 버튼 눌렀을 때 수행할 작업 추가
                    },
                    label: '사용자 권한 변경 요청',
                    icon: Icons.change_circle,
                  ),
                  const Divider(),
                  buildButtonWithIcon(
                    onPressed: () {
                      _showLogoutConfirmationDialog(context);
                    },
                    label: 'Logout',
                    icon: Icons.exit_to_app,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonWithIcon({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
    Color? textColor,
  }) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(15.0),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(icon),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Check'),
          content: Text('정말 로그아웃 하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
                );
              },
              child: Text('로그아웃'),
            ),
          ],
        );
      },
    );
  }

  void _showCustomerServiceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('고객센터'),
          content: Text('준비중입니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}