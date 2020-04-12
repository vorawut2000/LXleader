import 'package:flutter/material.dart';

class contactPage extends StatelessWidget {

  final String title;

  contactPage(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Contact"), backgroundColor: Colors.redAccent,),
      body: new Center(
        child: new Text("contact"),
      ),
    );
  }
}