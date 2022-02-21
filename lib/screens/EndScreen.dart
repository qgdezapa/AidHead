import 'dart:math';

import 'package:expertsystems/data/constant.dart';
import 'package:expertsystems/screens/help_subwidget/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'doctor_panel.dart';

class EndScreen extends StatelessWidget {
  EndScreen(this.scores, {Key? key}) : super(key: key);
  final Map<String, dynamic> scores;
  // Shown right away
  List<Widget> mainWidgets = [];
  // Shown only after expanding an expandTile (not yet added)
  List<Widget> subWidgets = [];

  List<Widget> probabilityWidgets = [];

  @override
  Widget build(BuildContext context) {
    bool needsImmediateAttention = false;
    Results res = new Results(scores);
    res.getAdjustedScores()['final'].forEach((key, value) {
      if (value > 0) {
        needsImmediateAttention = true;
      }
    });

    if (needsImmediateAttention) {
      mainWidgets.add(DoctorPanel(res.headaches()));

      for (final headacheType in res.headaches()) {
        // Probably an unnecessary step
        List<String> treatments = [];
        for (final homeRemedy in remedies[headacheType]!['home']
            ['treatments']) {
          treatments.add(homeRemedy);
        }
        subWidgets.add(Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              HelpBlock(
                  remedies[headacheType]!['description'], [...treatments]),
              Container(
                height: 20,
              ),
            ],
          ),
        ));
      }
    }
    else if(!needsImmediateAttention && res.headaches().length == 0){
      subWidgets.add(DoctorPanel(res.allHeadaches()));
    }
    else {


      for (final headacheType in res.headaches()) {
        // Probably an unnecessary step
        List<String> treatments = [];
        for (final homeRemedy in remedies[headacheType]!['home']
            ['treatments']) {
          treatments.add(homeRemedy);
        }
        mainWidgets.add(Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              HelpBlock(
                  remedies[headacheType]!['description'], [...treatments]),
              Container(
                height: 20,
              ),
            ],
          ),
        ));
      }

      subWidgets.add(DoctorPanel(res.headaches()));
    }

    Map<String, double> probability = {};

    res.probas().forEach((key, value) {
      probability[key] = double.parse((value * 100).toStringAsPrecision(5));
    });
    probabilityWidgets.add(
      Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.08),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.03),
              child: Text(
                "Your Headache Probability Chart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'PTSans-Regular',
                  color: Colors.brown[600],
                ),
              ),
            ),
            PieChart(
              dataMap: probability,
            ),
          ],
        ),
      ),
    );

    return ListView(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          color: Color.fromARGB(150, 69, 69, 69),
          child: Text(
            res.message(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "PTSans-Regular",
              fontSize:
                  MediaQuery.of(context).size.width * 0.042 < minTitleFontSize
                      ? minTitleFontSize
                      : MediaQuery.of(context).size.width * 0.042,
            ),
          ),
        ),
        // Spacer
        Container(
          height: 50,
        ),
        needsImmediateAttention
            ? ExpansionTile(
                initiallyExpanded: true,
                iconColor: Colors.white,
                title: Container(
                  child: Text(
                    "We advise you to appoint a doctor:",
                  ),
                ),
                children: [...mainWidgets],
              )
            : Column(
                children: [...mainWidgets],
              ),

        ExpansionTile(
          iconColor: Colors.white,
          title: Container(
            child: Text(
              needsImmediateAttention ? "Home remedies" : "Some doctors",
            ),
          ),
          children: [...subWidgets],
        ),
        ExpansionTile(
          iconColor: Colors.white,
          title: Container(
            child: Text(
              "Additional information",
            ),
          ),
          children: [...probabilityWidgets],
        ),
      ],
    );
  }
}

class Results {
  final Map<String, dynamic> scores;
  final Map<String, Map<String, double>> cf = compensation_factors;
  double totalsSum = 0.0;
  Map<String, double> totals = {};

  Map<String, dynamic> results = {};
  double percentDiff = 0.0;

  Results(this.scores) {
    Map<String, dynamic> adjustedScores = adjustScores(scores, cf);
    totals = getTotals(adjustedScores);
    totals.forEach((key, value) {
      totalsSum += value;
    });
    Map<String, double> probas = new Map<String, double>.from(totals);
    totals.forEach((key, value) {
      probas[key] = value / totalsSum;
    });
    List<String> twoHigh = twoHighest(adjustedScores);

    percentDiff = (totals[twoHigh[0]]! - totals[twoHigh[1]]!) / totalsSum;
    Map<String, dynamic> result = generateFinal(adjustedScores);
    String message = result['message'];
    List<dynamic> headaches = result['headaches'];
    // print("RESULT: $result");
    results = {
      "SD": "SD is ${getDeviation(adjustedScores)}",
      "message": message,
      "highest": twoHigh[0],
      "secondHighest": twoHigh[1],
      "all": [...twoHigh],
      "sum": totalsSum,
      "percentDiff": percentDiff,
      "adjustedScores": adjustedScores,
      "totals": totals,
      "headaches": headaches,
      "probas": probas,
    };
    results.forEach((key, value) {
      print("$key: $value");
    });
  }

