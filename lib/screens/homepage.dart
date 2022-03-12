import 'package:flutter/material.dart';
import 'package:nimaz_time_api/screens/month.dart';
import 'package:nimaz_time_api/screens/today.dart';
import 'package:nimaz_time_api/screens/week.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pages = <Widget>[
    const Today(),
    const Week(),
    const Month(),
  ];
  var _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _isSelected = index;
          });
        },
        currentIndex: _isSelected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Today'),
          BottomNavigationBarItem(icon: Icon(Icons.next_week), label: 'Week'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded), label: 'Month'),
        ],
      ),
      body: pages[_isSelected],
    );
  }
}
