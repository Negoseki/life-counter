import 'package:life_counter/pages/board_select/board_select.dart';
import 'package:life_counter/utils/players_position.dart';

class GameArguments {
  final PlayerPosition playerPositions;
  GameArguments(this.playerPositions);
}

class BoardSelectArguments {
  final int players;
  BoardSelectArguments(this.players);
}
