
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jsonch8/screens/model/usermodel.dart';

class UserProvider extends ChangeNotifier{

  List<UserModel> userist=[];

  Future<void> jsonParsing()
  async {
    String json = await rootBundle.loadString('asset/json/user.json');
    List todo=jsonDecode(json);
    userist = todo.map((e) => UserModel.fromMap(e)).toList();
    notifyListeners();
  }

  UserProvider()
  {
    jsonParsing();
  }
}