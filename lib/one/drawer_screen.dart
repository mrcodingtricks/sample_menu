import 'package:flutter/material.dart';
import 'package:sample_menu/menu_item.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
            SizedBox(height: 50),
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 16),
                Expanded(child:  Text('Coding Tricks', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))
              ]
            ),
            SizedBox(height: 30),
            MenuItem(title: 'Home', icon: Icons.home),
            MenuItem(title: 'My Account', icon: Icons.person),
            MenuItem(title: 'My Orders', icon: Icons.history),
            MenuItem(title: 'Wishlist', icon: Icons.list),
            MenuItem(title: 'Settings', icon: Icons.settings,),
            MenuItem(title: 'Logout', icon: Icons.exit_to_app) 
        ]
      ),
    );
  }
}