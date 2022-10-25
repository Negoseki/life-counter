import 'package:flutter/material.dart';
import 'package:life_counter/routes/route_arguments.dart';
import 'package:life_counter/routes/routes.dart';
import 'package:life_counter/utils/position_by_players.dart';

class PlayerSizeSelect extends StatelessWidget {
  const PlayerSizeSelect({super.key});

  void handleSelectButton(BuildContext context, int size) {
    Navigator.of(context)
        .pushNamed(Routes.boardSelect, arguments: BoardSelectArguments(size));
  }

  @override
  Widget build(BuildContext context) {
    const List<int> playerSizes = [3, 4, 5, 6, 7, 8];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 64,
              runSpacing: 64,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: playerSizes
                  .map<Widget>(
                    (e) => ElevatedButton(
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(128, 128))),
                      onPressed: () => handleSelectButton(context, e),
                      child: Text(
                        e.toString(),
                        style: const TextStyle(fontSize: 64),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
