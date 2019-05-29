import 'package:first_flutter/resource/MyColors.dart';
import 'package:first_flutter/ui/category/CategoryPage.dart';
import 'package:first_flutter/ui/home/HomePage.dart';
import 'package:first_flutter/ui/other/OtherPage.dart';
import 'package:first_flutter/ui/personal/PersonalPage.dart';
import 'package:first_flutter/util/LogUtil.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            accentColor: Colors.black, primaryColor: MyColors.colorPrimary),
        home: Index(title: ''));
  }
}

class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return Main();
  }
}

class Main extends State<Index> with SingleTickerProviderStateMixin {
  TabController tabController;
  int currentIndex = 0;
  var mainTitles = ['首页', '发现', '其他', '我的'];
  List<BottomNavigationBarItem> items;

  final bodyList = [
    Home(),
    Category(),
    Other(),
    Personal(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          title: Text(
            mainTitles[0],
          ),
          activeIcon: Icon(Icons.home, color: Colors.orange)),
      BottomNavigationBarItem(
          icon: Icon(Icons.category, color: Colors.black),
          title: Text(
            mainTitles[1],
          ),
          activeIcon: Icon(Icons.category, color: Colors.orange)),
      BottomNavigationBarItem(
          icon: Icon(Icons.devices_other, color: Colors.black),
          title: Text(
            mainTitles[2],
          ),
          activeIcon: Icon(Icons.devices_other, color: Colors.orange)),
      BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.black),
          title: Text(
            mainTitles[3],
          ),
          activeIcon: Icon(Icons.person, color: Colors.orange))
    ];
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainTitles[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.orange),
      body: IndexedStack(
        index: currentIndex,
        children: bodyList,
      ),
    );
  }
}
