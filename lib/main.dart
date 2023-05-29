import 'package:flutter/material.dart';
import 'package:tic_tac_toe/common/theme.dart';

import 'screens/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: appTheme,
      home: const Game(title: 'Tic-Tac-Toe'),
    );
  }
}
