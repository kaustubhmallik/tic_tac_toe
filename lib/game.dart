import 'package:flutter/material.dart';
import 'package:tic_tac_toe/grid.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.title});

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final double _padding = 30;
  final int numRows = 3;
  bool redTurn = true; // first turn red

  void _incrementCounter() {
    setState(() {
      redTurn = !redTurn; // toggle b/w red and blue's turn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Grid(numRows, _padding),
    );
  }
}