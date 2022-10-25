import 'package:life_counter/utils/players_position.dart';

class PositionOptions {
  PlayerPosition normal;
  PlayerPosition alternate;
  PositionOptions(this.normal, this.alternate);
}

Map<int, PositionOptions> positionByPlayers = {
  6: PositionOptions(
      PlayersPosition.sixPlayers, PlayersPosition.sixPlayersAlternate),
  5: PositionOptions(
      PlayersPosition.fivePlayers, PlayersPosition.fivePlayersAlternate),
  4: PositionOptions(
      PlayersPosition.fourPlayers, PlayersPosition.fourPlayersAlternate),
  3: PositionOptions(
      PlayersPosition.threePlayers, PlayersPosition.threePlayers),
  2: PositionOptions(PlayersPosition.twoPlayers, PlayersPosition.twoPlayers),
};
