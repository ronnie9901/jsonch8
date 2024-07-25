import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splscrren extends StatelessWidget {
  const splscrren({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),() {
      Navigator.of(context).pushReplacementNamed('/home');
    },);
    return Scaffold(
        body: Container(height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('asset/img/1.jpeg'),fit: BoxFit.cover,  opacity: 0.7,)),)
    );
  }
}
