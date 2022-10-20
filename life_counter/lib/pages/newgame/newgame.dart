import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_counter/pages/game/game.dart';
import 'package:life_counter/routes/routes.dart';

class NewGame extends StatelessWidget {
  const NewGame({super.key});

  void handlePVPAction(BuildContext context) {
    Navigator.of(context)
        .pushNamed(Routes.boardSelect, arguments: GameArguments(6));
  }

  @override
  Widget build(BuildContext context) {
    double imgHeight = (MediaQuery.of(context).size.height / 2) - 5;
    double dividerWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => handlePVPAction(context),
            child: SvgPicture.asset(
              'assets/icons/tabletop-players.svg',
              height: imgHeight,
              color: Colors.black54,
            ),
          ),
          Container(
            width: dividerWidth,
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: SvgPicture.asset(
              'assets/icons/round-table.svg',
              height: imgHeight,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
