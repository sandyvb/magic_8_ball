import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Ask Me Anything',
            style: TextStyle(color: Color(0xFF000C66), fontSize: 25.0),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7EC8E3),
              Color(0xFF0000FF),
              Color(0xFF000C66),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void getAnswer() {
    setState(() {
      ballNumber = Random().nextInt(20) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () => getAnswer(),
    );
    return InteractiveViewer(
      minScale: 0.5,
      maxScale: 4,
      child: Container(
        child: Center(
          child: FlatButton(
            onPressed: () => getAnswer(),
            child: Image.asset('images/ball$ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
