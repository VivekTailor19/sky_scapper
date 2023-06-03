import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Drawer_HelpScreen extends StatefulWidget {
  const Drawer_HelpScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_HelpScreen> createState() => _Drawer_HelpScreenState();
}

class _Drawer_HelpScreenState extends State<Drawer_HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text("Help Screen",
            style: TextStyle(color: Colors.amber,fontSize: 25.sp),)
    );
  }
}
