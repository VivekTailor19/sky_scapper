import 'package:flutter/material.dart';

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

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(onPressed: () {
              Navigator.pushNamed(context, "random");
            }, child:Text("Random User")),

            TextButton(onPressed: () {
              Navigator.pushNamed(context, "covid");
            }, child:Text("Covid-19")),

          ],
        ),
      ),
    );
  }
}
