import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scapper/covid-19/model/covid_model.dart';
import 'package:sky_scapper/covid-19/provider/covid_Provider.dart';

class Covid_HomeScreen extends StatefulWidget {
  const Covid_HomeScreen({Key? key}) : super(key: key);

  @override
  State<Covid_HomeScreen> createState() => _Covid_HomeScreenState();
}

class _Covid_HomeScreenState extends State<Covid_HomeScreen> {

  CovidProvider? covidT;
  CovidProvider? covidF;

  @override
  Widget build(BuildContext context) {


    covidT = Provider.of<CovidProvider>(context);
    covidF = Provider.of<CovidProvider>(context,listen: false);

    return SafeArea(child: Scaffold(
      body: FutureBuilder(
        future: covidF!.getCovidData(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Center(child: Text("${snapshot.error}"),);
            }
          else if(snapshot.hasData)
            {
              List<CoronaModel> covidData = snapshot.data!;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "search");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(height: 60,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.red,),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return ListTile(title: Text("${covidData[index].country}"),);
                    },
                      itemCount: covidData.length,

                    ),
                  ),
                ],
              );
            }

          return Center(child: CircularProgressIndicator(),);
        },


      ),),);
  }
}
