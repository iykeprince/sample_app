import 'package:flutter/material.dart';
import 'package:sample_app/widgets/plan_list.dart';
import 'package:sample_app/widgets/sample_button.dart';

import 'constants.dart';
import 'models/currency.model.dart';
import 'models/plan.model.dart';
import 'widgets/currency_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Plans'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeNav = 2;
  Currency? _selectedCurrency;

  void _onSelectedNav(int value) {
    setState(() {
      _activeNav = value;
    });
  }

  void _onCurrencySelected(Currency? currency) {
    setState(() {
      _selectedCurrency = currency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.shopping_cart,
                        color: kPrimaryColor,
                        size: 24,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CurrencySwitcher(
                      currencies: CURRENCIES,
                      onCurrencySelected: _onCurrencySelected,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Expanded(
                  child: PlanList(),
                ),
              ],
            ),
          ),
        ),
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
