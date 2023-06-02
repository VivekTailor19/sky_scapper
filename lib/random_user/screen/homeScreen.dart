import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:sky_scapper/random_user/provider/userProvider.dart';



class RandomUser extends StatefulWidget {
  const RandomUser({Key? key}) : super(key: key);

  @override
  State<RandomUser> createState() => _RandomUserState();
}

class _RandomUserState extends State<RandomUser> {

  UserProvider? userT;
  UserProvider? userF;
  
  @override
  void initState() {
    Provider.of<UserProvider>(context,listen: false).userDataLoad();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    userT = Provider.of<UserProvider>(context);
    userF = Provider.of<UserProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0,

         backgroundColor: Colors.white,

            flexibleSpace: Container(
              height: 50,color: Colors.white,
                child: ElevatedButton(onPressed: () async {
                  userF!.userDataLoad();
                },
                    child: Text("Generate User",style: TextStyle(fontSize: 18,color: Colors.white),)),
              ),
       ),

        body: userT!.usermodel == null ? 
              Center(child: CircularProgressIndicator(color: Colors.teal,backgroundColor:Colors.white,),) :

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipOval(child: Image.network("${userT!.usermodel!.results![0].picture!.large}",height: 100,width: 100,fit: BoxFit.fill,),),
                          SizedBox(width: 10,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${userT!.usermodel!.results![0].name!.title}. ${userT!.usermodel!.results![0].name!.first} ${userT!.usermodel!.results![0].name!.last}",style: TextStyle(fontSize: 16.sp),textAlign: TextAlign.right,maxLines:2,overflow: TextOverflow.ellipsis),
                              Text("${userT!.usermodel!.results![0].gender}".toUpperCase()),
                            ],
                          ),
                        ],
                      ),



                      userT!.usermodel!.results![0].id!.value == null ? Text(" "):Tile("Id","${userT!.usermodel!.results![0].id!.name}-${userT!.usermodel!.results![0].id!.value}"),
                      Tile("Mobile No.", "${userT!.usermodel!.results![0].phone}"),
                      Tile("Home Contact No.", "${userT!.usermodel!.results![0].cell}"),
                      Tile("Date of Birth", "${userT!.usermodel!.results![0].dob!.date}"),
                      Tile("AGE", "${userT!.usermodel!.results![0].dob!.age}"),
                      Tile("Address", "${userT!.usermodel!.results![0].location!.street!.number}, ${userT!.usermodel!.results![0].location!.street!.name} - ${userT!.usermodel!.results![0].location!.postcode}"),
                      Tile("Origin", "${userT!.usermodel!.results![0].location!.city}, ${userT!.usermodel!.results![0].location!.state}, ${userT!.usermodel!.results![0].location!.country}"),



                    ],
                  ),
                ),
              )


      ),
    );
  }
  Widget Tile(String? title, String? data)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title :",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
          Text("$data",style: TextStyle(fontWeight: FontWeight.w300,),textAlign: TextAlign.right,maxLines:2,overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}




