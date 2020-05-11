import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../settingPage.dart';
import '../../zonePage/zoneA.dart';
import '../../zonePage/zoneB.dart';
import '../../zonePage/zoneD1.dart';
import '../../zonePage/zoneC.dart';
import '../ScanPage.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'sliding.dart';
import '../ScanPage.dart' as scanner;
import 'bottomSheet.dart';
import 'package:lxprojectbata1/bottomSheet/BottomSheet1.dart';
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
                SizedBox(height: 10),

                sliding(),
              ],
            ),
          ),
          bottomSheet1(),
        ],
      ),
    );
  }


}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0),
      child: Row(
        children: <Widget>[
          Text("LX'S LEADER",
              style: TextStyle(
                  fontFamily: 'Hibition RED ZONE',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
          SizedBox(width: 10.0),
          Text('APP',
              style: TextStyle(
                  fontFamily: '',
                  color: Color(0xFF162A49),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
         
          Center(
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScannerPage() ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), 
                      color: Color(0xFF162A49)),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10),
                        Icon(Icons.camera_alt, color: Colors.white),
                        SizedBox(width: 10),
                        Text("Scan QR", style: TextStyle(color: Colors.white),)],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
