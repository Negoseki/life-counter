import 'package:flutter/material.dart';
import 'package:life_counter/components/counter/counter.dart';
import 'package:life_counter/components/logo/logo.dart';
import 'package:life_counter/routes/routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void handleNewGame(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.newGame);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Logo(),
        MaterialButton(
          onPressed: () => handleNewGame(context),
          child: const Text('Novo Jogo'),
        ),
        MaterialButton(
          onPressed: () => {},
          child: const Text('Settings'),
        )
      ],
    ));
  }
}
