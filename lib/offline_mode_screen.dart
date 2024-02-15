import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mafia/add_user_dialog_widget.dart';
import 'package:mafia/game_manager.dart';
import 'package:mafia/main.dart';
import 'package:mafia/players_list_widget.dart';
import 'package:mafia/role.dart';
import 'package:mafia/user.dart';
import 'package:provider/provider.dart';

class OfflineModeScreen extends StatefulWidget {
  const OfflineModeScreen({super.key});

  @override
  State<OfflineModeScreen> createState() => _OfflineModeScreenState();
}

class _OfflineModeScreenState extends State<OfflineModeScreen> {
  @override
  void initState() {
    super.initState();

    GameManager.instance.reset();
    //TODO: коли треба - закоментувати верхній рядок, коли потрібно зберегти ролі
  }

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<GameManager>(context);
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text("Нова гра"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: PlayersListWidget(players: manager.players),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: yellowColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () async {
                        final name = await showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return const AddUserDialogWidget();
                            });

                        if (name == null) {
                          return;
                        }

                        manager.addPlayer(User(Role.none, name));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text("Добавити гравця",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      )),
                  const SizedBox(height: 8),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: yellowColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: manager.players.length < 4
                          ? null
                          : () {
                              context.push("/offline/roles");
                            },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Text("Розподілити ролі",
                            style: TextStyle(
                                color: manager.players.length < 4
                                    ? null
                                    : textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
