import 'package:flutter/material.dart';
import 'package:plasmavid/screens/homepage.dart';
import 'package:plasmavid/screens/userdonerlist.dart';
import 'package:plasmavid/widgets/MyDrawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  void initState() {
    _pages = [
      {
        'page': MyHomePage(),
        'title': 'PlasmaVid',
      },
      {
        'page': UserDonerList(),
        'title': 'Your List',
      }
    ];
    super.initState();
  }

  int _selectPageIndex = 0;
  void _selectPage(index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectPageIndex]['title'])),
      drawer: MyDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'DonerList',
          ),
        ],
      ),
    );
  }
}
