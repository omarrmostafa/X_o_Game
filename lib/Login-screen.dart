import 'package:flutter/material.dart';
import 'package:xo_game/X%20O_game.dart';
import 'package:xo_game/players%20name.dart';

class login extends StatelessWidget {
  static const String routeName="login";
  TextEditingController name1Controller=TextEditingController();
  TextEditingController name2Controller=TextEditingController();
  String name1="";
  String name2="";

  login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login for play"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          TextField(
           controller: name1Controller,
           decoration: const InputDecoration(
             label: Text("Name Player one"),
               enabledBorder: OutlineInputBorder(
                   borderSide:BorderSide(width: 3,color: Colors.black87)),
             focusedBorder:OutlineInputBorder(
               borderSide:BorderSide(width: 3,color: Colors.green)
             )
           ),
         ),
          const SizedBox(
           height: 10,
         ),
          TextField(
            controller:name2Controller ,
            decoration: const InputDecoration(
                label: Text("Name Player one"),
                enabledBorder: OutlineInputBorder(
            borderSide:BorderSide(width: 3,color: Colors.black87)),
                focusedBorder:OutlineInputBorder(
                    borderSide:BorderSide(width: 3,color: Colors.green)
                )
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, XoGame.routeName,
            arguments: PlayersName(name1Controller.text, name2Controller.text));
          }, child: const Text("Let is go to play"))
    ]
        ),
      )
    );
  }
}
