import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import '../widget/MapPage/NewMapPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(ScannerPage());
}
class ScannerPage extends StatefulWidget {
  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;

  @override
  initState() {
    super.initState();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();
  }

  @override
  String name = "Scan QR to see where you are or information";
  void onscandone(String str){
    setState(() {
      print('Bew');
      name=str;
    });
  }

  void qrScan(){
    scanner.scan().then((String str){
      print(str + "\n \n \n \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
      onscandone(str);
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF162A49),
        body: Builder(
          builder: (BuildContext context) {
            return ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewMapPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Row(
                  children: <Widget>[
                    Text('  Scan ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0)),
                    Text("QR Code",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height - 155.0,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                  ),
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(left: 25.0, right: 20.0),
                    children: <Widget>[
                      Image.asset(
                        'assets/images/$name.png'
                      ),
                      SizedBox(height: 0,),
                      Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                          height: 60,
                          color: Color(0xFF162A49),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: <Widget>[
                                    Text(name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: qrScan,
          tooltip: 'Take a Photo',
          child: const Icon(Icons.camera_alt),
          backgroundColor: Color(0xFF162A49),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
class Mapdata{
  static String fileName;
}