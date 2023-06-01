import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/covid_model.dart';

class Covid_API
{
  static Covid_API covid_api = Covid_API();

  Future<List<CoronaModel>> getCovid_Api()
  async {
    String? covid1 = "https://corona.lmao.ninja/v2/countries/";
    var response = await http.get(Uri.parse(covid1));

    List jsondata = jsonDecode(response.body);
    List<CoronaModel> coviddata = [];

    coviddata = jsondata.map((e) => CoronaModel.fromJson(e)).toList();
    return coviddata;
  }

}