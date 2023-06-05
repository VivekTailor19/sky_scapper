import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/covid_Provider.dart';

class Statistics_India extends StatefulWidget {
  const Statistics_India({Key? key}) : super(key: key);

  @override
  State<Statistics_India> createState() => _Statistics_IndiaState();
}

class _Statistics_IndiaState extends State<Statistics_India> {

  CovidProvider? covidT;
  CovidProvider? covidF;

  @override
  Widget build(BuildContext context) {

    covidF = Provider.of<CovidProvider>(context,listen:false);
    covidT = Provider.of<CovidProvider>(context,listen:true);

    return Column(children: [

      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          DataBox(title: "Total Cases",smallIcon: "assets/images/statistics/icon/icase.png",graphimg: "assets/images/statistics/graph/case.png",data: "${(covidT!.covidBase[covidT!.indiaindex].cases)}"),
          DataBox(title: "Active",smallIcon: "assets/images/statistics/icon/iactive.png",graphimg: "assets/images/statistics/graph/active.png",data: "${covidT!.covidBase[covidT!.indiaindex].active}"),
        ],), //     totalcases , active

      Container(height: 25.h,width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          //color: Colors.red.shade50,
          border: Border.all(color: Colors.black12,width: 0.5),
        ),

        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.w),
                child: Column(
                  children: [
                    Text("Ratio of Recovery",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp,),),
                    Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Container(height: 13.h,width: 13.h,
                        child: CircularProgressIndicator(value: covidT!.covidBase[covidT!.indiaindex].recovered!/covidT!.covidBase[covidT!.indiaindex].cases!,
                          strokeWidth: 10,
                          backgroundColor: Color(0xffFF647C),
                          color: Color(0xff00BFA6),
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(height: 2.w,width: 2.w,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffFF647C)),),
                                Text(" ${(covidT!.covidBase[covidT!.indiaindex].cases! / 1000000).toStringAsFixed(0)} M +",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13.sp),)
                                // color,number +
                                //red === FF647C   ; teal == 00BFA6
                              ],
                            ),
                            Text("Affected",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 11.sp),)
                          ],),

                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(height: 2.w,width: 2.w,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff00BFA6)),),
                                Text(" ${(covidT!.covidBase[covidT!.indiaindex].recovered!/1000000).toStringAsFixed(0)} M +",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13.sp),)
                              ],
                            ),
                            Text("Recovered",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 11.sp),)
                          ],),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Align(alignment: Alignment(0,-0.1.sp),
              child: Text("${((covidT!.covidBase[covidT!.indiaindex].recovered! / covidT!.covidBase[covidT!.indiaindex].cases!)*100).toStringAsFixed(0)} %",style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w400,wordSpacing: -5.sp),),
            ),



          ],
        ),),

      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DataBox(title: "Total Tests",smallIcon: "assets/images/statistics/icon/itest.png",graphimg: "assets/images/statistics/graph/test.png",data: "${covidT!.covidBase[covidT!.indiaindex].tests}"),
          DataBox(title: "Death",smallIcon: "assets/images/statistics/icon/ideath.png",graphimg: "assets/images/statistics/graph/death.png",data: "${covidT!.covidBase[covidT!.indiaindex].deaths}"),
        ],), //   total tests ,   death

      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DataBox(title: "Critical",smallIcon: "assets/images/statistics/icon/icritical.png",graphimg: "assets/images/statistics/graph/critical.png",data: "${covidT!.covidBase[covidT!.indiaindex].critical}"),
          DataBox(title: "Recovered",smallIcon: "assets/images/statistics/icon/irecover.png",graphimg: "assets/images/statistics/graph/recover.png",data: "${covidT!.covidBase[covidT!.indiaindex].recovered}"),

        ],),    //critical  ,    recovered



    ],
    );
  }
  Widget DataBox({String? title, String? data, String? graphimg, String? smallIcon})
  {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 3.w,horizontal: 2.5.w),
      child: Container(
        height: 12.h,
        width: 45.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          // color: Colors.red.shade50,
          border: Border.all(color: Colors.black12,width: 0.5),
        ),
        alignment: Alignment.bottomRight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.9,0.7),
              child: Container(height: 8.h,width: 25.w,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("$graphimg"),fit: BoxFit.fill)),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.w,top: 2.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$title",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp),),
                      SizedBox(width: 1.w),
                      Image.asset("$smallIcon",height: 10.sp,width: 10.sp,fit: BoxFit.fill,)
                    ],
                  ),
                  Text("$data",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,letterSpacing: -0.5),)
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
