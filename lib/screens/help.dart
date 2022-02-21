import 'package:expertsystems/screens/help_subwidget/paragraph.dart';
import 'package:flutter/material.dart';

class HelpTab extends StatelessWidget {

  double getSize(context, percent) {
    return MediaQuery.of(context).size.height * percent;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container( 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.white.withOpacity(0.5),
            padding: EdgeInsets.all(20),
            child: ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [
                Text(
                  "Aid Head",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.055,
                    fontFamily: 'PTSans-Regular',
                      color: Colors.brown[700]
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.local_hospital_outlined, color: Colors.brown[600],),
                      Text("Aid Head is a service that users can utilize to help get a diagnosis using a rule-based expert system.",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          height: 1.5,
                          fontFamily: 'Rajdhani-Regular',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.black,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: getSize(context, 0.02),
                      ),
                      HelpBlock(
                        "Disclaimer",
                        [
                          "While this application is useful for getting an accurate diagnosis, it is by no means a fool-proof replacement to consulting a doctor.",
                          "If the symptoms you experience are already extremely severe, it is highly advisable to attempt to seek a doctor's opinion instead."
                        ],
                      ),
                      Divider(),
                      HelpBlock(
                        "Home",
                        [
                          "The landing page. Here, you will see Aid Head's logo as well as a button to proceed with the form for diagnosis.",
                        ],
                      ),
                      Divider(),
                      HelpBlock(
                        "Doctors",
                        [
                          "The fields concerned with cases of the types of headache that can be diagnosed by this app are listed here.",
                          "Here, you will see a list of reputable doctors that study such fields.",
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
