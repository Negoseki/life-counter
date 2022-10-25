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

  static PlayerPosition fivePlayers = [
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.up],
  ];

  static PlayerPosition fivePlayersAlternate = [
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.right],
  ];

  static PlayerPosition fourPlayers = [
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.right, PlayerRotation.left],
  ];

  static PlayerPosition fourPlayersAlternate = [
    [PlayerRotation.down],
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.up],
  ];

  static PlayerPosition threePlayers = [
    [PlayerRotation.right, PlayerRotation.left],
    [PlayerRotation.up],
  ];

  static PlayerPosition twoPlayers = [
    [PlayerRotation.down],
    [PlayerRotation.up],
  ];
}
