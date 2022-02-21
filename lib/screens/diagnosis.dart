import 'package:expertsystems/helper/question_generator.dart';
import 'package:expertsystems/model/answers.dart';
import 'package:expertsystems/model/question.dart';
import 'package:expertsystems/model/symptoms.dart';
import 'package:expertsystems/data/constant.dart';
import 'package:expertsystems/screens/EndScreen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Diagnose extends StatefulWidget {
  @override
  _DiagnoseState createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  GenerateQuestion questionGenerator = GenerateQuestion();
  List<Question> preliminaryQuestions = [];
  List<Symptoms> commonSymptomsQuestions = [];
  List<Symptoms> finalSymptoms = [];
  Set<int> markedCommonSymptomsId = Set<int>();
  Set<Symptoms> markedCommonSymptoms = Set<Symptoms>();
  Set<int> markedFinalSymptomsId = Set<int>();
  Set<Symptoms> markedFinalSymptoms = Set<Symptoms>();
  int counter = 0;
  Map<String, Map<String, dynamic>> scores = {};

  @override
  void initState() {
    super.initState();
    questionGenerator = GenerateQuestion();
    preliminaryQuestions = questionGenerator.preliminaryQuestions;
    commonSymptomsQuestions = questionGenerator.commonSymptomsQuestions;
    finalSymptoms = questionGenerator.finalQuestions;
    scores = {
      "prelim": {
        "cluster": 0.0,
        "tension": 0.0,
        "migraine": 0.0,
      },
      "common": {
        "cluster": 0.0,
        "tension": 0.0,
        "migraine": 0.0,
      },
      "final": {
        "cluster": 0.0,
        "tension": 0.0,
        "migraine": 0.0,
      }
    };
  }

  // Helper methods

  double getSize(context, percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  void proceedFinal() {
    markedCommonSymptoms.forEach((element) {
      element.indicates.forEach((key, value) {
        scores['common']![key] += value;
      });
    });
    sortFinalQuestion();
    setState(() {
      counter++;
    });
  }

  void proceedResult() {
    markedFinalSymptoms.forEach((element) {
      element.indicates.forEach((key, value) {
        scores['final']![key] += value;
      });
    });
    setState(() {
      counter++;
    });
  }

  void sortCommonSymptomsQuestion() {
    List sortedKeys = [];
    scores['prelim']!.forEach((key, value) {
      sortedKeys.add([key, value]);
    });
    sortedKeys.sort((a, b) => a[1].compareTo(b[1]));

    for (var keys in sortedKeys) {
      commonSymptomsQuestions.sort((b, a) {
        var l = a.indicates;
        var m = b.indicates;
        double s = l[keys[0]] as double;
        double d = m[keys[0]] as double;
        return s.compareTo(d);
      });
    }
  }

  void sortFinalQuestion() {
    List sortedKeys = [];
    scores['prelim']!.forEach((key, value) {
      sortedKeys.add([key, value]);
    });
    sortedKeys.sort((a, b) => a[1].compareTo(b[1]));

    for (var keys in sortedKeys) {
      finalSymptoms.sort((b, a) {
        var l = a.indicates;
        var m = b.indicates;
        double s = l[keys[0]] as double;
        double d = m[keys[0]] as double;
        return s.compareTo(d);
      });
    }
  }

  void nextQuestion(Map<String, double> s) {
    s.forEach((key, value) {
      this.scores['prelim']![key] += value;
    });
    if (counter == 2) {
      sortCommonSymptomsQuestion();
    }
    setState(() {
      counter++;
    });
  }

  // end of helper methods --- |

  // Component/Widget methods

  Widget answerTile(String answerText, Map<String, double> score) {
    return Padding(
      child: ElevatedButton(
        onPressed: () {
          nextQuestion(score);
        },
        style: ElevatedButton.styleFrom(
          elevation: 3,
          primary: Colors.white.withOpacity(0.95),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          shape: StadiumBorder(),
          side: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'NotoSans-Regular',
            fontSize:
                MediaQuery.of(context).size.width * 0.027 < minAnswerFontSize
                    ? minAnswerFontSize
                    : MediaQuery.of(context).size.width * 0.027,
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, MediaQuery.of(context).size.height * 0.02),
    );
  }

  Widget listOfAnswers(context, answers) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.08, 0,
          MediaQuery.of(context).size.width * 0.08, 0),
      child: Column(children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: answers.length,
            itemBuilder: (context, index) {
              return answerTile(answers[index].text, answers[index].indicates);
            }),
      ]),
    );
  }

  void toggleMarkedCommonSymptoms(Symptoms symptom) {
    if (markedCommonSymptomsId.contains(symptom.id)) {
      markedCommonSymptomsId.remove(symptom.id);
      markedCommonSymptoms.remove(symptom);
    } else {
      markedCommonSymptomsId.add(symptom.id);
      markedCommonSymptoms.add(symptom);
    }
  }

  void toggleMarkedFinalSymptoms(Symptoms symptom) {
    if (markedFinalSymptomsId.contains(symptom.id)) {
      markedFinalSymptomsId.remove(symptom.id);
      markedFinalSymptoms.remove(symptom);
    } else {
      markedFinalSymptomsId.add(symptom.id);
      markedFinalSymptoms.add(symptom);
    }
  }

  Widget symptomsTile(Symptoms symptom) {
    //here
    return Padding(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            toggleMarkedCommonSymptoms(symptom);
          });
        },
        style: ElevatedButton.styleFrom(
          primary: markedCommonSymptomsId.contains(symptom.id)
              ? Color(0xe6fcecdd)
              : Colors.white.withOpacity(0.8),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          shape: markedCommonSymptomsId.contains(symptom.id)
              ? StadiumBorder()
              : null,
          side: BorderSide(
            color: Color(0xe6fea82f),
            style: BorderStyle.solid,
            width: markedCommonSymptomsId.contains(symptom.id) ? 3 : 0.2,
          ),
        ),
        child: Text(
          symptom.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: markedCommonSymptomsId.contains(symptom.id)
                ? Colors.deepOrange
                : Colors.black87,
            fontFamily: 'NotoSans-Regular',
            fontSize:
                MediaQuery.of(context).size.width * 0.026 < minAnswerFontSize
                    ? minAnswerFontSize
                    : MediaQuery.of(context).size.width * 0.026,
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, MediaQuery.of(context).size.height * 0.01),
    );
  }

  Widget listOfSymptoms(symptoms) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.08, 0,
          MediaQuery.of(context).size.width * 0.08, 0),
      child: Column(children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: symptoms.length,
            itemBuilder: (context, index) {
              return symptomsTile(symptoms[index]);
            }),
        SizedBox(height: getSize(context, 0.04)),
        ElevatedButton(
          onPressed: () {
            proceedFinal();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            primary: Colors.deepOrange,
          ),
          child: Text("Next >>"),
        ),
        SizedBox(height: getSize(context, 0.04)),
      ]),
    );
  }

  Widget listOfFinalSymptoms(symptoms) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.08, 0,
          MediaQuery.of(context).size.width * 0.08, 0),
      child: Column(children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: symptoms.length,
            itemBuilder: (context, index) {
              return finalSymptomsTile(symptoms[index]);
            }),
        SizedBox(height: getSize(context, 0.04)),
        ElevatedButton(
            onPressed: () {
              proceedResult();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              primary: Colors.deepOrange,
            ),
            child: Text("Proceed")),
        SizedBox(height: getSize(context, 0.04)),
      ]),
    );
  }

  Widget finalSymptomsTile(Symptoms symptom) {
    return Padding(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            toggleMarkedFinalSymptoms(symptom);
          });
        },
        style: ElevatedButton.styleFrom(
          primary: markedFinalSymptomsId.contains(symptom.id)
              ? Color(0xe6fcecdd)
              : Colors.white.withOpacity(0.8),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          shape: markedFinalSymptomsId.contains(symptom.id)
              ? StadiumBorder()
              : null,
          side: BorderSide(
            color: Color(0xe6fea82f),
            style: BorderStyle.solid,
            width: markedFinalSymptomsId.contains(symptom.id) ? 3 : 0.2,
          ),
        ),
        child: Text(
          symptom.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: markedFinalSymptomsId.contains(symptom.id)
                ? Colors.deepOrange
                : Colors.black87,
            fontFamily: 'NotoSans-Regular',
            fontSize:
                MediaQuery.of(context).size.width * 0.026 < minAnswerFontSize
                    ? minAnswerFontSize
                    : MediaQuery.of(context).size.width * 0.026,
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, MediaQuery.of(context).size.height * 0.01),
    );
  }

  // end of component methods --- |

  Widget preliminary(context) {
    //here

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          child: Text(
            preliminaryQuestions[counter].text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:
                  MediaQuery.of(context).size.width * 0.042 < minTitleFontSize
                      ? minTitleFontSize
                      : MediaQuery.of(context).size.width * 0.042,
              fontFamily: 'PTSans-Regular',
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.04,
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.03),
        ),
        Divider(),
        SizedBox(height: getSize(context, 0.03)),
        listOfAnswers(context, preliminaryQuestions[counter].answers),
        SizedBox(height: getSize(context, 0.59),)
      ],
    );
  }

  Widget commonSymptoms(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

          color: Colors.transparent,
          child: Text(
            "Which of these symptoms have you experienced? (Select all that apply)",
            style: TextStyle(
              fontSize:
                  MediaQuery.of(context).size.height * 0.025 < minTitleFontSize
                      ? minTitleFontSize
                      : MediaQuery.of(context).size.height * 0.025,
              fontFamily: 'PTSans-Regular',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.04,
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.03),
        ),
        Divider(),
        SizedBox(height: getSize(context, 0.03)),
        listOfSymptoms(commonSymptomsQuestions),
      ],
    );
  }

  Widget finals(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          child: Text(
            "Have you experienced any of these severe symptoms in the past? (Select all that apply)",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:
                  MediaQuery.of(context).size.height * 0.025 < minTitleFontSize
                      ? minTitleFontSize
                      : MediaQuery.of(context).size.height * 0.025,
              fontFamily: 'PTSans-Regular',
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.04,
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.03),
        ),
        Divider(),
        SizedBox(height: getSize(context, 0.03)),
        listOfFinalSymptoms(finalSymptoms),
      ],
    );
  }

  Widget results(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          child: Text(
            preliminaryQuestions[counter].text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.025,
            ),
          ),
          padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.height * 0.03,
              0,
              MediaQuery.of(context).size.height * 0.06),
        ),
        listOfAnswers(context, preliminaryQuestions[counter].answers),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget stage;

    if (counter < preliminaryQuestions.length) {
      stage = preliminary(context);
    } else if (counter < preliminaryQuestions.length + 1) {
      stage = commonSymptoms(context);
    } else if (counter < preliminaryQuestions.length + 2) {
      stage = finals(context);
    } else {
      stage = EndScreen(this.scores);
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            disabledColor: Colors.amber,
            icon: const Icon(Icons.arrow_back),
            iconSize: getSize(context, 0.04),
            onPressed: () {
              if(counter < 5) {
                Alert(
                  context: context,
                  title: "",
                  style: AlertStyle(isCloseButton: false),
                  desc: "Are you sure you want to quit? ",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "YES",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        // 1.) pop this current alert box on the stack
                        // 2.) pop the current Page on the stack
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "NO",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ).show();
              }else{
                Navigator.pop(context);
              }
            },
          ),
        ),

        backgroundColor:  Color(0xffceddda),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
              decoration: counter < 5? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ):null,
              color: counter < 5? null: Color(0xffceddda),
              child: stage
          ),
        ),
      ),
    );



  }
}
