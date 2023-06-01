// To parse this JSON data, do
//
//     final coronaModel = coronaModelFromJson(jsonString);

import 'dart:convert';

List<CoronaModel> coronaModelFromJson(String str) => List<CoronaModel>.from(json.decode(str).map((x) => CoronaModel.fromJson(x)));

String coronaModelToJson(List<CoronaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoronaModel {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  Continent? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;

  CoronaModel({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  factory CoronaModel.fromJson(Map<String, dynamic> json) => CoronaModel(
    updated: json["updated"],
    country: json["country"],
    countryInfo: json["countryInfo"] == null ? null : CountryInfo.fromJson(json["countryInfo"]),
    cases: json["cases"],
    todayCases: json["todayCases"],
    deaths: json["deaths"],
    todayDeaths: json["todayDeaths"],
    recovered: json["recovered"],
    todayRecovered: json["todayRecovered"],
    active: json["active"],
    critical: json["critical"],
    casesPerOneMillion: json["casesPerOneMillion"],
    deathsPerOneMillion: json["deathsPerOneMillion"],
    tests: json["tests"],
    testsPerOneMillion: json["testsPerOneMillion"],
    population: json["population"],
    continent: continentValues.map[json["continent"]]!,
    oneCasePerPeople: json["oneCasePerPeople"],
    oneDeathPerPeople: json["oneDeathPerPeople"],
    oneTestPerPeople: json["oneTestPerPeople"],
    activePerOneMillion: json["activePerOneMillion"]?.toDouble(),
    recoveredPerOneMillion: json["recoveredPerOneMillion"]?.toDouble(),
    criticalPerOneMillion: json["criticalPerOneMillion"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "updated": updated,
    "country": country,
    "countryInfo": countryInfo?.toJson(),
    "cases": cases,
    "todayCases": todayCases,
    "deaths": deaths,
    "todayDeaths": todayDeaths,
    "recovered": recovered,
    "todayRecovered": todayRecovered,
    "active": active,
    "critical": critical,
    "casesPerOneMillion": casesPerOneMillion,
    "deathsPerOneMillion": deathsPerOneMillion,
    "tests": tests,
    "testsPerOneMillion": testsPerOneMillion,
    "population": population,
    "continent": continentValues.reverse[continent],
    "oneCasePerPeople": oneCasePerPeople,
    "oneDeathPerPeople": oneDeathPerPeople,
    "oneTestPerPeople": oneTestPerPeople,
    "activePerOneMillion": activePerOneMillion,
    "recoveredPerOneMillion": recoveredPerOneMillion,
    "criticalPerOneMillion": criticalPerOneMillion,
  };
}

enum Continent { ASIA, EUROPE, AFRICA, NORTH_AMERICA, SOUTH_AMERICA, AUSTRALIA_OCEANIA, EMPTY }

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Asia": Continent.ASIA,
  "Australia-Oceania": Continent.AUSTRALIA_OCEANIA,
  "": Continent.EMPTY,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "South America": Continent.SOUTH_AMERICA
});

class CountryInfo {
  int? id;
  String? iso2;
  String? iso3;
  double? lat;
  double? long;
  String? flag;

  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
    id: json["_id"],
    iso2: json["iso2"],
    iso3: json["iso3"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "iso2": iso2,
    "iso3": iso3,
    "lat": lat,
    "long": long,
    "flag": flag,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
