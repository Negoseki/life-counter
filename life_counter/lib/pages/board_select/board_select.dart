import 'package:flutter/material.dart';
import 'package:life_counter/pages/game/game.dart';
import 'package:life_counter/routes/routes.dart';
import 'package:life_counter/utils/players_position.dart';
import 'package:life_counter/utils/position_by_players.dart';

class BoardSelect extends StatelessWidget {
  late final PlayerPosition positionsNormal;
  late final PlayerPosition positionsAlternate;
  final int players;
  BoardSelect(this.players, {super.key}) {
    positionsNormal = positionByPlayers[players]!.normal;
    positionsAlternate = positionByPlayers[players]!.alternate;
  }

  Widget createPosition(PlayerPosition p) {
    return Column(
      children: p
          .map(
            (list) => Row(
              children: list
                  .map(
                    (rotation) => RotatedBox(
                      quarterTurns: rotation,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black54,
                            ),
                            child: const Icon(Icons.person)),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  void handlePositionSelect(BuildContext context, bool alternate) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.game, (route) => route.isFirst,
        arguments: GameArguments(players, alternate: alternate));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () => handlePositionSelect(context, false),
                child: createPosition(positionsNormal),
              ),
              MaterialButton(
                  onPressed: () => handlePositionSelect(context, true),
                  child: createPosition(positionsAlternate)),
            ],
          ),
        ],
      ),
    );
  }
}