import 'package:flutter/material.dart';
import '../pages/quiz_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int questionsTotal;

  ScorePage(this.score, this.questionsTotal);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Current High Score: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
          new Padding(padding: new EdgeInsets.only(top: 12.0)),
          new Text(score.toString() + " out of " + questionsTotal.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.0)),
          new Padding(padding: new EdgeInsets.only(top: 12.0)),
          new IconButton(
            icon: new Icon(Icons.refresh),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                builder: (BuildContext context) => new QuizPage()),
                (Route route) => route == null);
            }
          ),
          new Text("Restart quiz!", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0)),
        ],
      ),
    );
  }

}