import 'package:flutter/material.dart';
import '../widget/settingPage.dart';
import '../DetailPage/DetailsPage1.dart';
import '../widget/MapPage.dart';
import '../widget/ScanPage.dart';
import '../widget/contactPage.dart';


class LxPurplePage extends StatefulWidget {
  @override
  _LxPurplePageState createState() => _LxPurplePageState();
}

class _LxPurplePageState extends State<LxPurplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
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
                              MaterialPageRoute(
                                  builder: (context) => contactPage("")),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.camera),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SacnPage()),
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
                Text('Hibition Purple ZONE',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height - 185.0,
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 300.0,
                      child: ListView(children: [
                        _buildFoodItem(
                            'assets/images/4.png', 'Self Diracted Learning', 'Computer Science',
                            'Self Storage Room : neinbmenrobginrgpikrnbpiernbmeribnerpbkenrbpi','1004' , '1','Social' , 'Bew4','assets/images/unknown0.png'),
                        _buildFoodItem('assets/images/1.png', 'Self Storage', 'Digital Service Innovation',
                            'Self Storage : nberobuinesorbunerurniperbniepsrbnerpibnrepbnerpbiner','1005','1','Science' , 'Bew5','assets/images/unknown1.png'),
                        _buildFoodItem('assets/images/2.png', 'VR MR AR', 'Information Technology',
                            'VR MR AR : nbtiubseo;tbinrgboiergnesruilbre;iur;nurepnre;uineo ingeorinbu[e','1006','1','Math','Bew6','assets/images/unknown2.png'),
                        _buildFoodItem('assets/images/3.png', 'Hand On workshop', 'Information Technology',
                            'Hand On workshop : bperibuneripubnvo;iuebp;oernaiujenbnerier','1007','1','Health','Bew7','assets/images/unknown3.png'),
                        _buildFoodItem('assets/images/5.png', 'Desing Studio', 'Information Technology',
                            'Desing Studio : ginero[bnseruipghbrnp;goirnbpiaur;nearipugbner;gguergui','1008' ,'1','Bio','Bew8','assets/images/unknown4.png')
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
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[

                                      IconButton(
                                        icon: Icon(Icons.map),
                                        iconSize: 55,
                                        color: Colors.orangeAccent,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MapPage()),
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
                  builder: (context) =>
                      DetailsPage1(heroTag: imgPath, foodName: foodName, foodPrice: price, info: info, room: room, floor: floor, name: name,sub: sub,img: img,)
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
                              children: [
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

