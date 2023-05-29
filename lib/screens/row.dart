import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/tile.dart';

class GridRow extends StatefulWidget {
  final int index;
  final double padding;
  final int maxCols;

  const GridRow(this.index, this.maxCols, this.padding, {Key? key})
      : super(key: key);

  @override
  State<GridRow> createState() => _GridRowState();
}

class _GridRowState extends State<GridRow> {
  @override
  Widget build(BuildContext context) {
    final rowIdx = widget.index;
    final padding = widget.padding;
    var tiles = <Widget>[];
    for (var colIdx = 0; colIdx < widget.maxCols; colIdx++) {
      tiles.add(Tile(rowIdx, colIdx));
      if (colIdx < widget.maxCols - 1) {
        tiles.add(SizedBox(width: padding));
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: tiles,
    );
  }
}
