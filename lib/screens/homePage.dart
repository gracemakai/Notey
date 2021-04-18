import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:notey/main.dart';
import 'package:notey/resources/strings.dart';
import 'package:notey/screens/new_note.dart';
import 'package:notey/screens/note_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final notes = [];

class _MyHomePageState extends State<MyHomePage> {
  final db = FirebaseDatabase.instance.reference().child("Notey/notes");

  Widget _buildNotes(BuildContext context) {
    var lists = [];

    return FutureBuilder(
        future: db.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            print("heeewwwwhhhhooooo");
            print(snapshot.data.value);
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              print("Values");
              print(values);
              lists.add(values);
            });

            for (int i = 0; i < lists.length; i++) {
              notes.add(lists[i]);
            }

            return ListView.builder(
              itemCount: lists.length,
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.only(top: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 8,
                    child: Column(
                      children: [
                        noteCard(
                            lists[index]["title"].toString(),
                            lists[index]["body"].toString(),
                            lists[index]["date"].toString())
                      ],
                    ));
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget noteCard(String title, String body, String date) {
    String bodyString;

    if (body.length > 99) {
      bodyString = body.substring(0, 99);
    } else {
      bodyString = body;
    }
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteWidget(title, body, date)));
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 180,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  child: Text(
                    date,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                bodyString,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
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
      backgroundColor: getColorFromHex("#F9C906"),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          Strings().appName,
          style: TextStyle(color: getColorFromHex("#F906B0")),
        ),
        backgroundColor: getColorFromHex("#F9C906"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: _buildNotes(context),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: getColorFromHex("#0636F9"),
        foregroundColor: getColorFromHex("#ffffff"),
        onPressed: () {
          //_readDb();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewNote()));
        },
        tooltip: Strings().newNote,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
