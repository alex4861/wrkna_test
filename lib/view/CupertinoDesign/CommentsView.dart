import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workntest/view/CupertinoDesign/CommentsExample.dart';

class CommentsView extends StatefulWidget{
  @override
  _CommentsViewState createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView>  with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
        ),
        child:
        Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 60,
                child: Container(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color:  Colors.black38, width: 1))
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: TextField(
                                decoration: InputDecoration(border: InputBorder.none, hintText: "comentar..."), onTap: (){

                            },),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.09),
                            borderRadius: BorderRadius.circular(24)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    )
    );
  }
}

//FittedBox(
//                  child: Column(
//                    children: <Widget>[
//                      Icon(Icons.cloud_off, color: Colors.black12,),
//                    ],
//                  ),
//                )