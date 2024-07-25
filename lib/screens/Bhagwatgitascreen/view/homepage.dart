import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class gitahomepage extends StatelessWidget {
  const gitahomepage({super.key});

  @override
  Widget build(BuildContext context) {
    GitaProvider gitafalse = Provider.of<GitaProvider>(context);
    return Scaffold(
    appBar: AppBar(centerTitle:true,backgroundColor: Colors.yellow.shade700,title: Text('Bhagwatagita ',style: TextStyle(fontWeight: FontWeight.bold),),),
      body: Container(height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('asset/img/2.jpg'),fit: BoxFit.cover,  opacity: 0.7,)),
        child: ListView.builder(
           itemCount: gitafalse.gitaList.length,
          itemBuilder: (context, index) => InkWell(onTap: () {
            selectindex=index;
            Navigator.of(context).pushNamed('/slok');
          },
            child: Card(color: Colors.yellow.shade700,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Text(gitafalse.gitaList[index].chapter.toString(),style: TextStyle(fontSize: 20,color: Colors.black),),
                title: Text(gitafalse.gitaList[index].chapterName.sanskrit,style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
int selectindex=0;
