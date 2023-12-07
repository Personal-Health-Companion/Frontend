import 'dart:io';
import 'package:capstonedesign_23_2/MyPosts.dart';
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'package:image_picker/image_picker.dart';
import 'MyChats.dart';


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
              color: Color(0xffe4f5d9),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyPostsPage()));
                    },
                    label: '${user.userName} 님이 작성한 질문글',
                    icon: Icons.list,
                  ),
                ),
                const Divider(color: Color(0xFF065535)),
                Container(
                  height: 60,
                  child: buildButtonWithIcon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyChatPage(userId: user.Id!,)));
                    },
                    label: '${user.userName} 님의 챗봇 이용 내역',
                    icon: Icons.list_outlined,
                  ),
                ),
                const Divider(color: Color(0xFF065535)),
                Container(
                  height: 60,
                  child: buildButtonWithIcon(
                    onPressed: () async {
                      ImagePicker _picker = ImagePicker();
                      XFile? _pick = await _picker.pickImage(source: ImageSource.gallery);
                      if (_pick != null) {
                        File _file = File(_pick.path);
                        FirebaseStorage.instance.ref("secure/${user.Id}").putFile(
                          _file,
                          SettableMetadata(
                            customMetadata: {
                              "userID": "${user.Id}",
                            },
                          ),
                        );
                      }
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
            Text("정말 로그아웃 하시겠습니까?",),
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

class Changed extends StatelessWidget {
  const Changed({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(100, 30, 100, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("권한이 변경되었습니다.", style: TextStyle(color: Colors.red),),
          ],
        ),
      ),
    );
  }
}