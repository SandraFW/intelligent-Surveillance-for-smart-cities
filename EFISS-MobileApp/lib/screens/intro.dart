import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../Animation/FadeAnimation.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Carousel(
            boxFit: BoxFit.cover,
            images: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/security1.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70.0, left: 130.0),
                    child: FadeAnimation(
                      4,
                      Text(
                        'Right Protection, Right Time',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Arial Black',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue[900],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/security2.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/security4.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ],
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1500),
            showIndicator: false,
          ),
          Container(
            margin: EdgeInsets.only(top: 580.0, left: 90.0),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) {
                //return Login();
                //}));
              },
              color: Colors.lightBlue[900],
              textColor: Colors.white,
              child: Container(
                padding: EdgeInsets.only(
                    left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                child: Text('Login',
                    style:
                        TextStyle(fontSize: 20, fontFamily: 'SourceSansPro')),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
