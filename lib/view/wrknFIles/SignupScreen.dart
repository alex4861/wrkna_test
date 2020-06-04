import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget{
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: <Widget>[
              Text("Insert email"),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
              Text("Insert password"),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
              Text("Confirm password"),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password confirm',
                ),
              ),
              OutlineButton(
                onPressed: () {
                  handleSignIn()
                      .then((FirebaseUser user) => print(user))
                      .catchError((e) => print(e));
                },
                child: Text("Registrarse"),
                color: Colors.green,
                textColor: Colors.green,
                highlightedBorderColor: Colors.transparent,)
            ],
          ),
        )
    );
  }


  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential))
        .user;
    print("signed in " + user.displayName);
    return user;
  }
}