import 'package:life_counter/utils/players_position.dart';

class PositionOptions {
  PlayerPosition normal;
  PlayerPosition alternate;
  PositionOptions(this.normal, this.alternate);
}

Map<int, PositionOptions> positionByPlayers = {
  6: PositionOptions(
      PlayersPosition.sixPlayers, PlayersPosition.sixPlayersAlternate)
};
