import 'package:flutter/material.dart';

class GameDrawer extends StatelessWidget {
  const GameDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("game_demo"),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
