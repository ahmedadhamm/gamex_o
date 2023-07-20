import 'package:flutter/material.dart';

import 'board_button.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = 'board';

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardStat = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int Palyer1Score = 0;
  int Palyer2Score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('RouteGames'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'Player 1 (x)',
                      style: TextStyle(fontSize: 27),
                    ),
                    Text(
                      'Score : $Palyer1Score',
                      style: const TextStyle(fontSize: 28),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Player 2 (O)',
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      'Score : $Palyer2Score',
                      style: const TextStyle(fontSize: 28),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(boardStat[0], onPlayerClick, 0),
                BoardButton(boardStat[1], onPlayerClick, 1),
                BoardButton(boardStat[2], onPlayerClick, 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(boardStat[3], onPlayerClick, 3),
                BoardButton(boardStat[4], onPlayerClick, 4),
                BoardButton(boardStat[5], onPlayerClick, 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(boardStat[6], onPlayerClick, 6),
                BoardButton(boardStat[7], onPlayerClick, 7),
                BoardButton(boardStat[8], onPlayerClick, 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onPlayerClick(int index) {
    if (boardStat[index].isNotEmpty) {
      return;
    }
    print('player clicked on button $index');

    if (counter % 2 == 0) {
      boardStat[index] = 'X';
      Palyer1Score++;
    } else {
      boardStat[index] = 'O';
      Palyer2Score++;
    }
    counter++;

    if (checkWinner('X')) {
      //X is Winner
      Palyer1Score += 5;
      resetBoard();
    } else if (checkWinner('O')) {
      //O is Winner
      Palyer2Score += 5;
      resetBoard();
    } else if (counter == 9) {
      //Darw
      resetBoard();
    }

    setState(() {});
  }

  void resetBoard() {
    boardStat = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
  }

  bool checkWinner(String playerSbmbol) {
    //for rows
    for (int i = 0; i > 9; i += 3) {
      if (boardStat[i] == playerSbmbol &&
          boardStat[i + 1] == playerSbmbol &&
          boardStat[i + 2] == playerSbmbol) {
        return true;
      }
    }
    //for coulms
    for (int i = 0; i > 3; i++) {
      if (boardStat[i] == playerSbmbol &&
          boardStat[i + 3] == playerSbmbol &&
          boardStat[i + 6] == playerSbmbol) {
        return true;
      }
    }
    if (boardStat[0] == playerSbmbol &&
        boardStat[4] == playerSbmbol &&
        boardStat[8] == playerSbmbol) {
      return true;
    }
    if (boardStat[2] == playerSbmbol &&
        boardStat[4] == playerSbmbol &&
        boardStat[6] == playerSbmbol) {
      return true;
    }
    return false;
  }
}
