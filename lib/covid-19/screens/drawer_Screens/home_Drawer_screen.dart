import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Drawer_HomeScreen extends StatefulWidget {
  const Drawer_HomeScreen({Key? key}) : super(key: key);

  @override
  State<Drawer_HomeScreen> createState() => _Drawer_HomeScreenState();
}

class _Drawer_HomeScreenState extends State<Drawer_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.sp), bottomRight: Radius.circular(30.sp),),
            color: Color(0xff263238),

          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  child: Text("Covid-19",style: TextStyle(color: Colors.white,fontSize: 22.sp,fontWeight: FontWeight.w400,letterSpacing: 0.5),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.sp),
                  child: Text("Are you feeling sick ?",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w300),),
                ),
                Text("If you feel sick with any of covid-19 symptoms\nplease call or message us immediately for help.",style: TextStyle(color: Colors.white,fontSize: 11.sp,fontWeight: FontWeight.w300),textAlign: TextAlign.left,),

                Padding(
                  padding:EdgeInsets.symmetric(vertical:3.h),
                  child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 40.w,height: 6.h,
                        alignment: Alignment.center,
                        child: Row(mainAxisSize: MainAxisSize.min,
                            children:[
                            Icon(Icons.call_rounded,color: Colors.white,size: 16.sp,),
                            SizedBox(width: 3.w,),
                            Text("CALL NOW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13.sp),),
                            ],
                          ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.h),color: Color(0xffFF464F)),),
                      Container(width: 40.w,height: 6.h,
                        alignment: Alignment.center,
                        child: Row(mainAxisSize: MainAxisSize.min,
                            children:[
                            Icon(Icons.mail_outline_rounded,color: Colors.white,size: 16.sp,),
                            SizedBox(width: 3.w,),
                            Text("SEND SMS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13.sp),),
                            ],
                          ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.h),color: Color(0xff09B5FF)),),

                  ],),
                ),




              ],
            ),
          ),
        ),
        HomeTabs("Prevention"),
        HomeTabs("Article"),
        HomeTabs("News"),


      ],
    );
  }

  Widget HomeTabs(String title)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 10.sp),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500),),
          Icon(Icons.arrow_forward_rounded,size: 20.sp,),
        ],
      ),
    );
  }
}
