import 'package:flutter/material.dart';
import 'package:life_counter/routes/route_arguments.dart';
import 'package:life_counter/routes/routes.dart';
import 'package:life_counter/utils/position_by_players.dart';

class NewGame extends StatelessWidget {
  const NewGame({super.key});

  void handlePVPAction(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.boardSelect,
        arguments: GameArguments(positionByPlayers[2]!.normal));
  }

  void handleGropupAction(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.playerSize);
  }

  @override
  Widget build(BuildContext context) {
    double padding = 8.0;
    double imgHeight = (MediaQuery.of(context).size.height / 2) - 5 - padding;
    double dividerWidth = MediaQuery.of(context).size.width * 0.9 - padding;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => handlePVPAction(context),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: dividerWidth,
                    maxHeight: imgHeight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.person,
                        size: dividerWidth / 2.5,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'VS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: (dividerWidth / 2) * 0.5,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.person,
                        size: dividerWidth / 2.5,
                      )
                    ],
                  ),
                )),
            Container(
              width: dividerWidth,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => handleGropupAction(context),
              child: Container(
                alignment: Alignment.center,
                height: imgHeight,
                child: Icon(
                  Icons.groups_sharp,
                  size: dividerWidth / 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
