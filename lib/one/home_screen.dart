import 'package:flutter/material.dart';
import 'package:sample_menu/category_item.dart';
import 'package:sample_menu/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  bool menuOpen = false;
  double tranx= 0, trany=0, scale = 1.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(tranx, trany, 0)..scale(scale),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(menuOpen ? 30 : 0)),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              !menuOpen? IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                    scale = 0.6;
                    tranx = size.width - 100;
                    trany = (size.height - size.height * scale)/2;
                    setState(() {
                      menuOpen = true;
                    });
                },
                color: Colors.blueAccent,
              ): IconButton(icon: Icon(Icons.arrow_back_ios), color: Colors.blueAccent, onPressed: (){
                   scale = 1.0;
                    tranx = 0;
                    trany = 0;
                    setState(() {
                      menuOpen = false;
                    });
              }),

              IconButton(icon: Icon(Icons.notifications), onPressed: null, color: Colors.blueAccent,)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RaisedButton(color: Colors.grey[100],
            onPressed: (){},
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Expanded(child: Text('What do you want to buy?', style: TextStyle(color: Colors.grey, fontSize: 12))),
                  Icon(Icons.search, size: 16, color: Colors.grey,)
                ]
              ),
            )
          ),
          SizedBox(height: 50),
          Container(
            child: Row(children: List.generate(category.length, (index) {
                var item = category[index];
                return CategoryItem(name: item['name'], image: item['image']);
            }), mainAxisAlignment: MainAxisAlignment.spaceEvenly,)
          )

        ],
      ),
    );
  }
}
