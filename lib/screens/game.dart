import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/game.dart';
import 'package:tic_tac_toe/screens/grid.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.title});

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final double _padding = 30;
  final int numRows = 3;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<GameModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Grid(numRows, _padding, state.isRedTurn),
    );
  }
}
