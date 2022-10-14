import 'package:flutter/material.dart';
import 'package:life_counter/components/counter/counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void handleNewGame(BuildContext context) {
    Navigator.of(context).pushNamed('/newgame');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
