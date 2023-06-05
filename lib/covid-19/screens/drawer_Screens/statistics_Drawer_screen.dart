import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:sky_scapper/covid-19/provider/covid_Provider.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/statistics_global.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/statistics_india.dart';

class Drawer_StatisticsScreen extends StatefulWidget {
  const Drawer_StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_StatisticsScreen> createState() => _Drawer_StatisticsScreenState();
}

class _Drawer_StatisticsScreenState extends State<Drawer_StatisticsScreen> {

  CovidProvider? covidT;
  CovidProvider? covidF;

  @override
  Widget build(BuildContext context) {

    covidF = Provider.of<CovidProvider>(context,listen:false);
    covidT = Provider.of<CovidProvider>(context,listen:true);

    return FutureBuilder(
      future: covidF!.getCovidData(),
      builder: (context, snapshot) {
        if(snapshot.hasError)
          {
            return Center(child: Text("Sorry, for Inconvenience.\n I thick your internet connection is slow,\n Please check your internet connectivity.\n\n Start app again..."));
          }
        else if(snapshot.hasData)
          {
            return Scrollbar(
              thickness: 4.w,

              interactive: true,
              //trackVisibility: true,
              thumbVisibility: true,
              radius: Radius.circular(5.w),


              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(height: 15.h,width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.sp), bottomRight: Radius.circular(30.sp),),
                        color: Color(0xff263238),
                      ),
                      alignment: Alignment.center,

                      child: Container(width:70.w,height: 4.6.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.3.h),
                            color: Color(0xff3F414E)
                        ),
                        child:Row(
                          children: [
                            InkWell(
                              onTap: (){
                                covidT!.isGlobal = false;
                                covidT!.isIndia = true;
                                covidF!.colorChange(covidT!.isGlobal,covidT!.isIndia);
                                covidF!.findIndia();
                              },
                              child: Container(height: 4.6.h,width: 35.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.3.h),
                                    color: covidT!.tabIndia
                                ),
                                alignment: Alignment.center,
                                child: Text("India",style: TextStyle(color:covidT!.textIndia,fontSize: 14.sp),),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                covidT!.isGlobal = true;
                                covidT!.isIndia = false;
                                covidF!.colorChange(covidT!.isGlobal,covidT!.isIndia);
                                covidF!.findGlobalCovidData();
                              },
                              child: Container(height: 4.6.h,width: 35.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.3.h),
                                    color: covidT!.tabGlobal
                                ),
                                alignment: Alignment.center,
                                child: Text("Global",style: TextStyle(color:covidT!.textGlobal,fontSize: 14.sp),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    covidT!.isGlobal == false ? Statistics_India() :  Statistics_Global(),
                    // Statistics_India(),
                  ],
                ),
              ),
            );

          }
        return Center(child: CircularProgressIndicator(color: Color(0xff263238),));

       },
    );








  }


}


/*

total cases                    total active
            ratio of recovery
total tests                      recovred ---

critical ---                      death   ---


*/