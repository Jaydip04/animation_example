import 'package:flutter/material.dart';

class FadeTransitionExampleApp extends StatelessWidget {
  const FadeTransitionExampleApp({super.key});

  static const Duration duration = Duration(seconds: 2);
  static const Curve curve = Curves.easeIn;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FadeTransitionExample(
        duration: duration,
        curve: curve,
      ),
    );
  }
}

class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;

  final Curve curve;

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}
class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: true);
  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  );

  @override
  void didUpdateWidget(FadeTransitionExample oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller
        ..duration = widget.duration
        ..repeat(reverse: true);
    }

    if (oldWidget.curve != widget.curve) {
      _animation.curve = widget.curve;
    }
  }

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
