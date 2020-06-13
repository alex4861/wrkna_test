import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopmodel/Home/View/AppBarHome.dart';
import 'BottomItems.dart';
import 'CarouselHome.dart';

class Home extends StatelessWidget{

  final String appName;

  const Home({Key key, @required this.appName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      bottomNavigationBar: BottomItems(),
      body: ContainerHome(),
      appBar: AppBarHome(appName: appName,),
    );
  }

}

class VerticalContents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
        itemBuilder: (BuildContext context, int index) => _buildCard(context, index),
      scrollDirection: Axis.horizontal,

    );
  }

  Widget _buildCard(BuildContext context, int index) {

    return Container(
      width: 100,
      child: Card(
        margin: EdgeInsets.only(left: 2,right: 2,top: 0, bottom: 2),
        child: FittedBox(
          child: Image(image: NetworkImage('https://lh3.googleusercontent.com/proxy/s8P-hJsZq1NlU875AoLsdbzf_K65Y5GoYoAFq5tmz0LZmohB23I6GOh2fUvhx8Y2AP-90kUK6HZ5nocB5tU7qfZW9R6Zd8WwBBd4BQ6koAR4gVZuPYVeh4B9Z9bUtDH9fw_moIX9-Pr38A')),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

}

class ContainerHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          CarouselHome(),
          ListTile(
            title: Text("Categorías", style: boldStyle(),),
            trailing: CupertinoButton(
              onPressed: () {},
              child: Text("Más categorías", style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
            ),
          ),
          SizedBox(
            height: 100,
            child: VerticalContents(),
          )
        ],
      ),
    );
  }

}


TextStyle boldStyle(){
  return TextStyle(
    fontWeight: FontWeight.w600,
  );
}
