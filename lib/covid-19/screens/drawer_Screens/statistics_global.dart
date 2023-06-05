
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/covid_Provider.dart';

class Statistics_Global extends StatefulWidget {
  const Statistics_Global({Key? key}) : super(key: key);

  @override
  State<Statistics_Global> createState() => _Statistics_GlobalState();
}

class _Statistics_GlobalState extends State<Statistics_Global> {

  CovidProvider? covidT;
  CovidProvider? covidF;

  @override
  Widget build(BuildContext context) {

    covidF = Provider.of<CovidProvider>(context,listen:false);
    covidT = Provider.of<CovidProvider>(context,listen:true);
    return Column(
      children: [
        Row(
          children: [
            Column(children: [
              DataBox(title: "Total Cases",smallIcon: "assets/images/statistics/icon/icase.png",graphimg: "assets/images/statistics/graph/case.png",data: "${covidT!.globalcases}"),
              DataBox(title: "Recovered",smallIcon: "assets/images/statistics/icon/irecover.png",graphimg: "assets/images/statistics/graph/recover.png",data: "${covidT!.globalrecover}"),
            ],),
            Container(height: 27.h,width: 48.w,
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.w),
                      child: Column(
                        children: [
                          Text("Ratio of Recovery",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp,),),
                          Padding(
                            padding: EdgeInsets.all(3.w),
                            child: Container(height: 13.h,width: 13.h,
                              child: CircularProgressIndicator(value: covidT!.globalrecover/covidT!.globalcases,strokeWidth: 10,
                                backgroundColor: Color(0xffFF647C),
                                color: Color(0xff00BFA6),
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(height: 2.w,width: 2.w,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffFF647C)),),
                                      Text(" ${(covidT!.globalcases/1000000).toStringAsFixed(0)} M +",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13.sp),)

                                    ],
                                  ),
                                  Text("Affected",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 11.sp),)
                                ],),

                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(height: 2.w,width: 2.w,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff00BFA6)),),
                                      Text(" ${(covidT!.globalrecover/1000000).toStringAsFixed(0)} M +",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13.sp),)
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

                  Align(alignment: Alignment(0,-0.15),
                    child: Text("${(covidT!.globalratio*100).toStringAsFixed(0)} %",style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w400,wordSpacing: -5.sp),),
                  ),



                ],
              ),),

          ],
        ),

        Container(

          width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                // color: Colors.red.shade50,
                border: Border.all(color: Colors.black12,width: 0.5),
        ),
            margin: EdgeInsets.all(2.5.w),

            child: Padding(
              padding: EdgeInsets.all(2.5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Countries",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                      IconButton(onPressed: () => Navigator.pushNamed(context, "search"), icon: Icon(Icons.search_rounded),iconSize: 18.sp,)
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //itemCount: 30,
                    itemCount: covidF!.covidBase.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.w),
                        child: CountryTile(
                          no:index+1,
                          flag: covidT!.covidBase[index].countryInfo!.flag,
                          name: covidT!.covidBase[index].country,
                          cases: covidT!.covidBase[index].cases,
                          recover: covidT!.covidBase[index].recovered
                        ),
                      );

                    },
                    )

                ],
              ),
            ),
        ),
      ],
    );
  }

  Widget DataBox({ String? title, String? data, String? graphimg, String? smallIcon})
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

  Widget CountryTile({ int? no,String?name, int?cases, int?recover, String?flag})
  {
    return Row(
      children: [
        Container(width: 31.sp,alignment: Alignment.center,child: Text("$no .",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w300,),)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Container(height: 10.w,width: 15.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
                image: DecorationImage(image: NetworkImage("$flag"),fit: BoxFit.fill)
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
          children: [
          Container(width:40.w,child: Text("$name",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),overflow: TextOverflow.ellipsis,)),
          Text("Affected  - $cases",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.w200,),overflow: TextOverflow.ellipsis,),
          Text("Recovered - $recover",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.w200,),overflow: TextOverflow.ellipsis,),
        ],),


        Container(height: 17.w,width: 17.w,
          child: Stack(
            children: [
              Container(height: 15.w,width: 15.w,child: CircularProgressIndicator(
                color: ((recover!/cases!)*100) > 85 ? Color(0xff00BFA6) : Color(0xffFF647C) ,
                backgroundColor: Colors.black12,strokeWidth: 5,value: recover/cases ,)),
              Align(alignment: Alignment(0,0),
                child: Text("${((recover/cases)*100).toStringAsFixed(0)} % ",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400),))
          ],
          ),
        )
      ],
    );
  }

}
