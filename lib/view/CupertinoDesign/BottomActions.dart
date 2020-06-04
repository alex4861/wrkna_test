import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workntest/view/CupertinoDesign/DismissibleContent.dart';

import 'CommentsView.dart';

class BottomActions extends StatefulWidget{
  @override
  _BottomActionsState createState() => _BottomActionsState();
}

class _BottomActionsState extends State<BottomActions> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
        height: 80.0,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.elliptical(30, 20),topRight: Radius.elliptical(30, 20))
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(25),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.arrow_downward, color: Colors.white,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 10),
                        child: Text("Download (0.00Kb)"),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  color: Colors.white.withOpacity(0.3), onPressed: () {},
                ),
                SizedBox(
                  width: 46,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        favoriteIcon = changeIcon(favoriteIcon);
                      });
                    },
                    child: Icon(favoriteIcon, color: Colors.white,),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
                SizedBox(
                  width: 46,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        saved = changeIcon(saved);
                      });
                    },
                    child: Icon(saved, color: Colors.white,),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
                SizedBox(
                  width: 46,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {

                      Navigator.of(context).push(
                        SlideRightRoute(widget: DismissibleContent()),
                      );


                    },
                    child: Icon(Icons.chat_bubble_outline, color: Colors.white,),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(.3),
                  ),
                ),


              ],
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
    );
  }

  var favoriteIcon = Icons.favorite_border;
  var saved = Icons.bookmark_border;

  IconData changeIcon(IconData actualIcon){
    if (actualIcon == Icons.bookmark_border){
      return Icons.bookmark;
    }
    if (actualIcon == Icons.bookmark){
      return Icons.bookmark_border;
    }
    else if (actualIcon == Icons.favorite){
      return Icons.favorite_border;
    }
    else if (actualIcon == Icons.favorite_border){
      return Icons.favorite;
    }
    return null;
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
      pageBuilder: (_,__,___) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return new SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    barrierColor: Colors.black.withOpacity(.5),
    opaque: false,

  );
}