import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy un item de ejemplo"),),

        ListTile(title: Text("Soy el item de enmedio", style: TextStyle(color: Colors.red),),),
        ListTile(title: Text("Soy un item de ejemplo"),),

        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy un item de ejemplo"),),

        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy un item de ejemplo"),),
        ListTile(title: Text("Soy el ultimo item", style: TextStyle(color: Colors.red),),),
      ],
    );
  }

}