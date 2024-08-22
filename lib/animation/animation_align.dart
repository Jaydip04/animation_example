import 'package:flutter/material.dart';

class AnimatedAlignExampleApp extends StatelessWidget {
  const AnimatedAlignExampleApp({super.key});

  static const Duration duration = Duration(seconds: 3);
  // static const Curve curve = Curves.fastOutSlowIn;
  // static const Curve curve = Curves.bounceIn;
  // static const Curve curve = Curves.bounceInOut;
  // static const Curve curve = Curves.bounceOut;
  // static const Curve curve = Curves.decelerate;
  // static const Curve curve = Curves.linear;
  // static const Curve curve = Curves.ease;
  // static const Curve curve = Curves.easeIn;
  // static const Curve curve = Curves.easeInBack;
  // static const Curve curve = Curves.easeInCirc;
  // static const Curve curve = Curves.easeInCubic;
  // static const Curve curve = Curves.fastOutSlowIn;
  // static const Curve curve = Curves.easeInExpo;
  static const Curve curve = Curves.easeInOutBack;
  // static const Curve curve = Curves.easeInOutQuad;
  // static const Curve curve = Curves.fastEaseInToSlowEaseOut;
  // static const Curve curve = Curves.slowMiddle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedAlign Sample')),
        body: const AnimatedAlignExample(
          duration: duration,
          curve: curve,
        ),
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;

  final Curve curve;

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: 250.0,
          height: 250.0,
          color: Colors.red,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: widget.duration,
            curve: widget.curve,
            heightFactor: 400.0,
            widthFactor: 400.0,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
}
