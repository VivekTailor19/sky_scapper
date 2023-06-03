import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Drawer_StatisticsScreen extends StatefulWidget {
  const Drawer_StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_StatisticsScreen> createState() => _Drawer_StatisticsScreenState();
}

class _Drawer_StatisticsScreenState extends State<Drawer_StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Center(
          child: Text("Statistics Screen",
            style: TextStyle(color: Colors.red,fontSize: 25.sp),)

    );
  }
}
