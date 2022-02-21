import 'package:expertsystems/screens/doctor_panel.dart';
import 'package:flutter/material.dart';
import 'package:expertsystems/data/constant.dart';

class InfoWindow extends StatelessWidget {
  final clusterText = "Cluster Headache";
  final migraineText = "Migraine Headache";
  final tensionText = "Tension Headache";

  // helper methods
  double getSize(context, percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  Widget label(context, text) {
    return Padding(
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Color(0xfff98125),
              borderRadius: BorderRadius.all(Radius.circular(2))),
          child: Padding(
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'OdibeeSans-Regular',
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.04),
            ),
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.02,
                MediaQuery.of(context).size.height * 0.004,
                MediaQuery.of(context).size.height * 0.02,
                MediaQuery.of(context).size.height * 0.004),
          )),
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.04,
          0, MediaQuery.of(context).size.height * 0.03),
    );
  }

  Widget infoCard(context, title, data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.31,
      height: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height *
          300,
      child: Card(
          color: Color(0xffFDFAF6),
          elevation: 5,
          child: Column(
            children: [
              Container(
                color: Color(0xe6ececec),
                width: double.infinity,
                child: Center(
                  child: Padding(
                    child: Text(title,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width /
                                MediaQuery.of(context).size.height *
                                22)),
                    padding: EdgeInsets.fromLTRB(
                        0,
                        MediaQuery.of(context).size.height * 0.015,
                        0,
                        MediaQuery.of(context).size.height * 0.015),
                  ),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return infoText(context, data[index]);
                  }),
            ],
          )),
    );
  }

  Widget infoText(context, text) {
    return Padding(
      child: Row(children: [
        Text("\u2022  ",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height *
                    19)),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height *
                    19),
          ),
        )
      ]),
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.03,
          MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height *
              18,
          0,
          MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height *
              18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
          color: Color(0xffceddda),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label(context, "DEPARTMENT THAT TREAT HEADACHE"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoCard(context, clusterText,
                      ["Neurology", "Neurosurgery", "Pain Rehabilitation Center"]),
                  infoCard(context, migraineText,
                      ["Neurology", "Pain Rehabilitation Center"]),
                  infoCard(context, tensionText, [
                    "Neurology",
                  ]),
                ],
              ),
              SizedBox(
                height: getSize(context, 0.02),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                label(context, "AREAS THAT RESEARCH IN HEADACHE"),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoCard(context, clusterText,
                      ["Neurology", "Neurosurgery", "Pain Rehabilitation Center"]),
                  infoCard(context, migraineText,
                      ["Neurology", "Pain Rehabilitation Center"]),
                  infoCard(context, tensionText, [
                    "Neurology",
                  ]),
                ],
              ),
              SizedBox(
                height: getSize(context, 0.03),
              ),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                label(context, "DOCTORS"),
              ]),
              DoctorPanel(null),
            ],
          ),
      ),
    );

  }
}
