import 'package:flutter/material.dart';

class HelpBlock extends StatelessWidget {
  HelpBlock(this.title, this.items);
  double getSize(context, percent) {
    return MediaQuery.of(context).size.height * percent;
  }


  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var item in items) {
      children.add(
        ListTile(
          contentPadding: EdgeInsets.only(
            bottom: getSize(context, 0.01)
          ),
          title: Container(
            color: Colors.black.withOpacity(0.15),
            padding: EdgeInsets.all(getSize(context, 0.02)),
            child: Text(item,
              style: TextStyle(
                  fontFamily: 'PTSans-Regular',
                  fontSize: getSize(context, 0.019),
                  color: Colors.black87,
              ),
            ),
          ),
          leading: Icon(Icons.brightness_1, color: Colors.red, size: getSize(context, 0.02)),
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: getSize(context, 0.02),
            top: getSize(context, 0.01)
          ),
          child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getSize(context, 0.025),
                fontFamily: 'PTSans-Regular',
                color: Colors.brown[600],
              ),
            ),
        ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
