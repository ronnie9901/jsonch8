import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/homeProvider.dart';
import '../provider/geta_provider.dart';

class Gitahomepage extends StatelessWidget {
  const Gitahomepage({super.key});

  @override
  Widget build(BuildContext context) {
    GitaProvider gitafalse = Provider.of<GitaProvider>(context);
    LagProvider lafale = Provider.of<LagProvider>(context, listen: false);
    LagProvider latrue = Provider.of<LagProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow.shade700,
          title: Text(
            'Bhagwata Gita ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Switch(
              inactiveThumbColor: Theme.of(context).colorScheme.primary,
              activeColor: Theme.of(context).colorScheme.primary,
              value: latrue.isdark,
              onChanged: (value) {
                lafale.changetheme();
              },
            )
          ]),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('asset/img/2.jpg'),
          fit: BoxFit.cover,
          opacity: 7,
        )),
        child: ListView.builder(
          itemCount: Provider.of<GitaProvider>(context).gitaList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              lafale.select(index);
              Navigator.of(context).pushNamed('/slok');
            },
            child: Card(
              color: Colors.yellow.shade700,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Text(
                  gitafalse.gitaList[index].chapter.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                title: Text(
                  gitafalse.gitaList[index].chapterName.sanskrit,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
