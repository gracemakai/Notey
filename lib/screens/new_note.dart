import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:notey/resources/strings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import 'homePage.dart';
class NewNote extends StatefulWidget{

  _NewNoteState createState() => _NewNoteState();

}

class _NewNoteState extends State<NewNote>{
  String now = DateFormat("HH:MM dd-MM-yyyy").format(DateTime.now());

  final titleTextController = TextEditingController();
  final bodyTextController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference().child("Notey/notes");


  void saveData(String title, String body) {

    databaseRef.push().set({'title': title, 'body': body, 'date' : now});
    Navigator.push(context,  MaterialPageRoute(builder: (context) => MyHomePage()));
  }
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
    //    leading: Icon(Icons.arrow_back_outlined,color: getColorFromHex("#F906B0"),),
        title: Text("New note", style: TextStyle(color: getColorFromHex("#F906B0")),),
        backgroundColor: getColorFromHex("#F9C906"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                now
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: titleTextController,
              decoration: InputDecoration(
                hintText: "Enter title...",
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: bodyTextController,
                  minLines: 5,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Enter text...",
                ),),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: getColorFromHex("#0636F9"),
        foregroundColor: getColorFromHex("#ffffff"),
        tooltip: Strings().saveNote,
        onPressed: () { saveData(titleTextController.text, bodyTextController.text); },
        child: Icon(Icons.check_outlined),
      ),
    );
  }

}