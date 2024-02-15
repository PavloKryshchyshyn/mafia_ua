import 'package:flutter/material.dart';
import 'package:mafia/main.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: backgroundColor,
        body: Center(child: Text("Гра почалась")));
  }
}
