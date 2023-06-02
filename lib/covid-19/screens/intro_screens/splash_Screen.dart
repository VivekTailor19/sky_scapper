import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() => Navigator.pushNamed(context, "page"),);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff263238),

        body: Center(child: Image.asset("assets/images/corona.png",height: 70.w,width: 70.w)),

      ),
    );
  }
}



/*
country
countryInfo == flag

total and today { cases  deaths  recovered}

active
critical
total tests
population

*/