

import 'package:flutter/material.dart';
import 'package:sky_scapper/random_user/apicall/user_API.dart';
import 'package:sky_scapper/random_user/model/userModel.dart';

class UserProvider extends ChangeNotifier
{
  UserModel? usermodel;

  void userDataLoad()
  async {
   usermodel = await User_API.user_api.get_userAPI();
   notifyListeners();
  }


}
