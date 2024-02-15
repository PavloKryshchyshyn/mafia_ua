import 'package:go_router/go_router.dart';
import 'package:mafia/game_screen.dart';
import 'package:mafia/roles_screen.dart';
import 'package:mafia/home_screen.dart';
import 'package:mafia/offline_mode_screen.dart';

final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) {
        return const HomeScreen();
      }),
      GoRoute(path: '/offline', builder: (context, state) {
        return const OfflineModeScreen();
      }),
      GoRoute(path: '/offline/roles', builder: (context, state) {
        return const RolesScreen();
      }),
      GoRoute(path: '/offline/roles/game', builder: (context, state) {
        return const GameScreen();
      })
    ]
);