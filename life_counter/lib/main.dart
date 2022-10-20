import 'package:flutter/material.dart';
import 'package:life_counter/components/logo/app_background.dart';
import 'package:life_counter/pages/board_select/board_select.dart';
import 'package:life_counter/pages/game/game.dart';
import 'package:life_counter/pages/home/home.dart';
import 'package:life_counter/pages/newgame/newgame.dart';
import 'package:life_counter/routes/routes.dart';

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
          players: args.players,
          alternate: args.alternate,
        ),
      );
    }

    if (settings.name == Routes.boardSelect) {
      GameArguments args = settings.arguments as GameArguments;
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
    return MaterialApp(
      title: 'Legion Life Counter',
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF460000),
          onPrimary: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      initialRoute: '/home',
      onGenerateRoute: (settings) => handleGenerateRoutes(settings),
      routes: {
        Routes.home: (context) => const AppBackground(child: Home()),
        Routes.newGame: (context) => const AppBackground(child: NewGame()),
      },
    );
  }
}
