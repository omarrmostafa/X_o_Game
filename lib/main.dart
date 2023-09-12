import 'package:flutter/material.dart';
import 'package:xo_game/Login-screen.dart';
import 'package:xo_game/X%20O_game.dart';


void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var game;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute:login.routeName,
        routes: {
          login.routeName: (context)=>login(),
          XoGame.routeName: (context)=> const XoGame(),
        }
    );
  }
}
