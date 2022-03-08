import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parcel_rider/authentification/auth_screen.dart';

class MySplashScreen extends StatefulWidget {


  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  //yesma chai kati bersamma splashscreen dekhauni vanera ho

  startTimer() {
    Timer(const Duration(seconds: 5), () async {
      {
        Route newRoute = MaterialPageRoute(builder: (context) => AuthScreen());
        Navigator.pushReplacement(context, newRoute);
      }

      // {
      //   Route newRoute =
      //       MaterialPageRoute(builder: (context) => const HomePage());
      //   Navigator.pushReplacement(context, newRoute);
      // }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/1.png'),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Parcel Goods Online',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40, letterSpacing: 3, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
