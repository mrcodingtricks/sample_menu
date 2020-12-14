import 'package:flutter/material.dart';
import 'package:sample_menu/category_item.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  final AnimationController controller;
  final Duration duration;

  const HomeScreen({Key key, this.controller, this.duration}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool menuOpen = false;
  Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    if (_scaleAnimation == null){
      _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(widget.controller);
    }
    var size = MediaQuery.of(context).size;

    return AnimatedPositioned(
        duration: widget.duration,
       top: 0,
       bottom: 0,
       left: menuOpen ? 0.6 * size.width : 0,
       right: menuOpen ? -0.4 * size.width : 0,
        child: ScaleTransition(
          scale: _scaleAnimation,
                  child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  !menuOpen ? IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                        setState(() {
                          widget.controller.forward();
                          menuOpen = true;
                        });
                    },
                    color: Colors.blueAccent,
                  ):IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                        setState(() {
                          widget.controller.reverse();
                          menuOpen = false;
                        });
                    },
                    color: Colors.blueAccent,
                  ),

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
      ),
        ),
    );
  }
}
