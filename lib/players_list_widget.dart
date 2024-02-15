import 'package:flutter/material.dart';
import 'package:mafia/player_list_item_widget.dart';
import 'package:mafia/user.dart';

class PlayersListWidget extends StatelessWidget {
  final List<User> players;
  const PlayersListWidget({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    if (players.isEmpty) {
      return const Center(child: Text("Покищо немає гравців"));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...players.map((p) => PlayerListItemWidget(player: p))
      ],
    );
  }
}
