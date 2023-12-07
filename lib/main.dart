import 'package:capstonedesign_23_2/providers/Answer.dart';
import 'package:capstonedesign_23_2/providers/ChatsList.dart';
import 'package:capstonedesign_23_2/providers/HospitalList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'JoinPage.dart';
import 'firebase_options.dart';
import 'providers/User.dart';
import 'providers/Chat.dart';
import 'providers/UserDetail.dart';
import 'providers/PostList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => User(userID: '', userPassword: '', userName: '', location: ''),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Chat(),
        ),
        ChangeNotifierProvider(
          create: (context) => Details(age: '', gender: '', disease1: '', disease2: '', disease3: '', surgery: '', hobby1: '', hobby2: '', hobby3: '', medicine: '', job: ''),
        ),
        ChangeNotifierProvider(
            create: (context) => PostList(),
        ),
        ChangeNotifierProvider(
          create: (context) => Answer(docName: '', answer: ''),
        ),
        ChangeNotifierProvider(
          create: (context) => HospitalList(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatsList(),
        ),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFa9d18e)),
        useMaterial3: true,
        fontFamily: 'GowunDodum',
      ),
      home: Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
