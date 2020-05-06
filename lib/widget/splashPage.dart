import 'dart:async';
import 'package:flutter/material.dart';
import './MapPage/NewMapPage.dart';
import 'loderPage.dart';
import 'MapPage/NewMapPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 6),()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return NewMapPage();
    })));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Logo.png', width: 250,),
                Image.asset('assets/images/Name.png',width: 250.0,),
              ],),
          ),
          SizedBox(height: 0,),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
            ),
          ),
          Loading(
            radius: 30.0,
            dotRadius: 15.0,
          )
        ],),
    );
  }
}