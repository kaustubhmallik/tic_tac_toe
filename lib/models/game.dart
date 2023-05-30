import 'package:flutter/material.dart';

enum Player { red, blue, none }

class GameModel extends ChangeNotifier {
  late List<List<Player>> moves;
  int movesCount = 0;
  final int row, col;

  GameModel(this.row, this.col) {
    moves = List.generate(row, (index) => List<Player>.filled(col, Player.none),
        growable: false);
  }

  bool _isRedTurn = true;

  void switchPlayerTurn() {
    _isRedTurn = !_isRedTurn;
    notifyListeners();
  }

  void play(int row, int col) {
    movesCount++;
    moves[row][col] = _isRedTurn ? Player.red : Player.blue;
    switchPlayerTurn();
  }

  String gameSummary() {
    if (!isComplete()) {
      return '';
    }
    if (isRedWinner()) {
      return 'Red Wins!';
    } else if (isBlueWinner()) {
      return 'Blue Wins!';
    } else {
      return 'Game Draw!';
    }
  }

  bool isComplete() => isRedWinner() || isBlueWinner() || isAllMovesPlayed();

  bool isAllMovesPlayed() => movesCount == row * col;

  bool isRedWinner() => isPlayerWinner(Player.red);

  bool isBlueWinner() => isPlayerWinner(Player.blue);

  bool isPlayerWinner(Player player) =>
      isRowFilled(player) || isColumnFilled(player) || isDiagonalFilled(player);

  bool isRowFilled(Player player) =>
      moves.any((row) => row.every((element) => element == player));

  bool isColumnFilled(Player player) =>
      moves.every((row) => row.first == player) ||
      moves.every((row) => row[1] == player) ||
      moves.every((row) => row.last == player);

  bool isDiagonalFilled(Player player) {
    int leftIdx = 0, rightIdx = 2;
    return moves.every((element) => element[leftIdx++] == player) ||
        moves.every((element) => element[rightIdx--] == player);
  }

  bool get isRedTurn => _isRedTurn;
}
