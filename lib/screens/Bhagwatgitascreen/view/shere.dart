// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class share extends StatelessWidget {
//   const share({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('asset/img/3.jpg'),
//                     fit: BoxFit.cover,
//                     opacity: 0.7)),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: PageView.builder(
//                 itemCount: gitafalse.gitaList.length,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) => Center(
//                   child: ListTile(
//                     title: SelectableText(
//                       (dtrue.selectedLanguage == 'Sanskrit')
//                           ? gitafalse.gitaList[latrue.selectindex].verses[index]
//                           .language.sanskrit
//                           : (dtrue.selectedLanguage == 'Hindi')
//                           ? gitafalse.gitaList[latrue.selectindex]
//                           .verses[index].language.hindi
//                           : (dtrue.selectedLanguage == 'English')
//                           ? gitafalse.gitaList[latrue.selectindex]
//                           .verses[index].language.english
//                           : gitafalse.gitaList[latrue.selectindex]
//                           .verses[index].language.gujarati,
//                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//                     ),
//                     trailing: InkWell(onTap: () {
//                       Clipboard.setData(ClipboardData(text:(dtrue.selectedLanguage == 'Sanskrit')
//                           ? gitafalse.gitaList[latrue.selectindex].verses[index]
//                           .language.sanskrit
//                           : (dtrue.selectedLanguage == 'Hindi')
//                           ? gitafalse.gitaList[latrue.selectindex]
//                           .verses[index].language.hindi
//                           : (dtrue.selectedLanguage == 'English')
//                           ? gitafalse.gitaList[latrue.selectindex]
//                           .verses[index].language.english
//                           : gitafalse.gitaList[latrue.selectindex]
//                           .verses[index].language.gujarati,));
//                     },child: Icon(Icons.copy_all_outlined,color: Colors.black,)),
//                   ),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }
