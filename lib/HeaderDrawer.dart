import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
           margin: EdgeInsets.only(bottom: 10),
           height: 70,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
           ),
          ),
        Text("Heeeey hey hey", style: TextStyle(color: Colors.white, fontSize: 20),),
        Text("Whoa", style: TextStyle(color: Colors.cyanAccent, fontSize: 10),),
        ],
      ),
    );
  }
}