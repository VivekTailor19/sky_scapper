import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Colors.amber,
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal.shade50,

                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(title: Text("${covidF!.list[index].country}"),
                leading: Image.network("${covidF!.list[index].countryInfo!.flag}",height: 15,width: 15,fit: BoxFit.fill,),);
            },
              itemCount: covidT!.list.length,

            ),
          ),
        ],
      ),
    ));
  }
}
