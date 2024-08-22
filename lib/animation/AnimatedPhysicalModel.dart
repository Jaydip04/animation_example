import 'package:flutter/material.dart';

class AnimatedPhysicalModelDemo extends StatefulWidget {
  @override
  _AnimatedPhysicalModelDemoState createState() =>
      _AnimatedPhysicalModelDemoState();
}

class _AnimatedPhysicalModelDemoState extends State<AnimatedPhysicalModelDemo> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPhysicalModel Demo')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedPhysicalModel(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            elevation: _isElevated ? 10 : 0,
            shape: BoxShape.rectangle,
            shadowColor: Colors.black,
            color: Colors.blue,
            borderRadius: _isElevated
                ? BorderRadius.circular(20)
                : BorderRadius.circular(0),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Tap me!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

