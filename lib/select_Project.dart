import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () {
                Navigator.pushNamed(context, "random");
              }, child:Text("Random User",style: TextStyle(fontSize: 20.sp),)),

              TextButton(onPressed: () {
                Navigator.pushNamed(context, "covid");
              }, child:Text("Covid-19",style: TextStyle(fontSize: 20.sp),)),

            ],
          ),
        ),
      ),
    );
  }
}
