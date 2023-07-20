import 'package:flutter/material.dart';
import 'board_screen.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        BoardScreen.routeName: (_) => BoardScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      initialRoute: BoardScreen.routeName,
    );
  }
}
