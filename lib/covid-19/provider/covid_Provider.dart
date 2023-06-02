import 'package:flutter/foundation.dart';
import 'package:sky_scapper/covid-19/api/covid_API.dart';
import 'package:sky_scapper/covid-19/model/covid_model.dart';

import '../model/splashmodel.dart';

class CovidProvider extends ChangeNotifier
{

  List<CoronaModel> covidBase = [];

  Future<List<CoronaModel>> getCovidData()
  async {
    covidBase = await Covid_API.covid_api.getCovid_Api();
  //  list = covidBase;
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
    SplashModel(title: "Physical Distancing",buttontext: "ENTER APP",imgpath: "assets/images/distance.png",data: "Maintain at least 1-meter (3 feet) distance between yourself and anyone who is coughingor sneezing."),
  ];

}