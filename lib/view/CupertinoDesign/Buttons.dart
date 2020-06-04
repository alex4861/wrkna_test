import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget{


  final Icon icon;
  final String title;
  final action;
  Buttons({@required this.icon, @required this.title, @required this.action}) : assert(title != null),
        assert(icon != null);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children:[
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(20),
              onPressed: action,
              color: Theme.of(context).primaryColor,
              child: Icon(icon.icon, size: 26,),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 60.0,
            height: 20.0,
            child: Center(
              child: Text(title, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),),
            ),
          )
        ]
    );
  }

}