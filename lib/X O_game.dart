import 'package:flutter/material.dart';
import 'package:xo_game/Game%20button.dart';

import 'players name.dart';

class XoGame extends StatefulWidget {
  const XoGame({super.key});
  static const String routeName="game";


  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
   int score1 = 0;
   int score2 = 0;
  List<String> board = [
    "", "", "",
    "", "", "",
    "", "", "",
  ];
  @override
  Widget build(BuildContext context) {
    PlayersName args=ModalRoute.of(context)?.settings.arguments as PlayersName;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("X-O Game")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(args.name1,
                      style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                    ),
                    Text("$score1",
                        style:
                        const TextStyle(fontSize: 20, color: Colors.deepOrange)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(args.name2,
                        style:
                        TextStyle(fontSize: 20, color: Colors.lightGreen)),
                    Text('$score2',
                        style:
                        const TextStyle(fontSize: 20, color: Colors.lightGreen)),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gamebutton(board[0],0, onButtonclick),
                Gamebutton(board[1], 1, onButtonclick),
                Gamebutton(board[2], 2, onButtonclick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gamebutton(board[3], 3, onButtonclick),
                Gamebutton(board[4], 4, onButtonclick),
                Gamebutton(board[5], 5, onButtonclick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gamebutton(board[6], 6, onButtonclick),
                Gamebutton(board[7], 7, onButtonclick),
                Gamebutton(board[8], 8, onButtonclick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 1;

  resetboard(){
    board = [
      "", "", "",
      "", "", "",
      "", "", "",

    ];
    counter=0;
  }
  onButtonclick(index) {
    if (board[index].isNotEmpty) {
      return;
    }
    if (counter.isOdd) {
      board[index] = "X";
      bool win = checkWinner("X");
      if (win) {
        score1 += 10;
        resetboard();
      }
    }
    else {
      board[index] = "O";
      bool win = checkWinner("O");
      if (win) {
        score2 += 10;
        resetboard();
      }
    }
    if(counter==9){
      resetboard();
    }
    counter++;
    setState(() {});
  }

  checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == symbol && board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol && board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }
}
