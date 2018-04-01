import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../ui/answer_btn.dart';
import '../ui/question_txt.dart';

class QuizPage extends StatefulWidget {

  @override
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () {print("Correct!");}),
            new QuestionText("The answer to the ultimate question is 42.", 1),
            new AnswerButton(false, () {print("Wrong!");}),
          ],
        ),
      ],
    );
  }

}