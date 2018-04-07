import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../ui/answer_btn.dart';
import '../ui/question_txt.dart';
import '../ui/answer_overlay.dart';

import './score_page.dart';

class QuizPage extends StatefulWidget {

  @override
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {

  Question currentQ;
  Quiz quiz = new Quiz([
    new Question("Is Flutter cool?", true),
    new Question("Is Flutter cooler than React Native?", true),
    new Question("Will Flutter take over React Native?", true)
  ]);

  String qText;
  int qNumber;
  bool isCorrect;
  bool showOverlay = false;

  @override
  void initState() {
    super.initState();
    currentQ = quiz.nextQuestion;
    qText = currentQ.question;
    qNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQ.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      showOverlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(qText, qNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        showOverlay == true ? new AnswerOverlay(
          isCorrect,
          () {
            if (quiz.length == qNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQ = quiz.nextQuestion;
            this.setState(() {
              showOverlay = false;
              qText = currentQ.question;
              qNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }

}