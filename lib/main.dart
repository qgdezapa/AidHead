import 'package:expertsystems/screens/diagnosis.dart';
import 'package:expertsystems/screens/help.dart';
import 'package:expertsystems/screens/info_window.dart';
import 'package:expertsystems/screens/main_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aid Head',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: Text("  AID HEAD",
              style: TextStyle(
                fontFamily: 'Rajdhani-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
            ),
        '/diagnose': (context) => Diagnose(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final Widget title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late BuildContext context;

  int _currentIndex = 0;

  List<Widget> _tabs = [
    MainWindow(),
    InfoWindow(),
    HelpTab(),
  ];




  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: widget.title,
        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: Colors.red.withOpacity(0.9),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: "Doctors",
            backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
            backgroundColor: Colors.amber.shade700.withOpacity(0.9),
          ),

        ],
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
