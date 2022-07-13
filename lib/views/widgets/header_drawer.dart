import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  HeaderDrawerState createState() => HeaderDrawerState();
}

class HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          const Text(
            "Hey hey hey",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Text(
            "Whoa",
            style: TextStyle(color: Colors.cyanAccent, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
