import 'package:expertsystems/data/constant.dart';
import 'package:expertsystems/model/answers.dart';
import 'package:expertsystems/model/question.dart';
import 'package:expertsystems/model/symptoms.dart';

class GenerateQuestion {
  List<Question> preliminaryQuestions = [];
  List<Symptoms> commonSymptomsQuestions = [];
  List<Symptoms> finalQuestions = [];


  GenerateQuestion() {
    this.preliminaryQuestions = generateQuestions("preliminary");
    this.commonSymptomsQuestions = generateSymptomsList("common_symptoms");
    this.finalQuestions = generateSymptomsList("final");
  }

  List<Question> generateQuestions(String stage){
    List<Map<String, Object>>? question = questions[stage];


    List<Question> stageQuestion = [];

    for (var pq in question!) {
      int id = pq["id"] as int;
      String text = pq["text"] as String;
      List<Answer> answers = createAnswer(pq["answers"]);

      stageQuestion.add(Question(id, text, answers));
    }

    return stageQuestion;

  }

  List<Symptoms> generateSymptomsList(String stage){
    List<Map<String, Object>>? question = questions[stage];


    List<Symptoms> stageQ = [];

    for (var pq in question!) {
      int id = pq["id"] as int;
      String text = pq["text"] as String;
      Map<String, double> indicates = pq["indicates"] as Map<String, double>;

      stageQ.add(Symptoms(id, text, indicates));
    }

    return stageQ;

  }




  List<Answer> createAnswer(answers) {
    List<Answer> answerList = [];
    for (var answer in answers) {
      int id = answer["id"] as int;
      String text = answer["text"] as String;
      Map<String, double> indicates =
          answer["indicates"] as Map<String, double>;
      Answer temporaryAnswer = Answer(id, text, indicates);
      answerList.add(temporaryAnswer);
    }

    return answerList;
  }
}


void main(){
  var a = GenerateQuestion();
  print(a.finalQuestions);
}