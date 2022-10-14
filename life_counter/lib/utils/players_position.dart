class PlayerRotation {
  static int up = 0;
  static int left = 3;
  static int right = 1;
  static int down = 2;
}

typedef PlayerPosition = List<List<int>>;

class PlayersPosition {
  static PlayerPosition sixPlayers = [
    [PlayerRotation.down],
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.up]
  ];

  static PlayerPosition sixPlayersAlternate = [
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.right, PlayerRotation.left],
  ];
}
