import 'package:flutter/material.dart';
import 'package:mafia/role.dart';
import 'package:mafia/user.dart';

class GameManager extends ChangeNotifier {
  GameManager._privateConstructor();

  static final GameManager instance = GameManager._privateConstructor();

  List<User> players = [];

  void reset() {
    players.clear();
    notifyListeners();
  }

  void addPlayer(User user) {
    players.add(user);
    notifyListeners();
  }

  void start() {
    for (var i = 0; i < players.length; i++) {
      final player = players[i];
      player.role = Role.none;
    }

    players.shuffle();

    // calculate amount of mafia -1 for boss
    int mafia = players.length ~/ 3 - 1;

    // set mafia boss
    players[0].role = Role.boss;

    // set extra roles for doctor & sheriff
    if (players.length > 7) {
      players[1].role = Role.doctor;
      players[2].role = Role.sheriff;
    }

    // set extra roles for lady & killer
    if (players.length > 9) {
      players[3].role = Role.lady;
      players[4].role = Role.killer;
    }

    // assign roles for players without role
    for (final player in players.where((p) => p.role == Role.none)) {
      if (mafia > 0) {
        player.role = Role.mafia;
        mafia--;
      } else {
        player.role = Role.citizen;
      }
    }
  }
}
