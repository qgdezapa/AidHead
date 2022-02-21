import 'dart:ui';

import 'package:flutter/material.dart';

class MainWindow extends StatelessWidget {

  double getSize(context, percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: getSize(context, 0.9),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/liza.jpg"), fit: BoxFit.cover)),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary:  Color(0xe6fcecdd).withOpacity(0.4) ,
                        side: BorderSide(
                            color: Color(0xe6F5F5DD),
                            style: BorderStyle.solid,
                            width: 3
                        ),
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                      ),

                      child: Column(
                        children: [
                          Padding(
                            child: Image.asset("assets/images/aidhead.png",
                                width: MediaQuery.of(context).size.height * 0.23),
                            padding: EdgeInsets.fromLTRB(
                                0,
                                MediaQuery.of(context).size.height * 0.02,
                                0,
                                0),
                          ),
                          Padding(
                            child: Text(
                              "Aid Head",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.024,
                                fontFamily: 'PTSans-Regular',
                                fontWeight: FontWeight.bold,
                                color: Color(0xffCC9767),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                0
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(
                    height: getSize(context, 0.04),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.1),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, 0),
                      child:  Padding(
                        child: Text(
                          "Helping you and your headache",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              fontFamily: 'Rajdhani-Regular',
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height * 0.02,
                            MediaQuery.of(context).size.height * 0.02,
                            MediaQuery.of(context).size.height * 0.02,
                            MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),



                  SizedBox(height: getSize(context, 0.23),),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/diagnose');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: EdgeInsets.all(23),
                      shape: StadiumBorder(),
                      side: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 3,
                      ),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.radar),
                        Text(
                          " Diagnose",
                          style: TextStyle(
                            fontFamily: 'PTSans-Regular',
                            fontSize: getSize(context, 0.020),
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
