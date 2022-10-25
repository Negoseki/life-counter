import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Counter extends StatefulWidget {
  final int rotation;
  const Counter({super.key, this.rotation = 0});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int life = 40;

  _CounterState();

  void handleLifeButton(int amount) {
    setState(() {
      life += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.rotation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => handleLifeButton(-1),
              icon: const Icon(Icons.remove)),
          Text(
            life.toString(),
            style: const TextStyle(fontSize: 128),
          ),
          IconButton(
              onPressed: () => handleLifeButton(1),
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
