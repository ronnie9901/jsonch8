import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/todomodel.dart';

class TodoProvider extends ChangeNotifier{
  List<Todomodel> totolist=[];

  Future<List> jsonParsing()
  async {
    String json = await rootBundle.loadString('asset/json/todo.json');
    List todo=jsonDecode(json);
    return todo;
  }

  Future<void> fomList()
  async {
    List todo = await jsonParsing();
    totolist = todo.map((e) => Todomodel.fromMap(e)).toList();
    notifyListeners();
  }
  TodoProvider()
  {
    fomList();
  }
}