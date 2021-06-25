import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';

class Add extends StatefulWidget {
  Database db;
  @override
  _AddState createState() => new _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0x690d75),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add'),
        actions: [
          IconButton(
              onPressed: () {
                // widget.db.delete(widget.country["id"]);
                // Navigator.pop(context, true);
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
