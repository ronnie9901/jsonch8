

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/provider/detailProvider.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/provider/homeProvider.dart';
import 'package:jsonch8/screens/Bhagwatgitascreen/provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';


import 'homepage.dart';

GlobalKey imgkey = GlobalKey();

class slokscr extends StatelessWidget {
  const slokscr({super.key});

  @override
  Widget build(BuildContext context) {
    LagProvider latrue = Provider.of<LagProvider>(context, listen: true);
    DetailScreenProvider dtrue =
        Provider.of<DetailScreenProvider>(context, listen: true);
    DetailScreenProvider dfalse =
        Provider.of<DetailScreenProvider>(context, listen: false);
    GitaProvider gitafalse = Provider.of<GitaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        scrolledUnderElevation: 0.1,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        title: Text(
          (dtrue.selectedLanguage == 'Sanskrit')
              ? translate[0]
              : (dtrue.selectedLanguage == 'Hindi')
                  ? translate[1]
                  : (dtrue.selectedLanguage == 'English')
                      ? translate[2]
                      : translate[3],
        ),
        actions: [
          DropdownButton(
            borderRadius: BorderRadius.circular(10),
            focusColor: Colors.blueAccent,
            value: dtrue.selectedLanguage,
            onChanged: (String? value) {
              dfalse.languageTranslate(value!);
            },
            items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Stack(
        children: [
          RepaintBoundary(
              key: imgkey,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/img/3.jpg'),
                        fit: BoxFit.cover,
                        opacity: 0.7)),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Center(
                      child: ListTile(
                        title: Text(
                          (dtrue.selectedLanguage == 'Sanskrit')
                              ? gitafalse.gitaList[selectindex].verses[index]
                                  .language.sanskrit
                              : (dtrue.selectedLanguage == 'Hindi')
                                  ? gitafalse.gitaList[selectindex]
                                      .verses[index].language.hindi
                                  : (dtrue.selectedLanguage == 'English')
                                      ? gitafalse.gitaList[selectindex]
                                          .verses[index].language.english
                                      : gitafalse.gitaList[selectindex]
                                          .verses[index].language.gujarati,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        trailing: InkWell(onTap: () {
                          Clipboard.setData(ClipboardData(text:(dtrue.selectedLanguage == 'Sanskrit')
                              ? gitafalse.gitaList[selectindex].verses[index]
                              .language.sanskrit
                              : (dtrue.selectedLanguage == 'Hindi')
                              ? gitafalse.gitaList[selectindex]
                              .verses[index].language.hindi
                              : (dtrue.selectedLanguage == 'English')
                              ? gitafalse.gitaList[selectindex]
                              .verses[index].language.english
                              : gitafalse.gitaList[selectindex]
                              .verses[index].language.gujarati,));
                        },child: Icon(Icons.copy_all_outlined,color: Colors.black,)),
                      ),
                    )),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () async {
                RenderRepaintBoundary bondary = imgkey
                    .currentContext!
                    .findRenderObject()
                as RenderRepaintBoundary;

                ui.Image image = await bondary.toImage();
                ByteData? byteData =
                await image.toByteData(
                    format: ui.ImageByteFormat.png);

                Uint8List img =
                byteData!.buffer.asUint8List();

                final dir =
                await getApplicationDocumentsDirectory();

                final file = File('${dir.path}/img.png');
                file.createSync(recursive: true);
                file.writeAsBytes(img);

                await ShareExtend.share(
                    file.path, "image");
              },
              child: Container(height: 30,width: 50,alignment: Alignment.center,decoration: BoxDecoration(color: Colors.yellow.shade700,borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'share',
                  style: TextStyle(color: Colors.black),
                ),
              )),
          TextButton(
              onPressed: () async {
                RenderRepaintBoundary boundary = imgkey
                    .currentContext!
                    .findRenderObject()
                as RenderRepaintBoundary;

                ui.Image image = await boundary.toImage();

                ByteData? byteData = await image.toByteData(
                    format: ui.ImageByteFormat.png);

                Uint8List img =
                byteData!.buffer.asUint8List();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                    content: Text('Saved to the gallery!'),
                  ),
                );

                ImageGallerySaver.saveImage(img);
              },
              child: Container(height: 30,width: 50,alignment: Alignment.center,decoration: BoxDecoration(color: Colors.yellow.shade700,borderRadius: BorderRadius.circular(5),),
                child: Text(
                  'save',
                  style: TextStyle(color: Colors.black),
                ),
              ))
        ],
      ),
    );
  }
}

List translate = [
  'अध्यायः',
  'अध्याय',
  'Chapter',
  'પ્રકરણ',
];
