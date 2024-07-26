import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/provider/detailProvider.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/provider/homeProvider.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/provider/geta_provider.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/view/homepage.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/view/slokscreen.dart';
import 'package:jsonch8/screens/provider/postprovider.dart';
import 'package:jsonch8/screens/provider/todoprovider.dart';
import 'package:jsonch8/screens/provider/userprovider.dart';
import 'package:jsonch8/screens/view/homepage.dart';
import 'package:jsonch8/screens/view/posthomepage.dart';
import 'package:jsonch8/screens/view/splacescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider(),),
        ChangeNotifierProvider(create: (context) => UserProvider(),),
        ChangeNotifierProvider(create: (context) => PostProvider(),),
        ChangeNotifierProvider(create: (context) => GitaProvider(),),
        ChangeNotifierProvider(create: (context) => DetailScreenProvider(),),
        ChangeNotifierProvider(create: (context) => LagProvider(),)
      ],
      builder :  (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Colors.amber,
          onPrimary: Colors.pink,
          secondary: Colors.blue,
          onSecondary: Colors.green,
        )
      ),
      darkTheme:  ThemeData(
        brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
            primary: Colors.purple,
            onPrimary: Colors.blue,
            secondary: Colors.green,
            onSecondary: Colors.redAccent,
            surface: Colors.black12

          )
      ),
      themeMode: Provider.of <LagProvider>(context).isdark?ThemeMode.dark:ThemeMode.light,
        routes: {
          '/' : (context) => splscrren(),
           '/home' : (context) => Gitahomepage(),
           '/slok' : (context) => Slokscr(),
          // '/' : (context) => posthome(),
          // '/' : (context) => homepage(),

        },


    );
  }
}

