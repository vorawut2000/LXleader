import 'package:flutter/material.dart';
import '../widget/MapPage/NewMapPage.dart';

class contactPage extends StatelessWidget {

  final String title;

  contactPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF162A49),
      body: ListView(
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
                Container(
                    width: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Contact',
                    style: TextStyle(
                        fontFamily: 'Hibition RED ZONE',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0)),
                SizedBox(width: 10.0),
                Text('Page',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
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
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                    child: Column(
                      children: <Widget>[
                            Text('FACEBOOK',
                                style: TextStyle(
                                    color: Color(0xFF162A49),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0)),
                            SizedBox(height: 10,),
                            Text('     www.facebook.com/gubewgibi',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                        SizedBox(height: 20,),
                        Text('WEBSIDE',
                            style: TextStyle(
                                color: Color(0xFF162A49),
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0)),
                        SizedBox(height: 10,),
                        Text('  www.sit.kmutt.ac.th',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                        SizedBox(height: 20,),
                        Text('Phone ',
                            style: TextStyle(
                                color: Color(0xFF162A49),
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0)),
                        SizedBox(height: 10,),
                        Text('  080-635-XXX',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                        SizedBox(height: 20,),
                        Text('E-MAIL',
                            style: TextStyle(
                                color: Color(0xFF162A49),
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0)),
                        SizedBox(height: 10,),
                        Text('  sitkmutt@mail.com',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      ],
                    )
                      ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}