  String message() => this.results['message'];
  String highest() => this.results['highest'];
  String secondHighest() => this.results['secondHighest'];
  double getPercentDiff() => this.results['percentDiff'];
  Map<String, dynamic> getAdjustedScores() => this.results['adjustedScores'];
  List<dynamic> headaches() => this.results['headaches'];
  List<dynamic> allHeadaches() => this.results['all'];
  Map<String, double> probas() => this.results['probas'];
  Map<String, dynamic> getResults() => this.results;

  Map<String, dynamic> adjustScores(
      Map<String, dynamic> scores, Map<String, Map<String, double>> cf) {
    Map<String, dynamic> newScores = {
      "prelim": {
        "cluster": 0.0,
        "migraine": 0.0,
        "tension": 0.0,
      },
      "common": {
        "cluster": 0.0,
        "migraine": 0.0,
        "tension": 0.0,
      },
      "final": {
        "cluster": 0.0,
        "migraine": 0.0,
        "tension": 0.0,
      },
    };
    // Iterate through the score list and multiply each of them by their
    // respective compensation factor
    scores.forEach((phase, phaseScores) {
      phaseScores.forEach((headacheType, score) {
        newScores[phase][headacheType] =
            score * compensation_factors[headacheType]![phase];
      });
    });
    return newScores;
  }

  Map<String, double> getTotals(Map<String, dynamic> scores) {
    Map<String, double> totals = {
      "cluster": 0.0,
      "migraine": 0.0,
      "tension": 0.0,
    };

    scores.forEach((phase, phaseScores) {
      phaseScores.forEach((headacheType, score) {
        totals[headacheType] = totals[headacheType]! + score;
      });
    });
    return totals;
  }

  Map<String, dynamic> generateFinal(Map<String, dynamic> scores) {
    double percentDiff = 0.0;
    double standardDeviation = 0.0;
    List<String> twoHigh = [""];
    twoHigh = twoHighest(scores);
    String highest = twoHigh[0];
    String second = twoHigh[1];
    percentDiff = (totals[twoHigh[0]]! - totals[twoHigh[1]]!) / totalsSum;
    print(percentDiff);
    percentDiff = percentDiff < 0 ? -percentDiff : percentDiff;
    standardDeviation = getDeviation(scores);
    // Threshhold is defined in constant.dart
    if (percentDiff <= threshholdPercentDiff) {
      if (standardDeviation <= threshholdStandardDeviation) {
        return {"message": "The results are inconclusive.", "headaches": []};
      }
      return {
        "message":
            "You are most likely experiencing a ${twoHigh[0]}${twoHigh[0] != "migraine" ? " headache" : ""} or ${twoHigh[1]}${twoHigh[1] != "migraine" ? " headache." : "."}",
        "headaches": [
          twoHigh[0],
          twoHigh[1],
        ],
      };
    }

    return {
      "message":
          "You are most likely experiencing a ${twoHigh[0]}${twoHigh[0] != "migraine" ? " headache." : "."}",
      "headaches": [
        twoHigh[0],
      ]
    };
  }

  double getDeviation(Map<String, dynamic> scores) {
    double mean = this.totalsSum / 3;
    double variance = 0.0;
    double xiu2 = 0.0;
    this.totals.forEach((key, value) {
      xiu2 += pow((value - mean), 2);
    });
    variance = xiu2 / 2;
    return sqrt(variance);
  }

  List<String> twoHighest(Map<String, dynamic> scores) {
    Map<String, double> totals = getTotals(scores);
    Map<String, double> totalsCopy = new Map<String, double>.from(totals);
    String highest = "";
    String secondHighest = "";
    highest = totalsCopy.keys.first;
    totals.forEach((key, value) {
      if (totals[highest]! <= value) {
        highest = key;
      }
    });
    print("Highest: $highest");
    totalsCopy.remove(highest);
    secondHighest = totalsCopy.keys.first;
    totalsCopy.forEach((key, value) {
      if (totals[secondHighest]! <= value) {
        secondHighest = key;
      }
    });
    print("Second highest: $secondHighest");
    totalsCopy.remove(secondHighest);

    return [highest, secondHighest, ...totalsCopy.keys];
  }
}
