import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testflutter/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String _userName = "";
  String get username => _userName;

  Future<MainData> _allUserData = getAllUserData();
  Future<MainData> get allUserData => _allUserData;

  UserData _userDetail = UserData(
      id: 0,
      email: "email",
      firstName: "firstName",
      lastName: "lastName",
      avatar: "avatar");
  UserData get userDetail => _userDetail;

  set userNmaeSet(String name) {
    _userName = name;
    notifyListeners();
  }

  set userDetailSet(UserData data) {
    _userDetail = data;
    notifyListeners();
  }

  void getUsername(String name) {
    userNmaeSet = name;
  }

  void getUserDetail(UserData data) {
    userDetailSet = data;
  }

  static Future<MainData> getAllUserData() async {
    var link = Uri.parse("https://reqres.in/api/users?page=1&per_page=10");
    var res = await http.get(link);

    if (res.statusCode == 200) {
      return MainData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
