import 'package:flutter/material.dart';
checkDraw(List<List>_matrix) {
  var draw = true;
  _matrix.forEach((i) {
    i.forEach((j) {
      if (j == ' ')
        draw = false;
    });
  });
  return draw;
}

checkWinner(int x, int y,List<List>_matrix) {
  var col = 0, row = 0, diag = 0, rdiag = 0;
  var n = _matrix.length-1;
  var player = _matrix[x][y];

  for (int i = 0; i < _matrix.length; i++) {
    if (_matrix[x][i] == player)
      col++;
    if (_matrix[i][y] == player)
      row++;
    if (_matrix[i][i] == player)
      diag++;
    if (_matrix[i][n-i] == player)
      rdiag++;
  }
  if (row == n+1 || col == n+1 || diag == n+1 || rdiag == n+1) {
    return true;
  }
  return false;
}

Dialog_Show(String winner,BuildContext context,Function function) {
  String dialogText;
  if (winner == null) {
    dialogText = 'It\'s a draw';
  } else {
    dialogText = 'Player $winner won';
  }

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Game over'),
          content: Text(dialogText),
          actions: <Widget>[
            FlatButton(
              child: Text('Reset Game'),
              onPressed: () {
                Navigator.of(context).pop();
                function();
              },
            )
          ],
        );
      }
  );
}