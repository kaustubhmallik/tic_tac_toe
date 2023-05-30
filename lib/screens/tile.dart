import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/game.dart';

class Tile extends StatefulWidget {
  final int row;
  final int col;
  final bool isRedTurn;

  const Tile(this.row, this.col, this.isRedTurn, {super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  tilePlayed(GameModel game) {
    if (!game.isTilePlayed(widget.row, widget.col)) {
      game.play(widget.row, widget.col);
    }
  }

  bool isTileInactive(GameModel game) =>
      game.isTilePlayed(widget.row, widget.col) || game.isComplete();

  Color calculateBackgroundColor(GameModel game) {
    final player = game.tilePlayedBy(widget.row, widget.col);
    switch (player) {
      case Player.red:
        return Colors.red;
      case Player.blue:
        return Colors.blue;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameModel>(
      builder: (context, game, child) => OutlinedButton(
        onPressed: isTileInactive(game) ? () {} : () => tilePlayed(game),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: calculateBackgroundColor(game),
        ),
        child: const Text(''),
      ),
    );
  }
}
