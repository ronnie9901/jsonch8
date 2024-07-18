import 'package:flutter/material.dart';
import 'package:jsonch8/screens/provider/todoprovider.dart';
import 'package:provider/provider.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    todoprovider todofalse = Provider.of<todoprovider>(context,listen:  false);
    return Scaffold(
   body: ListView.builder(itemBuilder: (context, index) => ListTile(
     leading: CircleAvatar(
         backgroundImage:
         NetworkImage('${todofalse.totolist[index].url}')),
     title: Text(todofalse.totolist[index].title),
   ),),
    );
  }
}
