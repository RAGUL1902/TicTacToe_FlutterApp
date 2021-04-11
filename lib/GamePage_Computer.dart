import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/main.dart';

class GamePage_Computer extends StatefulWidget {
  @override
  _GamePage_ComputerState createState() => _GamePage_ComputerState();
}

class _GamePage_ComputerState extends State<GamePage_Computer> {

  List<List> _matrix;
  String _lastChar;
  int _count;
  _GamePage_ComputerState(){
    _matrix = List<List>(3);
    _initMatrix();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Padding(
          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
          child: Text("Tic Tac Toe", style: TextStyle(color: Colors.yellow, fontSize: 30.0),  ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElement(0,0),
                _buildElement(0,1),
                _buildElement(0,2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElement(1,0),
                _buildElement(1,1),
                _buildElement(1,2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElement(2,0),
                _buildElement(2,1),
                _buildElement(2,2),
              ],
            ),
          ],
        ),
      ),

    );
  }
  _initMatrix() {
    _lastChar = 'o';
    _count =0;
    for (var i = 0; i < _matrix.length; i++) {
      _matrix[i] = List(3);
      for (var j = 0; j < _matrix[i].length; j++) {
        _matrix[i][j] = ' ';
      }
    }
  }


  _buildElement(int i, int j){
    return GestureDetector(
      onTap: () {
        if(_matrix[i][j] == ' ') {
          _changeMatrix(i, j);
          _checkWinner(i, j);
          Point p = _changeMatrixByComputer();
          _changeMatrix(p.first, p.second);
          _checkWinner(p.first, p.second);
        }
      },
      child: Container(
        width: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Colors.black
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              _matrix[i][j],
              style: TextStyle(
                fontSize: 100.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
  _changeMatrix(int i, int j){
    setState(() {
      if (_matrix[i][j] == ' ') {
        if (_lastChar == 'o') {
          _matrix[i][j] = 'x';
        }
        else {
          _matrix[i][j] = 'o';
        }
      }
      _lastChar = _matrix[i][j];
    });
  }

  _changeMatrixByComputer(){
    List<Point> empty = new List<Point>();
    for(int i = 0;i<3;i++){
      for(int j = 0;j<3;j++){
        if(_matrix[i][j] == ' '){
          Point p = new Point(i,j);
          empty.add(p);
        }
      }
    }
    Random random = new Random();
    Point p = (empty[random.nextInt(empty.length)]);
    return p;
  }

  _checkWinner(int x, int y){
    var row=0, col =0, diag=0, rdiag = 0;
    var n = _matrix.length-1;
    var player = _matrix[x][y];
    for(int i=0; i< _matrix.length; i++){
      if(_matrix[x][i] == player)
        col++;
      if(_matrix[i][y] == player)
        row++;
      if(_matrix[i][i] == player)
        diag++;
      if(_matrix[i][n-i] == player)
        rdiag++;
    }
    _count +=1;
    if(row == n+1 || col == n+1 || diag == n+1|| rdiag == n+1)
      showAlertDialog(context, player);
    else if(_count == 9)
      showAlertDialog(context, "Draw");
  }

  showAlertDialog(BuildContext context, String player) {

    Widget playAgainButton = FlatButton(
      child: Text("Play Again"),
      onPressed:  () {
        setState(() {
          _initMatrix();
        });
        Navigator.pop(context,true);
      },
    );
    Widget goBackButton = FlatButton(
      child: Text("Go back"),
      onPressed:  () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      },
    );


    AlertDialog alert = AlertDialog(
      title: Text("Result"),
      content: _result(player),
      actions: [
        playAgainButton,
        goBackButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _result(String r){
    if(r == "Draw")
      return Text("The game is a Draw");
    else if(r == 'o')
      return Text("Computer won!. Please choose an option");
    else
      return Text("You Won!. Please choose an option");
  }



}

class Point{
  int first;
  int second;
  Point(this.first,this.second);
}
