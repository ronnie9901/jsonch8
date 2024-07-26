import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splscrren extends StatefulWidget {
  const splscrren({super.key});

  @override
  State<splscrren> createState() => _splscrrenState();
}

class _splscrrenState extends State<splscrren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 3),() {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //
    //   });
    // },);

    return Scaffold(
        body: Stack(children: [
      Container(

        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('asset/img/9.jpg'),
          fit: BoxFit.cover,
          opacity: 7,
        )),
      ),
          Center(child: Container( margin: EdgeInsets.only(top: 100),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(10,)),height: 69,width:double.infinity,child: Text(' || श्रीमद्भगवद्गीता ||',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow.shade700),)))
    ]
        )
    );
  }
}
