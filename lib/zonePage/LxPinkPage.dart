import 'package:flutter/material.dart';
import '../widget/settingPage.dart';
import '../widget/MapPage.dart';
import '../widget/ScanPage.dart';
import '../widget/contactPage.dart';
import '../DetailPage/DetailsPage.dart';


class LxBrownPage extends StatefulWidget {
  @override
  _LxBrownPageState createState() => _LxBrownPageState();
}

class _LxBrownPageState extends State<LxBrownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
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
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                ),
                Container(
                    width: 150.0,
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
                          icon: Icon(Icons.camera),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SacnPage()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingPage()),
                            );
                          },
                        )
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
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Hibition Pink ZONE',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
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
                        _buildFoodItem('assets/images/4.png', 'Automated Drink ', 'Computer Science',
                            'Automated : irnbornbipefbnefpbiunefboiefjben f ndbfp','1001','1','Computer','Bew1','assets/images/unknown5.png'),
                        _buildFoodItem('assets/images/1.png', 'Vending Maching', 'Computer Science',
                            "Vending Maching : irnbornbipefbnefpbiunefboiefjben fhibn efpfp",'1002','1','Physics','Bew2','assets/images/unknown6.png'),
                        _buildFoodItem('assets/images/2.png', 'Popup Exhibition', 'Computer Science',
                            'Popup Exhibition : irnbornbipefbnefpbiunefboiefjben fhibn ebf fduin fipu ndbfp','1003','1','Science','Bew3','assets/images/unknown7.png'),
                      ])),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 90, left: 80.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                width: 150.0,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[

                                      IconButton(
                                        icon: Icon(Icons.map),
                                        iconSize: 55,
                                        color: Colors.orangeAccent,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>MapPage()),
                                          );
                                        },
                                      ),
                                    ]

                                )
                            )
                          ]
                      ),
                    )
                  ],
                )
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
                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price, info: info, room: room, floor: floor, name: name,sub: sub, img: img,)
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


