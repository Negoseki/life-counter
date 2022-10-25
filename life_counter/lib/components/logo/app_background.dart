import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/background_old.jpg"),
            repeat: ImageRepeat.repeatX,
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            alignment: Alignment(1.0, 1),
          ),
        ),
      ),
      child
    ]);
  }
}
