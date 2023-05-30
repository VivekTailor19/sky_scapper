import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scapper/random_user/provider/userProvider.dart';
import 'package:sky_scapper/random_user/screen/homeScreen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UserProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => HomeScreen()
          },
        )),
    ),
  );
}
