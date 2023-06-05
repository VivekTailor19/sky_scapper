import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/covid_Provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CovidProvider? covidT;
  CovidProvider? covidF;

  @override
  Widget build(BuildContext context) {


    covidT = Provider.of<CovidProvider>(context);
    covidF = Provider.of<CovidProvider>(context,listen: false);
    return SafeArea(child: Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: TextField(
                onChanged: (value) {
                  covidF!.searchcountry(value);
                },
                style: TextStyle(color: Color(0xff263238),fontWeight: FontWeight.w400,fontSize: 14.sp),
                cursorColor: Color(0xff263238),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Color(0xff263238),),


                  filled: true,
                  fillColor: Colors.white,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.black12)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.black12))

                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(

            itemCount: covidT!.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.w),
                child: CountryTile(
                    no: index + 1,
                    flag: covidT!.list[index].countryInfo!.flag,
                    name: covidT!.list[index].country,
                    cases: covidT!.list[index].cases,
                    recover: covidT!.list[index].recovered
                ),
              );
            }

            ),
          ),
        ],
      ),
    ));
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
