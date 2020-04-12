import 'package:flutter/material.dart';
import '../widget/settingPage.dart';
import '../DetailPage/DetailsPage2.dart';
import '../widget/MapPage.dart';
import '../widget/ScanPage.dart';
import '../widget/contactPage.dart';



class LxGreenPage extends StatefulWidget {
  @override
  _LxGreenPageState createState() => _LxGreenPageState();
}

class _LxGreenPageState extends State<LxGreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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
                Text('Hibition Green ZONE',
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
                        _buildFoodItem('assets/images/4.png', 'MC Show Room', 'Computer Science',
                            'MC Show Room : reinb[oerinberoibnmre;binbjiurneripsueripubnero;uienrbu','1009','1','Social','Bew9','assets/images/unknown8.png'),
                        _buildFoodItem('assets/images/1.png', 'Reseaful Show case', 'Computer Science',
                            'Reseaful Show case : beilrnuverlgiubaw;ivlbrp uibrwigubrgiur bgurigbpu' ,'1010' , '1', 'Social', 'Bew10','assets/images/unknown9.png'),
                        _buildFoodItem('assets/images/2.png', 'LX Building Studio', 'Computer Science',
                            'LX Building Studio : gnerpobnero[binrbeinboies;nbepsibnreobnrel;boiner[','1011' , '1' , 'Scence', 'Bew11','assets/images/unknown10.png'),
                        _buildFoodItem('assets/images/3.png', 'Inovation Show Cart', 'Computer Science',
                            'Inovation Show Cart : tunberngriungbperiubnerliburiueriugber;vuioriprnveru','1012' , '1' , 'Math' , 'Bew12','assets/images/unknown13.png'),
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
                  builder: (context) => DetailsPage2(heroTag: imgPath, foodName: foodName, foodPrice: price, info: info, room: room, floor: floor, name: name,sub: sub , img: img,)
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


