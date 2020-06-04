import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Buttons.dart';
import 'Preview.dart';

class CupertinoDesign extends StatefulWidget{
  @override
  _CupertinoDesignState createState() => _CupertinoDesignState();
}

class _CupertinoDesignState extends State<CupertinoDesign> {
  @override
  Widget build(BuildContext superContext) {
    return  Scaffold(
      backgroundColor: Color(0xFF2B292A),
      drawer: Drawer(
        elevation: 0,
      ),
      body: new Builder(
      builder: (context) =>  SafeArea(
        child:  Stack(
          children: <Widget>[
            Positioned(
              top:6,
              left: 0,
              right: 0,
              child: CupertinoNavigationBar(
                leading: CupertinoButton(child: Icon(Icons.short_text, color: Colors.white, size: 40,), onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                  minSize: 20,
                padding: EdgeInsets.all(0),
                ),
                trailing: CupertinoButton(
                  child: Icon(Icons.search, semanticLabel: "none", textDirection: TextDirection.ltr,
                    color: Colors.white,),
                  onPressed: (){},
                  padding: EdgeInsets.all(0),
                  minSize:40,
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Positioned(
              top: 60.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.8) - 180.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome! ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 26.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Username',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ]
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Buttons(title: "Home", icon: Icon(Icons.home), action: () => _sendNav(superContext),),
                          Buttons(title: "Profile", icon: Icon(Icons.account_circle), action: () => _sendNav(superContext),),
                          Buttons(title: "Favorites", icon: Icon(Icons.favorite), action: () => _sendNav(superContext),),
                          Buttons(title: "Saved", icon: Icon(Icons.bookmark), action: () => _sendNav(superContext),),
                          Buttons(title: "share", icon: Icon(Icons.share), action: () => _sendNav(superContext),),

                        ],
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),

                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.8 +90,  // Subtracting 90dp to compensate the height of status and navigation bars
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
      )
    );
  }

  _sendNav(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Preview()));
  }

}
