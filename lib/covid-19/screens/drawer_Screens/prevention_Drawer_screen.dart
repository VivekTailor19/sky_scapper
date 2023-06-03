import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Drawer_PreventionScreen extends StatefulWidget {
  const Drawer_PreventionScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_PreventionScreen> createState() => _Drawer_PreventionScreenState();
}

class _Drawer_PreventionScreenState extends State<Drawer_PreventionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text("Prevention Screen",
            style: TextStyle(color: Colors.amber,fontSize: 25.sp),)
    );
  }
}
