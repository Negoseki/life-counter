import 'package:flutter/material.dart';
import 'package:life_counter/components/logo/logo.dart';
import 'package:life_counter/routes/routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void handleNewGame(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.newGame);
  }

  Widget homeButton(String name, Function()? callback) {
    return ElevatedButton(
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Logo(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              homeButton(
                'Iniciar',
                () => handleNewGame(context),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              homeButton(
                'Configurar',
                () => handleNewGame(context),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
