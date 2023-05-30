import 'package:flutter/material.dart';

enum Player { red, blue, none }

class GameModel extends ChangeNotifier {
  late List<List<Player>> _moves;
  int _movesCount = 0;
  final int row, col;

  GameModel(this.row, this.col) {
    _moves = List.generate(
        row, (index) => List<Player>.filled(col, Player.none),
        growable: false);
  }

  bool _isRedTurn = true;

  void _switchPlayerTurn() {
    _isRedTurn = !_isRedTurn;
  }

  Player tilePlayedBy(int row, col) => _moves[row][col];

  bool isTilePlayed(int row, col) => _moves[row][col] != Player.none;

  void play(int row, int col) {
    _movesCount++;
    _moves[row][col] = _isRedTurn ? Player.red : Player.blue;
    _switchPlayerTurn();
    notifyListeners();
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

  bool isAllMovesPlayed() => _movesCount == row * col;

  bool isRedWinner() => isPlayerWinner(Player.red);

  bool isBlueWinner() => isPlayerWinner(Player.blue);

  bool isPlayerWinner(Player player) =>
      isRowFilled(player) || isColumnFilled(player) || isDiagonalFilled(player);

  bool isRowFilled(Player player) =>
      _moves.any((row) => row.every((element) => element == player));

  bool isColumnFilled(Player player) =>
      _moves.every((row) => row.first == player) ||
      _moves.every((row) => row[1] == player) ||
      _moves.every((row) => row.last == player);

  bool isDiagonalFilled(Player player) {
    int leftIdx = 0, rightIdx = 2;
    return _moves.every((element) => element[leftIdx++] == player) ||
        _moves.every((element) => element[rightIdx--] == player);
  }

  bool get isRedTurn => _isRedTurn;

  void reset() {
    _moves = List.generate(
        row, (index) => List<Player>.filled(col, Player.none),
        growable: false);
    _isRedTurn = true;
    _movesCount = 0;
    notifyListeners();
  }
}
