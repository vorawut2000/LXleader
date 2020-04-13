import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

const double minHeight = 60;

const double iconStartSize = 0;  //<-- add edge values
const double iconEndSize = 500;  //<-- add edge values
const double iconStartMarginTop = 36;  //<-- add edge values
const double iconEndMarginTop = 80;  //<-- add edge values
const double iconsVerticalSpacing = 24;  //<-- add edge values
const double iconsHorizontalSpacing = 16;  //<-- add edge values

class bottomSheet1 extends StatefulWidget {
  @override
  _bottomSheet1State createState() => _bottomSheet1State();

}

class _bottomSheet1State extends State<bottomSheet1>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController( //<-- initialize a controller
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); //<-- and remember to dispose it!
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  //MAP Margin
  double get headerTopMargin => lerp(15, 15 + MediaQuery.of(context).padding.top); //<-- Add new property
  double get headerFontSize => lerp(14, 24);    //<-- Add new property

  //full map
  double get iconSize => lerp(iconStartSize, iconEndSize);
  double iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize)) +
          headerTopMargin; //<-- calculate top margin based on header margin, and size of all of icons above (from small to big)

  double iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0); //<-- calculate left margin (from big to small)

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child){
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,  //<-- Add verticalDragUpdate callback
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Color(0xFF162A49),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(           //<-- Add a stack
                children: <Widget>[
                  _fullMap(),
                  SheetHeader(                //<-- Add a header with params
                    fontSize: headerFontSize,
                    topMargin: headerTopMargin,
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2); //<-- ...snap the sheet in proper direction
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight; //<-- Update the _controller.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0); //<-- or just continue to whichever edge is closer
  }

  Widget _fullMap(){
    return Positioned(
        child: Center(
          child: Image.asset(
            'assets/images/LXExhibitPlan01-1.jpg',
            fit: BoxFit.cover,
            height: iconSize,
          ),
        )
    );
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        'MAP ^',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}

