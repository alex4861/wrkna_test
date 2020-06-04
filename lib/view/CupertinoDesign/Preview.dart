import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workntest/view/CupertinoDesign/BottomActions.dart';

class Preview extends StatefulWidget{
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       body: SafeArea(
         child: Flex(
           children: <Widget>[
             Container(
               child: CupertinoNavigationBar(
                 backgroundColor: Colors.transparent,
                 actionsForegroundColor: Colors.white,
               ),

             ),
             Expanded(
               child: Container(color: Color(0xFF2B292A),
               height: 800,),
             ),
             BottomActions()
           ], direction: Axis.vertical,
         ),
       ),
      backgroundColor: Color(0xFF2B292A),
    );
  }
}