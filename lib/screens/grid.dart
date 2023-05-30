import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/row.dart';

class Grid extends StatefulWidget {
  final int maxRows;
  final double padding;
  final bool isRedTurn;

  const Grid(this.maxRows, this.padding, this.isRedTurn, {Key? key})
      : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    final padding = widget.padding;
    var rows = <Widget>[];
    for (var i = 0; i < widget.maxRows; i++) {
      rows.add(GridRow(i, widget.maxRows, padding, widget.isRedTurn));
      if (i < widget.maxRows - 1) {
        rows.add(SizedBox(
          height: padding,
        ));
      }
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ),
    );
  }
}
