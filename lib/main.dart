import 'package:flutter/material.dart';
import 'package:sample_app/pages/plan_view.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeNav = 2;

  void _onSelectedNav(int value) {
    setState(() {
      _activeNav = value;
    });
  }

  Widget getView(int index) {
    switch (index) {
      case 0:
      case 1:
        return Center(child: Text('N/A'));
      case 2:
        return PlanView();
      case 3:
      case 4:
      default:
        return Center(child: Text('N/A'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getView(_activeNav),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: 'Plans'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Settings'),
        ],
        onTap: _onSelectedNav,
        currentIndex: _activeNav,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 8.0,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
