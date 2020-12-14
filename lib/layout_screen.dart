import 'package:flutter/material.dart';
import 'package:sample_menu/drawer_screen.dart';
import 'package:sample_menu/home_screen.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  final Duration duration = Duration(milliseconds: 300);

@override
  void initState() {
    _controller = AnimationController(duration: duration, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
          DrawerScreen(controller: _controller,),
          HomeScreen(controller: _controller, duration: duration,)
      ],),
    );
  }
}