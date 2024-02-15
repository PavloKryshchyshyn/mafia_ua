import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafia/game_manager.dart';
import 'package:mafia/navigation.dart';
import 'package:provider/provider.dart';

const backgroundColor = Color(0xFFBBDEFB);
const primaryColor = Color(0xFF2196F3);
const yellowColor = Color(0xFFFFEB3B);
const textColor = Color(0xFF212121);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameManager.instance)],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Mafia',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.russoOne().fontFamily),
        routerConfig: router,
      ),
    );
  }
}
