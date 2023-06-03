import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../provider/covid_Provider.dart';

class Intro_Pages extends StatefulWidget {
  const Intro_Pages({Key? key}) : super(key: key);

  @override
  State<Intro_Pages> createState() => _Intro_PagesState();
}

class _Intro_PagesState extends State<Intro_Pages> {

  CovidProvider? covidT;
  CovidProvider? covidF;

  @override
  Widget build(BuildContext context) {

    covidT = Provider.of<CovidProvider>(context);
    covidF = Provider.of<CovidProvider>(context,listen: false);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 1.h),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child:
                Image.asset("${covidF!.pages[index].imgpath}",height: 80.w,width: 80.w,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.5.h),
                child:
                Text("${covidF!.pages[index].title}",style: TextStyle(color: Color(0xff263238),fontSize: 24.sp,fontWeight: FontWeight.w600),),
              ),
              Container(height:50.sp,child:
                Text("${covidF!.pages[index].data}",style: TextStyle(color: Color(0xff263238),fontSize: 15.sp,fontWeight: FontWeight.w300),textAlign: TextAlign.center,maxLines: 3,)),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: AnimatedSmoothIndicator(
                  activeIndex: index,
                  count: covidF!.pages.length,
                  effect: ExpandingDotsEffect(
                    spacing: 5,
                    activeDotColor: Color(0xff263238),
                    dotColor: Colors.black26,
                    dotHeight: 10,
                    dotWidth: 10,
                    radius: 5,
                  ),
                ),
              ),

              InkWell(

                onTap: () {

                  covidF!.changepage(covidT!.pageno);
                  covidT!.pageno <= 2   ?   Navigator.pushReplacementNamed(context, "covidpages",arguments: covidT!.pageno)   :
                          Navigator.pushReplacementNamed(context, "covidfirst");

                  // if(covidT!.pageno <= 2)
                  //   {
                  //     Navigator.pushNamed(context, "covidpages",arguments: covidT!.pageno);
                  //   }
                  // else
                  //   {
                  //     Navigator.pushNamed(context, "covidhome");
                  //   }

                },
                child: Container(height: 6.h,width: 70.w,
                    decoration: BoxDecoration(
                      color: Color(0xff263238),
                      borderRadius: BorderRadius.circular(3.h),),

                  alignment: Alignment.center,
                  child: Text("${covidF!.pages[index].buttontext}" ,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16.sp),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
