import 'dart:math';

import 'package:flutter/material.dart';

class AppBackground extends StatefulWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  State<AppBackground> createState() => _AppBackgroundState();
}

class _AppBackgroundState extends State<AppBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
    animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(-animation.value, 0),
            child: Container(
              width: 1920,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/imgs/background.jpg"),
                  repeat: ImageRepeat.repeatX,
                  fit: BoxFit.fitHeight,
                  alignment: FractionalOffset(animation.value, 0),
                ),
              ),
            ),
          );
        },
      ),
      widget.child
    ]);
  }
}
