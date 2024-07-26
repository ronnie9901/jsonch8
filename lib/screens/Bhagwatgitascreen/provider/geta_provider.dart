import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/model.dart';

class GitaProvider extends ChangeNotifier {
  List<GitaModal> gitaList = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('asset/json/geeta.json');
    List gita = jsonDecode(json);
    gitaList = gita
        .map(
          (e) => GitaModal.fromJson(e),
        )
        .toList();
    notifyListeners();
  }

  GitaProvider() {
    jsonParsing();
  }
}

