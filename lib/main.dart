import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scapper/random_user/provider/userProvider.dart';
import 'package:sky_scapper/random_user/screen/homeScreen.dart';
import 'package:sky_scapper/select_Project.dart';

import 'covid-19/provider/covid_Provider.dart';
import 'covid-19/screens/intro_screens/splash_Screen.dart';

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
            "/":(context) => Projects(),
            "random":(context) => RandomUser(),
            "covid":(context) => SplashScreen(),
          },
        )),
    ),
  );
}


