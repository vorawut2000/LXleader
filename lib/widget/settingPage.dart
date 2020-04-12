import 'package:flutter/material.dart';
import 'contactPage.dart';
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var divheight = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(title: Text("Setting"),backgroundColor: Colors.orange,),
      body:  Column(
        children: <Widget>[
          new Container(

            decoration: new BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0
                  )
                ],
                color: Colors.black,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0),),
                image: new DecorationImage(image: new AssetImage('assets/images/Lx.png'),
                    fit: BoxFit.cover),


            ),
            height: divheight/2*0.7,
            child: ListView(


            ),
          ),Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only( top: 15.0),
              ),


              new ListTile(
                  title: new Text("Contact Us"),

                  trailing: new Icon(Icons.arrow_upward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new contactPage("First Page")));
                  }
              ),
              new Divider(),
              new ListTile(
                  title: new Text("Page Two"),
                  trailing: new Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new contactPage("Second Page")));
                  }
              ),
              new Divider(),
              new ListTile(
                title: new Text("Cancel"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          )
        ],

      )

    );
  }
}
