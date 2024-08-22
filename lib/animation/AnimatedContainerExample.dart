import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: Duration(seconds: 1),
            style: TextStyle(
              fontSize: selected ? 40 : 20,
              color: selected ? Colors.blue : Colors.black,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
            child: const Text('Genixbit'),
          ),
        // AnimatedCrossFade(
          //   duration: const Duration(seconds: 2),
          //   firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 200.0),
          //   secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
          //   crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          // )
          // AnimatedContainer(
          //
          //   width: selected ? 200.0 : 100.0,
          //   height: selected ? 100.0 : 200.0,
          //   color: selected ? Colors.red : Colors.blue,
          //   alignment:
          //   selected ? Alignment.center : AlignmentDirectional.topCenter,
          //   duration: const Duration(seconds: 2),
          //   curve: Curves.fastOutSlowIn,
          //   child: const FlutterLogo(size: 75),
          // ),
        ),
      ),
    );
  }
}
