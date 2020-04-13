import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../zonePage/zoneA.dart';
import '../../zonePage/zoneB.dart';
import '../../zonePage/zoneD1.dart';
import '../../zonePage/zoneC.dart';
import 'dart:math' as math;

class sliding extends StatefulWidget {
  @override
  _slidingState createState() => _slidingState();
}

class _slidingState extends State<sliding> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,

      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'ZONE A',
            date: 'MC Show Room  , Reseaful Show case ,    LX Building , Innovation show cart',
            assetName: 'ZoneA.png',
            offset: pageOffset,
            zone: zoneA(),
          ),
          SlidingCard(
            name: 'ZONE B',
            date: 'Automatic Drink , Vending Machine ,     Popup Exhibition',
            assetName: 'ZoneB.png',
            offset: pageOffset - 1,
            zone: zoneB(),
          ),
          SlidingCard(
            name: 'ZONE C',
            date: 'Escape Romm , ORO',
            assetName: 'ZoneC.png',
            offset: pageOffset - 2,
            zone: zoneC(),
          ),
          SlidingCard(
            name: 'ZONE D',
            date: 'Self Directed Learning , Self Storage , VR AV MR , Hand On Work Shop Design Studio',
            assetName: 'ZoneD.png',
            offset: pageOffset - 3,
            zone: zoneD(),
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;
  final zone;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
    @required this.zone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 0) / 0.10));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/images/$assetName',
                height: MediaQuery.of(context).size.height * 0.42,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
                zone: zone,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;
  final zone;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset,
      @required this.zone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: RaisedButton(
                  color: Color(0xFF162A49),
                  child: Transform.translate(
                    offset: Offset(24 * offset, 0),
                    child: Text('Acitivities of $name'),
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => zone),
                    );
                  },
                ),
              ),
              Spacer(),
              // Transform.translate(
              //   offset: Offset(32 * offset, 0),
              //   child: Text(
              //     '0.00 \$',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}