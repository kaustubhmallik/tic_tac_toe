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
  bool _played = false;
  Color _backgroundColor = Colors.white;

  tilePlayed(GameModel game) {
    if (!_played) {
      setState(() {
        if (game.isRedTurn) {
          _backgroundColor = Colors.red;
        } else {
          _backgroundColor = Colors.blue;
        }
        _played = true;
        game.play(widget.row, widget.col);
      });
    }
  }

  bool tileInactive(GameModel game) => _played || game.isComplete();

  @override
  Widget build(BuildContext context) {
    return Consumer<GameModel>(
      builder: (context, game, child) => OutlinedButton(
        onPressed: tileInactive(game) ? () {} : () => tilePlayed(game),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: _backgroundColor,
        ),
        child: const Text(''),
      ),
    );
  }
}
