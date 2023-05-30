import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final String msg;

  const ElevatedCard(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(msg)),
        ),
      ),
    );
  }
}
