import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';
import '../widget/MapPage/bottomSheet.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;
  final info;
  final room;
  final floor;
  final name;
  final sub;
  final img;
  final img2;

  DetailsPage({this.heroTag, this.foodName, this.foodPrice, this.info, this.floor,this.name,this.room , this.sub, this.img, this.img2});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {

  var selectedCard = 'WEIGHT';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0xFF162A49),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: ListView(
            children: [
                 Column(
                  children: <Widget>[
                    Stack(children: [
                      Container(
                          height: MediaQuery.of(context).size.height ,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent),
                      Positioned(
                          top: 75.0,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45.0),
                                  topRight: Radius.circular(45.0),
                                ),
                                color: Colors.orange,),
                              height: MediaQuery.of(context).size.height - 100.0,
                              width: MediaQuery.of(context).size.width)),
                      Positioned(
                          top: 30.0,
                          left: (MediaQuery.of(context).size.width / 2) - 100.0,
                          child: Hero(
                              tag: widget.heroTag,
                              child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(widget.heroTag),
                                          fit: BoxFit.cover)),
                                  height: 200.0,
                                  width: 200.0))),
                      Positioned(
                          top: 250.0,
                          left: 25.0,
                          right: 25.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.foodName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(widget.foodPrice,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          color: Colors.grey)),
                                  Container(height: 25.0, color: Colors.grey, width: 1.0),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                  height: 100.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      _buildInfoCard('Zone', widget.room, 'Lx'),
                                      SizedBox(width: 10.0),
                                      _buildInfoCard('Subject', widget.name, 'Subject'),
                                      SizedBox(width: 10.0),
                                    ],
                                  )
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(widget.info),
                                width: 400,
                                height: 100,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom:0.0),
                                child: Container(
                                  height: 50.0,
                                  child: Center(
                                    child: Text(
                                        widget.floor,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      bottomSheet(img: widget.img,),
                    ])
                  ],
                ),
        ]));

  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedCard ? Color(0xFF162A49) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard ?
                  Colors.transparent :
                  Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75
              ),

            ),
            height: 100.0,
            width: 170.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color:
                          cardTitle == selectedCard ? Colors.white : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ]
            )
        )
    );

  }



  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}








