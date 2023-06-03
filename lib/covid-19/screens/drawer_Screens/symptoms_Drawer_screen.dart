import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Drawer_SymptomsScreen extends StatefulWidget {
  const Drawer_SymptomsScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_SymptomsScreen> createState() => _Drawer_SymptomsScreenState();
}

class _Drawer_SymptomsScreenState extends State<Drawer_SymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Center(
          child: Text("Symptoms Screen",
            style: TextStyle(color: Colors.amber,fontSize: 25.sp),)
    );
  }
}
