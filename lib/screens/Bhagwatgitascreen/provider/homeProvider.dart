
import 'package:flutter/cupertino.dart';

class LagProvider extends ChangeNotifier{
  int languageIndex = 0;

  void translateLanguage(){
    if(languageIndex<3){
      languageIndex++;
      notifyListeners();
    }
    else{
      notifyListeners();
      languageIndex = 0;
    }
  }
}


