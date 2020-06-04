import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workntest/view/CupertinoDesign/CupertinoDesign.dart';
import 'package:workntest/view/wrknFIles/SignupScreen.dart';
import 'package:workntest/viewModel/PushNotifications.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    PushNotificationsManager().init(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Tooltip(
            message: "Add account",
            child: IconButton(icon: Icon(CupertinoIcons.add), onPressed: () => addAccount(context)),)
        ], title: Text("Firebase example"),),
        body: SafeArea(
          child: Container(
              child:  Column(
                children: <Widget>[
                  Text("Ingresa usuario", textAlign: TextAlign.start,),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a search term'
                ),
              ),
              Text("Ingresa contraseña", textAlign: TextAlign.start,),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a search term',
                ),
              ),
              Row(
                children: <Widget>[
                  MaterialButton(onPressed: () => printPressed("Login"), child: Text("Iniciar sesión"), textColor: Colors.green, highlightColor: Colors.green.withOpacity(0.4),),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ),
      )
    );
  }

  void printPressed(String head){
    debugPrint("presionado $head");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CupertinoDesign() ));

  }
  void addAccount(BuildContext context){
    debugPrint("navegando");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
  }
}