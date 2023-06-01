import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scapper/covid-19/screens/searchcountry.dart';
import 'package:sky_scapper/random_user/provider/userProvider.dart';
import 'package:sky_scapper/random_user/screen/homeScreen.dart';

import 'covid-19/provider/covid_Provider.dart';
import 'covid-19/screens/covid_home.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UserProvider(),),
            ChangeNotifierProvider(create: (context) => CovidProvider(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "covid",
          routes: {
            "/":(context) => HomeScreen(),
            "covid":(context) => Covid_HomeScreen(),
            "search":(context) => SearchScreen(),
          },
        )),
    ),
  );
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