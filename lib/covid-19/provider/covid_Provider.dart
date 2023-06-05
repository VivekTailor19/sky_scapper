import 'package:flutter/material.dart';
import 'package:sky_scapper/covid-19/api/covid_API.dart';
import 'package:sky_scapper/covid-19/model/covid_model.dart';
import 'package:sky_scapper/covid-19/model/drawerItem_model.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/article_Drawer_screen.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/help_Drawer_screen.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/home_Drawer_screen.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/news_Drawer_screen.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/prevention_Drawer_screen.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/statistics_Drawer_screen.dart';
import 'package:sky_scapper/covid-19/screens/drawer_Screens/symptoms_Drawer_screen.dart';

import '../model/prevention_model.dart';
import '../model/splashmodel.dart';

class CovidProvider extends ChangeNotifier
{

  List<CoronaModel> covidBase = [];

  Future<List<CoronaModel>> getCovidData()
  async {
    covidBase = await Covid_API.covid_api.getCovid_Api();
    return covidBase;
  }


  List<CoronaModel> list = [];
  List<CoronaModel> filtered = [];

  void searchcountry(String search)
  {
    if(search.isEmpty)
      {
        list = covidBase;
      }
    else
      {
        filtered.clear();

        for(var c in covidBase)
          {
            if(c.country!.toLowerCase().contains(search.toLowerCase()))
              {
                filtered.add(c);
              }
          }
        list = filtered;
      }
    notifyListeners();
  }


  List<SplashModel> pages = [
    SplashModel(title: "Wear a Mask",buttontext: "GET STARTED",imgpath: "assets/images/wear.png",data: "For your safety and the safety of others a mask should be worn at all times."),
    SplashModel(title: "Hand Wash & Sanitize",buttontext: "NEXT",imgpath: "assets/images/hand.png",data: "Washing your hands with soap can help reduce the risk of infection."),
    SplashModel(title: "Physical Distancing",buttontext: "ENTER APP",imgpath: "assets/images/distance.png",data: "Maintain at least 1-meter (3 feet) distance between yourself and anyone who is coughing or sneezing."),
  ];

  int pageno = 0;
  void changepage(int index)
  {
    pageno = index +1;
    notifyListeners();
  }



  int selectedDrawer = 0;

  void changeDrawerIndex(int index)
  {
    selectedDrawer = index;
    notifyListeners();
  }
  List<DrawerItemModel> draweritems = [
      DrawerItemModel(icon:Icons.home, title:"Home", widget:Drawer_HomeScreen(), ),
      DrawerItemModel(icon:Icons.insert_chart_outlined_rounded,title:"Statistics",widget:Drawer_StatisticsScreen(),),
      DrawerItemModel(icon:Icons.support_rounded,title:"Symptoms",widget:Drawer_SymptomsScreen(),),
      DrawerItemModel(icon:Icons.library_add_check_outlined,title:"Preventation",widget:Drawer_PreventionScreen(),),
      DrawerItemModel(icon:Icons.article_outlined,title:"Article",widget:Drawer_ArticleScreen(),),
      DrawerItemModel(icon:Icons.newspaper_rounded,title:"News",widget:Drawer_NewsScreen(),),
      DrawerItemModel(icon:Icons.help_outline_rounded,title:"Help",widget:Drawer_HelpScreen(),),
    ];

  List<String> titles = [
    "",
    "Statistics",
    "Symptoms",
    "Preventation",
    "Article",
    "News",
    "Help"
  ];

  List<PreventionModel> preventions = [
    PreventionModel(title:"Use Mask", imgpath:"assets/images/prevention/p1.png",data:"For your safety and the safety of others a mask should be worn at all times."),
    PreventionModel(title:"Avoid Close Contact", imgpath:"assets/images/prevention/p2.png",data:"Maintain at least 1-meter (3 feet) distance between yourself and anyone who is coughing or sneezing."),
    PreventionModel(title:"Wash Your Hand", imgpath:"assets/images/prevention/p3.png",data:"Washing your hands with soap can help reduce the risk of infection."),
  ];


  // Statistics Screen

  // Color textIndia = Colors.white;
  // Color tabIndia = Color(0xff3F414E);
  //
  // Color textGlobal = Color(0xff3F414E);
  // Color tabGlobal = Colors.white;

  Color textIndia = Color(0xff3F414E);
  Color tabIndia = Colors.white;

  Color textGlobal = Colors.white;
  Color tabGlobal = Color(0xff3F414E);

  bool isIndia = true;
  bool isGlobal = false;



  void colorChange(bool global, bool india)
  {
    isGlobal = global;
    isIndia = india;

    if( isGlobal ==true)
      {
         textIndia = Colors.white;
         tabIndia = Color(0xff3F414E);
         textGlobal = Color(0xff3F414E);
         tabGlobal = Colors.white;
      }
    else
      {
        textIndia = Color(0xff3F414E);
        tabIndia = Colors.white;
        textGlobal = Colors.white;
        tabGlobal =Color(0xff3F414E);
      }

    notifyListeners();
  }


  int globalcases = 1;
  int globalrecover = 1;
  double globalratio = 1;
  void findGlobalCovidData()
  {
    int tempCase = 0;
    int tempRecover = 0;

    for(int i = 0 ; i< covidBase.length ; i++)
      {
        tempCase = tempCase + covidBase[i].cases!;
        tempRecover = tempRecover + covidBase[i].recovered!;

      }

    globalcases = tempCase;
    globalrecover = tempRecover;
    globalratio = globalrecover / globalcases;
    print("recover = $globalratio");
    notifyListeners();
  }


  int indiaindex = 0;
  void findIndia()
  {
    for(int i = 0 ; i< covidBase.length ; i++)
    {
      if(covidBase[i].country == "India")
        {
          indiaindex = i;
          print(" India == $indiaindex");
        }
      notifyListeners();

    }

  }








}