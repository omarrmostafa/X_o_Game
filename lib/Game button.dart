import 'package:flutter/material.dart';

class Gamebutton extends StatefulWidget {
  static const String routeName="buttons";
  Function onButtonclick;
  String txt;
  int index;

  Gamebutton(this.txt,this.index,this.onButtonclick, {super.key});

  @override
  State<Gamebutton> createState() => _GamebuttonState();
}

class _GamebuttonState extends State<Gamebutton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                side: const BorderSide(color: Colors.white,width: 2)),
            onPressed: () {
              widget.onButtonclick(widget.index);
            }, child: Text(widget.txt,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40,))));
  }
}
