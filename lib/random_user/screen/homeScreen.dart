import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scapper/random_user/model/userModel.dart';
import 'package:sky_scapper/random_user/provider/userProvider.dart';

import '../apicall/user_API.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserProvider? userT;
  UserProvider? userF;
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
                  return userF!.doRefresh(await User_API.user_api.get_userAPI());
                },
                    child: Text("Generate User",style: TextStyle(fontSize: 18,color: Colors.white),)),
              ),
       ),

        body: FutureBuilder(
          future: userF!.userDataLoad(),
          builder: (context, snapshot) {

            if(snapshot.hasError)
              {
                return Center(child: Text("${snapshot.error}"),);
              }
            else if(snapshot.hasData)
              {
                userF!.doRefresh(snapshot.data!);
                UserModel user = snapshot.data!;

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipOval(child: Image.network("${user.results![0].picture!.large}",height: 100,width: 100,fit: BoxFit.fill,),),
                            SizedBox(width: 10,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${user.results![0].name!.title}. ${user.results![0].name!.first} ${user.results![0].name!.last}",style: TextStyle(fontSize: 16.sp),),
                                Text("${user.results![0].gender}".toUpperCase()),
                              ],
                            ),
                          ],
                        ),



                        Tile("Id","${user.results![0].id!.name}-${user.results![0].id!.value}"),
                        Tile("Mobile No.", "${user.results![0].phone}"),
                        Tile("Home Contact No.", "${user.results![0].cell}"),
                        Tile("Date of Birth", "${user.results![0].dob!.date}"),
                        Tile("AGE", "${user.results![0].dob!.age}"),
                        Tile("Address", "${user.results![0].location!.street!.number}, ${user.results![0].location!.street!.name} - ${user.results![0].location!.postcode}"),
                        Tile("Origin", "${user.results![0].location!.city}, ${user.results![0].location!.state}, ${user.results![0].location!.country}"),



                      ],
                    ),
                  ),
                );
              }
            return Center(child: CircularProgressIndicator(color: Colors.teal,backgroundColor:Colors.white,),);
          },
        ),


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
          Text("$data",style: TextStyle(fontWeight: FontWeight.w300,),),
        ],
      ),
    );
  }
}
