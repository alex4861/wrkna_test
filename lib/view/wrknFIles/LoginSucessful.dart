import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogginSuccessful extends StatefulWidget{
  @override
  _LogginSuccessfulState createState() => _LogginSuccessfulState();
}

class _LogginSuccessfulState extends State<LogginSuccessful> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Tooltip(
            message: "Add account",
            child: IconButton(icon: Icon(CupertinoIcons.add), onPressed: () {}),)
        ], title: Text("Firebase example"),),
    );
  }
}