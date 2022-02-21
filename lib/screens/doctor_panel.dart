import 'package:flutter/material.dart';
import 'package:expertsystems/data/constant.dart';
import 'package:expertsystems/helper/utils.dart';
class DoctorPanel extends StatelessWidget {



  final dynamic headacheType;

  DoctorPanel(this.headacheType);

  // helper methods
  double getSize(context, percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  List<Map<String, String>> getDoctorWithType(){
    List<Map<String, String>> doctorList = [];
    List<String> names = [];
    category_doctors.forEach((key, value) {
      if(headacheType.contains(key)){
        names.addAll(value);
      }
    });
    for(dynamic doctor in doctors){
      if(names.contains(doctor["name"])){
        doctorList.add(doctor);
      }
    }

    return doctorList;
  }

  Widget label(context, text, info) {
    return Padding(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width  * 0.023
            ),
          ),
         Text(
            info,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width  * 0.023
            ),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05,
        0,
        0,
        0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> doctorList;
    if(this.headacheType == null){
      doctorList = [...doctors];
    }else{
      doctorList = getDoctorWithType();
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: doctorList.length,
              itemBuilder: (context, index) {
                return doctorCard(context, doctorList[index]);
              })
        ],
      ),
    );
  }

  Widget doctorCard(context, Map<String, String> info) {
    String image = info["image"] as String;
    return SizedBox(
      height: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height * 360,
      child: Card(
          color: Color(0xffFDFAF6),
          elevation: 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label(context, "Name: ", info["name"]),
                  label(context, "Department: ", info["department"]),
                  label(context, "Location: ", info["location"]),
                  label(context, "Area of focus: ", info["areas of focus"]),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.013,
                      0,
                      0,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          Utils.openEmail(toEmail: info["email"] as String, subject: "A request for an appointment", body: "Good day! We would like to set an appointment");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff11224d),
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.03,
                            MediaQuery.of(context).size.height * 0.01,
                            MediaQuery.of(context).size.width * 0.03,
                            MediaQuery.of(context).size.height * 0.01,
                          ),

                        ),
                        child: Row(
                          children: [
                            Icon(Icons.fact_check),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                            Text(
                              "Request an appointment",
                              style: TextStyle(
                                fontFamily: 'NotoSans-Regular',
                                fontSize:  MediaQuery.of(context).size.width *0.03,
                              ),
                            ),
                          ],
                        )
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width * 0.02, 0),
                    child: Image.asset(image,  width: MediaQuery.of(context).size.width*0.3),
                  ),

                ],
              )
            ],
          )),
    );
  }
}
