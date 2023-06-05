import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scapper/covid-19/provider/covid_Provider.dart';

class Covid_First extends StatefulWidget {
  const Covid_First({Key? key}) : super(key: key);

  @override
  State<Covid_First> createState() => _Covid_FirstState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _Covid_FirstState extends State<Covid_First> {

    CovidProvider? covidT;
    CovidProvider? covidF;

  @override
  Widget build(BuildContext context) {

    covidT = Provider.of<CovidProvider>(context);
    covidF = Provider.of<CovidProvider>(context,listen: false);


    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,

        appBar: AppBar(backgroundColor: Color(0xff263238),
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.sort_rounded),
            color: Colors.white,
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },

          ),
          title:Text("${covidF!.titles[covidT!.selectedDrawer]}",style: TextStyle(fontSize: 18.sp,color: Colors.white),)
        ),

        drawer: Container(
          //    height: 100.h,width: 100.w,

          child: Drawer(
            backgroundColor: Color(0xff263238),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row( mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                              Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                      color: Colors.white,iconSize: 21.sp,)],),
                Container( width :75.w,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(alignment: Alignment.center,child: Image.asset("assets/images/corona.png",height: 40.w,width: 40.w,)),
                      Container(margin: EdgeInsets.symmetric(vertical: 15.sp),alignment: Alignment.center,child: Text("Covid Resources",style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
                      Divider(color: Colors.white,thickness: 1,height: 1.5.h,),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(onTap: () {
                            covidF!.changeDrawerIndex(index);

                            Navigator.pop(context);
                             },
                              child: DrawerTile(covidT!.draweritems[index].icon!,covidT!.draweritems[index].title!));
                          },
                        itemCount: covidT!.draweritems.length,
                        shrinkWrap: true,
                      ),


                    ],
                  ),
                ),


              ],
            ),
          ),
        ),

        body: covidT!.draweritems[covidT!.selectedDrawer].widget
      ),
    );
  }

  Widget DrawerTile(IconData icon, String title)
  {
    return ListTile(
        leading: Icon(icon,color: Colors.white,size:20.sp,),
        title: Text("$title",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w600),)
    );
  }
}



// ratio of recovered = number of recovered cases per total positive coronavirus cases,
//    Color codes  ==>>>> red === FF647C   ; teal == 00BFA6
//

/*
 ==== Database =====

      country
      countryInfo == flag

      total and today { cases  deaths  recovered}

      active
      critical
      total tests
      population

 */



