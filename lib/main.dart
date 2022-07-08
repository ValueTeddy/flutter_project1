import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Quiz.dart';
import 'Quiz.dart';
import 'HeaderDrawer.dart';
import 'Dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  var currentPage = DrawerSelections.dashboard;

  @override
  Widget build(BuildContext context) {
    StatefulWidget contents = HomePage();
    if (currentPage == DrawerSelections.dashboard) {
      contents = Dashboard();
    } else if (currentPage == DrawerSelections.quiz) {
      contents = Quiz();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "What an insanely good app",
          ),
        ),
        body: contents,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderDrawer(),
                drawerList(),
              ],
            ),
          ),
        ),
      );
  }

  Widget drawerList() {
    return Container(
      padding: const EdgeInsets.only(
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
          padding: const EdgeInsets.all(15),
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
                style: const TextStyle(color: Colors.black),
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
