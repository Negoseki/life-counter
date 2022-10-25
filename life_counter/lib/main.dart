import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_counter/components/logo/app_background.dart';
import 'package:life_counter/pages/board_select/board_select.dart';
import 'package:life_counter/pages/game/game.dart';
import 'package:life_counter/pages/home/home.dart';
import 'package:life_counter/pages/newgame/newgame.dart';
import 'package:life_counter/pages/player_size_select/player_size_select.dart';
import 'package:life_counter/routes/route_arguments.dart';
import 'package:life_counter/routes/routes.dart';
import 'package:life_counter/utils/app_theme.dart';
import 'package:life_counter/utils/players_position.dart';
import 'package:life_counter/utils/position_by_players.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Route<dynamic>? handleGenerateRoutes(RouteSettings settings) {
    if (settings.name == Routes.game) {
      GameArguments args = settings.arguments as GameArguments;
      return MaterialPageRoute(
        builder: (context) => Game(
          playerPositions: args.playerPositions,
        ),
      );
    }

    if (settings.name == Routes.boardSelect) {
      BoardSelectArguments args = settings.arguments as BoardSelectArguments;

      if (positionByPlayers[args.players]!.normal ==
          positionByPlayers[args.players]!.alternate) {
        return MaterialPageRoute(
          builder: (context) => Game(
            playerPositions: positionByPlayers[args.players]!.normal,
          ),
        );
      }

      return MaterialPageRoute(
        builder: (context) => BoardSelect(
          args.players,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Legion Life Counter',
      theme: AppTheme,
      initialRoute: '/home',
      onGenerateRoute: (settings) => handleGenerateRoutes(settings),
      routes: {
        Routes.home: (context) => const AppBackground(child: Home()),
        Routes.newGame: (context) => const AppBackground(child: NewGame()),
        Routes.playerSize: (context) =>
            const AppBackground(child: PlayerSizeSelect()),
      },
    );
  }
}
