import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Drawer_ArticleScreen extends StatefulWidget {
  const Drawer_ArticleScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_ArticleScreen> createState() => _Drawer_ArticleScreenState();
}

class _Drawer_ArticleScreenState extends State<Drawer_ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text("Article Screen",
            style: TextStyle(color: Colors.amber,fontSize: 25.sp),));
  }
}
