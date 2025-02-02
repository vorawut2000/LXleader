import 'package:flutter/material.dart';
import '../widget/settingPage.dart';
import '../DetailPage/DetailsPage.dart';
import '../widget/ScanPage.dart';
import '../widget/contactPage.dart';
import '../widget/MapPage/NewMapPage.dart';



class zoneC extends StatefulWidget {
  @override
  _zoneCState createState() => _zoneCState();
}

class _zoneCState extends State<zoneC> {
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
                        IconButton(
                          icon: Icon(Icons.call),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>contactPage("")),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ScannerPage()),
                            );
                          },
                        ),
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
                Text('LX',
                    style: TextStyle(
                        fontFamily: 'Hibition RED ZONE',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0)),
                SizedBox(width: 10.0),
                Text('ZONE C',
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
                      child: ListView(children: [
                        _buildFoodItem('assets/images/KMUTT.png', 'Escase Room', 'Computer Science',
                            'Escase Room : Lorem Ipsum','C',
                            'Round 1: 09.00 - 10.00 \nRound 2: 11.00 - 12.00 \nRound 3: 13.00 - 14.00',
                            'bew9','Math','assets/images/11.png'),
                        _buildFoodItem('assets/images/KMUTT1.png', 'ORO', 'Computer Science',
                            'ORO : Lorem Ipsum','C','','Bew10','Science','assets/images/12.png'),
                      ])),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price, String info , String room ,String floor , String name ,String sub,String img) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    heroTag: imgPath, foodName: foodName, foodPrice: price, info: info, room: room, floor: floor, name: name,sub: sub,img: img)
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                        children: [
                          Hero(
                              tag: imgPath,
                              child: Image(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.cover,
                                  height: 75.0,
                                  width: 75.0
                              )
                          ),
                          SizedBox(width: 10.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                    foodName,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Text(
                                    price,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',

                                        fontSize: 15.0,
                                        color: Colors.grey
                                    )
                                )
                              ]
                          )
                        ]
                    )
                ),
                IconButton(
                    icon: Icon(Icons.arrow_right),
                    color: Colors.black,
                    onPressed: () {}
                )
              ],
            )
        ));
  }
}


