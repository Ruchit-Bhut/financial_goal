import 'package:financial_goal/Screen/Budget%20_Tracking_Screen.dart';
import 'package:financial_goal/Screen/Fourth_Screen.dart';
import 'package:financial_goal/Screen/Second_Screen.dart';
import 'package:financial_goal/Screen/Third_Screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    SecondScreen(),
    ThirdScreen(),
    BudgetTrackingScreen(),
    FourthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Set to fixed for equal space
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
              color: _selectedIndex == 0 ? Color(0xff222172) : Color(0xffa8a8c6),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sync,
              size: 40,
              color: _selectedIndex == 1 ? Color(0xff222172) : Color(0xffa8a8c6),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/piechart.png', height: 30, color: _selectedIndex == 2 ? Color(0xff222172) : Color(0xffa8a8c6)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 40,
              color: _selectedIndex == 3 ? Color(0xff222172) : Color(0xffa8a8c6),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff222172), // Set the text color for the selected item
        unselectedItemColor: Color(0xffa8a8c6), // Set the text color for unselected items
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
