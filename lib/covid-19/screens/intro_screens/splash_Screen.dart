import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/covid_Provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {


    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, "covidpages",
        arguments: Provider.of<CovidProvider>(context,listen:false).pageno
    ),);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff263238),

        body: Center(child: Image.asset("assets/images/corona.png",height: 60.w,width: 60.w)),

      ),
    );
  }
}

