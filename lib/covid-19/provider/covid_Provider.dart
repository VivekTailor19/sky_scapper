import 'package:flutter/foundation.dart';
import 'package:sky_scapper/covid-19/api/covid_API.dart';
import 'package:sky_scapper/covid-19/model/covid_model.dart';

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

}