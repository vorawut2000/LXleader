import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import '../widget/MapPage/NewMapPage.dart';

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
                SizedBox(height: 50,),
                Row(
                  children: <Widget>[
                    Text('  Scan ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0)),
                    Text('QR Code',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                  ],
                ),

                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height - 185.0,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                  ),
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(left: 25.0, right: 20.0),
                    children: <Widget>[
                      SizedBox(height: 150,),
                      Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              TextField(
                                controller: this._inputController,
                                decoration: InputDecoration(
                                  helperText: '             Please Scan QR Code',
                                  hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,),
                                ),
                              ),
                              TextField(
                                controller: this._outputController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.wrap_text),
                                  hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                                ),
                              ),
                            ],
                          ),
                        ),),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _scan(),
          tooltip: 'Take a Photo',
          child: const Icon(Icons.camera_alt),
          backgroundColor: Color(0xFF162A49),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    this._outputController.text = barcode;
  }

  Future _scanPath(String path) async {
    String barcode = await scanner.scanPath(path);
    this._outputController.text = barcode;
  }

  Future _scanBytes() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
  }

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }
}