import 'package:flutter/material.dart';
import 'package:life_counter/components/counter/counter.dart';
import 'package:life_counter/utils/players_position.dart';

class GameArguments {
  final int players;
  final bool alternate;
  GameArguments(this.players, {this.alternate = false});
}

class Game extends StatelessWidget {
  late final PlayerPosition playerPositions;
  Game({super.key, required players, required alternate}) {
    switch (players) {
      case 6:
        playerPositions = alternate
            ? PlayersPosition.sixPlayersAlternate
            : PlayersPosition.sixPlayers;
        break;
      default:
        playerPositions = PlayersPosition.sixPlayers;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
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
