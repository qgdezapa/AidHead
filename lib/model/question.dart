import 'answers.dart';

class Question {
  String text = "";
  int id = 0;
  List<Answer> answers = [];

  Question(this.id, this.text, this.answers);

  @override
  String toString() {
    return text;
  }
}

