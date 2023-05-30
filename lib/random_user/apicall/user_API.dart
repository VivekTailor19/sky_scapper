import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scapper/random_user/model/userModel.dart';

class User_API
{
  static User_API user_api = User_API();

  Future<UserModel> get_userAPI()
  async {
    String? userlink = "https://randomuser.me/api/";
    var response = await http.get(Uri.parse(userlink));

    var jsondata = jsonDecode(response.body);

    UserModel userModel = UserModel.fromJson(jsondata);
    return userModel;

  }
}