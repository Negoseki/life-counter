import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_counter/utils/mtg_colors.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animLogo;
  late final Animation<double> _animIcon;
  final double halfSize = 30.0;
  final double boxSize = 200.0;
  final double iconSize = 60;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();

    var curve = const Cubic(0.9, 0.3, 0.3, 0.9);
    _animLogo = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: curve));
    _animIcon = Tween(begin: 1.0, end: 0.0)
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

  Widget logoWidget(String img, double left, double top, Color color) {
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
              height: iconSize - 8,
              width: iconSize - 8,
              color: color,
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: boxSize,
          height: boxSize,
          child: RotationTransition(
            turns: _animLogo,
            child: Stack(
              children: [
                logoWidget(
                  'W.svg',
                  boxSize * 0.5 - halfSize,
                  0,
                  MTGColors.white,
                ),
                logoWidget(
                  'U.svg',
                  boxSize - halfSize * 2,
                  boxSize * 0.1 + halfSize,
                  MTGColors.blue,
                ),
                logoWidget(
                  'G.svg',
                  0,
                  boxSize * 0.1 + halfSize,
                  MTGColors.green,
                ),
                logoWidget(
                  'B.svg',
                  halfSize,
                  boxSize * 0.9 - halfSize * 1.5,
                  MTGColors.black,
                ),
                logoWidget(
                  'R.svg',
                  boxSize - halfSize * 2.5,
                  boxSize * 0.9 - halfSize * 1.5,
                  MTGColors.red,
                ),
              ],
            ),
          ),
        ),
        const Text(
          'Legion',
          style: TextStyle(fontSize: 64),
        ),
        const Text(
          'Life Counter',
          style: TextStyle(fontSize: 32),
        )
      ],
    );
  }
}
