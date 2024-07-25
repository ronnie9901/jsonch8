import 'package:flutter/material.dart';
import 'package:jsonch8/screens/provider/todoprovider.dart';
import 'package:jsonch8/screens/provider/userprovider.dart';
import 'package:provider/provider.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userfalse = Provider.of<UserProvider>(context);
    return Scaffold(

   body: ListView.builder(itemCount: userfalse.userist.length, itemBuilder: (context, index) => Card(
     child: ListTile(

       leading: Text(userfalse.userist[index].id.toString()),
       title: Text(userfalse.userist[index].name),
       subtitle: Text(userfalse.userist[index].company.name),
       trailing: Text(userfalse.userist[index].email),
     ),
     
   ),
   ),
    );
  }
}
