import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workntest/view/CupertinoDesign/CommentsView.dart';

class DismissibleContent extends StatelessWidget{
  Widget build(BuildContext context) {
    return
      new SafeArea(
          child:  Dismissible(
          key: UniqueKey(),
          child:  Material(
            color: Colors.transparent,
            child: CommentsView(),
          ),
          direction: DismissDirection.vertical,
            confirmDismiss: (DismissDirection dismissDirection) async{
              Navigator.of(context).pop();
              return true;
          },
        ),
    );
  }
}