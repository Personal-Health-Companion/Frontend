import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'JoinPage.dart';
import 'LoginPage.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(user.userName + " 님",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            decoration: ShapeDecoration(
              color: Color(0xFFa9d18e),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  child: buildButtonWithIcon(
                    onPressed: () {
                      // '내 정보 수정' 버튼 눌렀을 때 수행할 작업 추가
                    },
                    label: '내 정보 수정',
                    icon: Icons.edit,
                  ),
                ),
                const Divider(color: Color(0xFF065535)),
                Container(
                  height: 60,
                  child: buildButtonWithIcon(
                    onPressed: () {
                      // '내가 쓴 질문글' 버튼 눌렀을 때 수행할 작업 추가
                    },
                    label: '내가 쓴 질문글',
                    icon: Icons.list,
                  ),
                ),
                const Divider(color: Color(0xFF065535)),
                Container(
                  height: 60,
                  child: buildButtonWithIcon(
                    onPressed: () {
                      _showCustomerServiceDialog(context);
                    },
                    label: '고객센터',
                    icon: Icons.help,
                  ),
                ),
                const Divider(color: Color(0xFF065535)),
                Container(
                  height: 60,
                  child: buildButtonWithIcon(
                    onPressed: () {
                      // '사용자 권한 변경 요청' 버튼 눌렀을 때 수행할 작업 추가
                    },
                    label: '사용자 권한 변경 요청',
                    icon: Icons.change_circle,
                  ),
                ),
                const Divider(color: Color(0xFF065535)),
                Container(
                  height: 60,
                  child: buildButtonWithIcon(
                    onPressed: () {
                      showModalBottomSheet<void>(context: context, builder: (context) => LogoutConfirmation());
                    },
                    label: '로그아웃',
                    icon: Icons.exit_to_app,
                    textColor: Colors.red,
                  ),
                ),
              ],
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

class LogoutConfirmation extends StatelessWidget {
  LogoutConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(100, 30, 100, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("정말 로그아웃 하시겠습니까?.",),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text("[로그아웃]", style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      ),
    );
  }
}

