import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Quiz.dart';
import 'result.dart';
import 'constants.dart';
import 'Quiz.dart';
import 'HeaderDrawer.dart';
import 'Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSelections.dashboard;

  @override
  Widget build(BuildContext context) {
    var contents;
    if (currentPage == DrawerSelections.dashboard) {
      contents = Dashboard();
    } else if (currentPage == DrawerSelections.quiz) {
      contents = Quiz();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "What an insanely good app",
          ),
        ),
        body: contents,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  HeaderDrawer(),
                  drawerList(),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget drawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSelections.dashboard ? true : false),
          menuItem(2, "Notes", Icons.abc_outlined,
              currentPage == DrawerSelections.notes ? true : false),
          menuItem(3, "Quiz", Icons.analytics_outlined,
              currentPage == DrawerSelections.quiz ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSelections.dashboard;
            } else if (id == 3) {
              currentPage = DrawerSelections.quiz;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  child: Text(
                title,
                style: TextStyle(color: Colors.black),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSelections {
  dashboard,
  notes,
  quiz,
}
