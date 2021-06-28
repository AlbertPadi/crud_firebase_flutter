import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'database.dart';

class View extends StatefulWidget {
  View({Key key, this.country, this.db}) : super(key: key);
  Map country;
  Database db;
  @override
  _ViewState createState() => new _ViewState();
}

class _ViewState extends State<View> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.country);
    nameController.text = widget.country['name'];
    codeController.text = widget.country['code'];
  }

  @override
  Widget build(BuildContext context) {
    Scaffold(
      backgroundColor: Color(0x690d75),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Country View"),
        actions: [
          IconButton(
              onPressed: () {
                widget.db.delete(widget.country["id"]);
                Navigator.pop(context, true);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Country Name"),
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Country Name"),
                controller: nameController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
            color: Colors.black,
            onPressed: () {
              widget.db.update(widget.country['id'], nameController.text,
                  codeController.text);
              Navigator.pop(context, true);
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
        focusColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
        labelText: labelText,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.black, width: 2.0)));
  }
}
