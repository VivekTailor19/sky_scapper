import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Drawer_NewsScreen extends StatefulWidget {
  const Drawer_NewsScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_NewsScreen> createState() => _Drawer_NewsScreenState();
}

class _Drawer_NewsScreenState extends State<Drawer_NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text("News Screen",
            style: TextStyle(color: Colors.amber,fontSize: 25.sp),)
    );
  }
}
