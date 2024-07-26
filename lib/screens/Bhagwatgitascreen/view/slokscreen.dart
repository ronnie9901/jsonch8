

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
import 'package:jsonch8/screens/Bhagwatgitascreen/provider/geta_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';




GlobalKey imgkey = GlobalKey();

class Slokscr extends StatelessWidget {
  const Slokscr({super.key});

  @override

  Widget build(BuildContext context) {
    LagProvider latrue = Provider.of<LagProvider>(context, listen: true);
    LagProvider lafalse = Provider.of<LagProvider>(context, listen: false);


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
                        image: AssetImage(imglist[latrue.selectindex]),

                        fit: BoxFit.cover,
                        opacity: 7)),
                 child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView.builder(
                        itemCount: gitafalse.gitaList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Center(
                          child: Card(
                            color: Colors.black12,
                            child: ListTile(
                              title: SelectableText(
                                (dtrue.selectedLanguage == 'Sanskrit')
                                    ? gitafalse.gitaList[latrue.selectindex].verses[index]
                                    .language.sanskrit
                                    : (dtrue.selectedLanguage == 'Hindi')
                                    ? gitafalse.gitaList[latrue.selectindex]
                                    .verses[index].language.hindi
                                    : (dtrue.selectedLanguage == 'English')
                                    ? gitafalse.gitaList[latrue.selectindex]
                                    .verses[index].language.english
                                    : gitafalse.gitaList[latrue.selectindex]
                                    .verses[index].language.gujarati,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow.shade100),
                              ),
                              trailing: InkWell(onTap: () {
                                Clipboard.setData(ClipboardData(text:(dtrue.selectedLanguage == 'Sanskrit')
                                    ? gitafalse.gitaList[latrue.selectindex].verses[index]
                                    .language.sanskrit
                                    : (dtrue.selectedLanguage == 'Hindi')
                                    ? gitafalse.gitaList[latrue.selectindex]
                                    .verses[index].language.hindi
                                    : (dtrue.selectedLanguage == 'English')
                                    ? gitafalse.gitaList[latrue.selectindex]
                                    .verses[index].language.english
                                    : gitafalse.gitaList[latrue.selectindex]
                                    .verses[index].language.gujarati,));
                              },child: Icon(Icons.copy_all_outlined,color: Colors.yellow.shade100,)),
                            ),
                          ),
                        )),
                  ),


              ),
          ),
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              child: Container(height: 30,width: 50,alignment: Alignment.center,decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(5)),
                child:Icon(Icons.share_rounded,size: 20,color: Colors.yellow.shade100,)
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
              child: Icon(Icons.save,size: 20,color: Colors.yellow.shade100,))
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
List imglist=[
  'asset/img/2.jpg',
  'asset/img/3.jpg',
  'asset/img/4.jpg',
  'asset/img/5.jpg',
  'asset/img/6.jpg',
  'asset/img/7.jpg',
  'asset/img/8.jpg',
  'asset/img/9.jpg',
  'asset/img/10.jpg',
  'asset/img/11.jpg',
  'asset/img/12.jpg',
  'asset/img/13.jpg',
  'asset/img/14.jpg',
  'asset/img/15.jpg',
  'asset/img/16.jpg',
  'asset/img/1.jpg',
 ' asset/img/s.jpeg',
  'asset/img/1.jpg',




];
