import 'package:flutter/material.dart';
import 'package:sample_menu/layout_screen.dart';

void main() {
  runApp( MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LayoutScreen(),
    ));
}