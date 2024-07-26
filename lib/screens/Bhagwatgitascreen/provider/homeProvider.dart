
import 'package:flutter/cupertino.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/view/slokscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LagProvider extends ChangeNotifier{
  int languageIndex = 0;
  int selectindex=0;
  String img='asset/img/14.jpg';
  void translateLanguage(){
    if(languageIndex<3){
      languageIndex++;
      notifyListeners();
    }
    else{

      languageIndex = 0;
      notifyListeners();
    }
  }
  void select(int index)
  {
    selectindex=index;
    notifyListeners();
  }

  late SharedPreferences sharedPreferences;
  bool  isdark= false;
  void changetheme()
  {
    isdark=!isdark;
    settheme(isdark);
    notifyListeners();
  }



  Future<void> settheme(bool value)
  async {
    sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setBool('theme',value);
  }


  Future<void> gettheme()
  async {
    sharedPreferences =await SharedPreferences.getInstance();
    isdark= sharedPreferences.getBool('theme')??false;
    notifyListeners();
  }
  homeproviderr(bool theme)
  {
    isdark=theme;
    gettheme();
  }

}



