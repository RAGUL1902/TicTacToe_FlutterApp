import 'package:flutter/material.dart';
import 'package:tictactoe/GamePage.dart';
import 'package:tictactoe/GamePage_Computer.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Center(child: Text("Tic Tac Toe", style: TextStyle(color: Colors.yellow, fontSize: 30.0),  )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.0,
          ),
          Center(child: Text(
              "Welcome to Tic Tac Toe",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 28.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
          )),
          SizedBox(height: 100.0),
          RaisedButton(
            color: Colors.redAccent,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'User Vs User',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 100.0),
          RaisedButton(
            color: Colors.redAccent,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage_Computer()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'User Vs Computer',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
