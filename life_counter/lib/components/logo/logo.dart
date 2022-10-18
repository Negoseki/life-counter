import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animLogo;
  late final Animation<double> _animIcon;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();

    var curve = const Cubic(0.9, 0.3, 0.3, 0.9);
    _animLogo = Tween(begin: 0.0, end: 5.0)
        .animate(CurvedAnimation(parent: _controller, curve: curve));
    _animIcon = Tween(begin: 5.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: curve));

    setState(() {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget logoWidget(String img, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: RotationTransition(
        turns: _animIcon,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/imgs/$img',
              height: 30,
              width: 30,
              color: Colors.black87,
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const boxSize = 130.0;
    const halfSize = 23.0;
    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: RotationTransition(
        turns: _animLogo,
        child: Stack(
          children: [
            logoWidget('W.svg', boxSize * 0.5 - halfSize, 0),
            logoWidget(
                'U.svg', boxSize - halfSize * 2, boxSize * 0.1 + halfSize),
            logoWidget('G.svg', 0, boxSize * 0.1 + halfSize),
            logoWidget('B.svg', halfSize, boxSize * 0.9 - halfSize * 1.5),
            logoWidget('R.svg', boxSize - halfSize * 2.5,
                boxSize * 0.9 - halfSize * 1.5),
          ],
        ),
      ),
    );
  }
}
