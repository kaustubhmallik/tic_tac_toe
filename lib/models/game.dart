import 'package:flutter/material.dart';

enum Player { red, blue, none }

class GameModel extends ChangeNotifier {
  late List<List<Player>> moves;

  GameModel() {
    moves = List.generate(3, (index) => List<Player>.filled(3, Player.none),
        growable: false);
  }

  bool _isRedTurn = true;

  void switchPlayerTurn() {
    _isRedTurn = !_isRedTurn;
    notifyListeners();
  }

  void play(int row, int col) {
    moves[row][col] = _isRedTurn ? Player.red : Player.blue;
    switchPlayerTurn();
  }

  bool get isRedTurn => _isRedTurn;
}
