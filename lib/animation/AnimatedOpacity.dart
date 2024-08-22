import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedopacityDemo extends StatefulWidget {
  const AnimatedopacityDemo({super.key});

  @override
  State<AnimatedopacityDemo> createState() => _AnimatedopacityDemoState();
}

class _AnimatedopacityDemoState extends State<AnimatedopacityDemo> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.2);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          child: const FlutterLogo(size: 100.0,),
        ),
        ElevatedButton(
          onPressed: _changeOpacity,
          child: const Text('Fade Logo'),
        ),
      ],
    );
  }
}
