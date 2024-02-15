import 'package:flutter/material.dart';
import 'package:mafia/role.dart';
import 'package:mafia/user.dart';

class PlayerListItemWidget extends StatelessWidget {
  final User player;
  const PlayerListItemWidget({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (player.role != Role.none)
            Image.asset("assets/images/${player.role.name}.jpg"),
          Text(player.name, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
