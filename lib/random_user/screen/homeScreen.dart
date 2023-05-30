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
                  child: Column(
                    children: [
                      Text("${user.results![0].name!.title}. ${user.results![0].name!.first} ${user.results![0].name!.last}",style: TextStyle(fontSize: 16.sp),),
                      Text("${user.results![0].gender}".toUpperCase()),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ClipOval(child: Image.network("${user.results![0].picture!.large}",height: 200,width: 200,fit: BoxFit.fill,),),
                      ),
                      Text("data")

                    ],
                  ),
                );
              }
            return Center(child: CircularProgressIndicator(color: Colors.teal,backgroundColor:Colors.white,),);
          },
        ),


      ),
    );
  }
}
