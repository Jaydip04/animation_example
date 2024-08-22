import 'package:flutter/material.dart';

class Animatedbuilderexample extends StatefulWidget {
  const Animatedbuilderexample({super.key});

  @override
  State<Animatedbuilderexample> createState() => _AnimatedbuilderexampleState();
}

class _AnimatedbuilderexampleState extends State<Animatedbuilderexample> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Genixbit'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.0,
          child: child,
        );
      },
    );;
  }
}
