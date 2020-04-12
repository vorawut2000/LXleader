import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../settingPage.dart';
import '../../zonePage/LxPurplePaage.dart';
import '../../zonePage/LxRedPage.dart';
import '../../zonePage/LxGreenPage.dart';
import '../../zonePage/LxPinkPage.dart';
import '../ScanPage.dart';
import 'sliding.dart';
import 'bottomSheet.dart';
import 'tabs.dart';

class NewMapPage extends StatefulWidget {
  @override
  _NewMapPageState createState() => _NewMapPageState();
}

class _NewMapPageState extends State<NewMapPage> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Header(),
                SizedBox(height: 20),
                Tabs(),
                SizedBox(height: 20),
                sliding(),
              ],
            ),
          ),
          bottomSheet(), 
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        "LX'S LEADER APP",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}