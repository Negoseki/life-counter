import 'package:flutter/material.dart';
import 'package:life_counter/components/counter/counter.dart';
import 'package:life_counter/utils/players_position.dart';

class Game extends StatelessWidget {
  final PlayerPosition playerPositions;
  const Game({
    super.key,
    required this.playerPositions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: playerPositions
            .map(
              (list) => Expanded(
                child: Row(
                  children: list
                      .map(
                        (rotation) => Expanded(
                          child: Counter(rotation: rotation),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
