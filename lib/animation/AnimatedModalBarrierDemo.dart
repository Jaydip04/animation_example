import 'package:flutter/material.dart';

class AnimatedModalBarrierDemo extends StatefulWidget {
  @override
  _AnimatedModalBarrierDemoState createState() =>
      _AnimatedModalBarrierDemoState();
}

class _AnimatedModalBarrierDemoState extends State<AnimatedModalBarrierDemo> {
  bool _isShowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedModalBarrier Demo')),
      // body:

      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isShowing = !_isShowing;
                });
              },
              child: Text(_isShowing ? 'Hide Modal' : 'Show Modal'),
            ),
          ),
          if (_isShowing)
            AnimatedModalBarrier(
              color: _isShowing
                  ? AlwaysStoppedAnimation<Color>(Colors.black.withOpacity(0.5))
                  : AlwaysStoppedAnimation<Color>(Colors.transparent),
              dismissible: true,
            ),
          if(_isShowing)
    Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isShowing = !_isShowing;
          });
        },
        child: Text(_isShowing ? 'Hide Modal' : 'Show Modal'),
      ),
    ),
        ],
      ),
    );
  }
}

