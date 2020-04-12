import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settingPage.dart';
import '../zonePage/LxPurplePaage.dart';
import '../zonePage/LxRedPage.dart';
import '../zonePage/LxGreenPage.dart';
import '../zonePage/LxPinkPage.dart';
import 'ScanPage.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.deepOrangeAccent ,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(),
                    );
                  },
                ),
                Container(
                    width: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.code),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>SacnPage()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()),
                            );
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
          //SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Text("LX'S",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0)),
                SizedBox(width: 10.0),
                Text('LEADER MAP',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 30.0))
              ],
            ),
          ),
          // SizedBox(height: 0),
          Container(
            height: MediaQuery.of(context).size.height *0.80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Test.png"),
                // fit: BoxFit.cover,   

              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(65.0), topRight:Radius.circular (65.0)),
            ),
            child: ListView(
              //primary: false,
              padding: EdgeInsets.only(left: 0.0, right: 0.0),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.location_on),
                      padding: EdgeInsets.only(left: 100 ,top: 140),
                      iconSize: 65,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LxBrownPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on),
                      padding: EdgeInsets.only(left: 100,top: 140),
                      iconSize: 65,
                      
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LxPurplePage()),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.only(left: 120, top: 75),
                      icon: Icon(Icons.location_on),
                      iconSize: 65,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LxGreenPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on),
                      padding: EdgeInsets.only(left: 85, top: 84),
                      iconSize: 65,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LxRedPage()),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}

const double minHeight = 120;

class ExhibitionBottomSheet extends StatefulWidget {
  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: minHeight,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32))
        ),
      ),
    );
  }
}
