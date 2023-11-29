import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: SizedBox.shrink(),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/mainLogo.png'),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Information',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Recommended Hospitals',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Chat Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Calendar Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PersonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> icons = [
    {'icon': Icons.home, 'title': 'Home', 'page': HomeScreen()},
    {'icon': Icons.chat, 'title': 'Chat', 'page': ChatScreen()},
    {'icon': Icons.calendar_month, 'title': 'Calendar', 'page': CalendarScreen()},
    {'icon': Icons.person, 'title': 'Person', 'page': PersonScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: icons[selectedIndex]['page'], // 선택된 페이지를 표시
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(icons.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index; // 아이콘 선택 시 페이지 변경
                        });
                      },
                      child: Container(
                        color: selectedIndex == index ? Colors.grey[300] : Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icons[index]['icon'],
                              size: 30,
                              color: selectedIndex == index ? Colors.lightGreen : Colors.black,
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
