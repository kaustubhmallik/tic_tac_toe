import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final int row;
  final int col;

  const Tile(this.row, this.col, {super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool _played = false;

  tilePlayed() {
    if (!_played) {
      print('row: ${widget.row}, col: ${widget.col}');
      setState(() {
        _played = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _played ? null : tilePlayed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(80, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(''),
    );
  }
}
