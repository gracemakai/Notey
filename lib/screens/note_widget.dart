import 'package:flutter/material.dart';

class NoteWidget extends StatefulWidget {
  final String title;
  final String body;
  final String date;

  NoteWidget(this.title, this.body, this.date);

  _NoteWidgetState createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColorFromHex("#F9C906"),

      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                widget.date,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey),
              ),
            ),

            SizedBox(height: 30,),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.body,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
