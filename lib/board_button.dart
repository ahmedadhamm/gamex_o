import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  Function onPlayerClickCallBack;
  int index;

  BoardButton(this.text, this.onPlayerClickCallBack, this.index);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(1),
          child: ElevatedButton(
              onPressed: () {
                onPlayerClickCallBack(index);
              },
              child: Text(
                text,
                style: const TextStyle(fontSize: 30),
              )),
        ));
  }
}
