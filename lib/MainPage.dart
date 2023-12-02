import 'package:capstonedesign_23_2/PostPages/DentistryPage.dart';
import 'package:capstonedesign_23_2/PostPages/InternalMedicinePage.dart';
import 'package:capstonedesign_23_2/PostPages/OrthopedicPage.dart';
import 'package:capstonedesign_23_2/PostPages/TraumaPage.dart';
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PostPages/NeurologyPage.dart';
import 'apis/hospitalAPI.dart';
import 'providers/Hospital.dart';
import 'Hospitals.dart';
import 'ChatPage.dart';
import 'Calendar.dart';
import 'MyPage.dart';
import 'PostPages/PostPage.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '나만의 주치의',
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          HomePanel(),
          Chat(),
          Calendar(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFF065535),
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/images/house.png', width: 24, height: 24), label: '홈'),
          BottomNavigationBarItem(icon: Image.asset('assets/images/robotic.png', width: 24, height: 24), label: '챗봇'),
          BottomNavigationBarItem(icon: Image.asset('assets/images/calendars.png', width: 24, height: 24), label: '달력'),
          BottomNavigationBarItem(icon: Image.asset('assets/images/people.png', width: 24, height: 24), label: '내 정보'),
        ],
      ),
    );
  }
}

class HomePanel extends StatelessWidget {
  const HomePanel({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return ListView(
      children: [
        Container(
          width: 100,
          height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(73),
              child: Image.asset('assets/images/mainLogo_color1.png', fit: BoxFit.cover,),
            ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 10),
          child: Text("커뮤니티  ", style: TextStyle(fontSize: 17),),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text("궁금한 증상들을 현직 의사들에게 물어보세요", style: TextStyle(fontSize: 13, color: Colors.grey),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF065535), width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostPage()));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/1.png'),
                          SizedBox(height: 5,),
                          Text("전체 질문", style: TextStyle(color: Color(0xFF065535)),),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NeurologyPage()));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/2.png'),
                          SizedBox(height: 5,),
                          Text("신경과", style: TextStyle(color: Color(0xFF065535)),),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InternalMedicinePage()));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/3.png'),
                          SizedBox(height: 5,),
                          Text("내과", style: TextStyle(color: Color(0xFF065535)),),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DentistryPage()));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/4.png'),
                          SizedBox(height: 5,),
                          Text("치의학", style: TextStyle(color: Color(0xFF065535)),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TraumaPage()));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/5.png'),
                          SizedBox(height: 5,),
                          Text("외상", style: TextStyle(color: Color(0xFF065535)),),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrthopedicPage()));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/6.png'),
                          SizedBox(height: 5,),
                          Text("정형외과", style: TextStyle(color: Color(0xFF065535)),),
                        ],
                      ),
                    ),
                    Container(
                      width: 70,
                    ),
                    Container(
                      width: 70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 10),
          child: Text("인근 병원 추천  ", style: TextStyle(fontSize: 17),),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(user.userName + "님의 거주지 주변의 병원들을 알려줘요", style: TextStyle(fontSize: 13, color: Colors.grey),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF065535), width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: FutureBuilder<Hospital>(
              future: hospitalAPI.getHospital(user.Id),
              builder: (BuildContext context, AsyncSnapshot<Hospital> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // 로딩 중일 때
                } else if (snapshot.hasError) {
                  return Text('에러가 발생했습니다: ${snapshot.error}');
                } else {
                  Hospital hospital = snapshot.data!; // 병원 정보 가져오기
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("    " + hospital.name),
                            Text(" | " + hospital.code),
                          ],
                        ),
                        Row(
                          children: [
                            Text("    "),
                            Icon(Icons.call),
                            Text(hospital.telephone),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Hospitals()));
                            }, child: Text("더보기"))
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),

      ],
    );
  }
}

