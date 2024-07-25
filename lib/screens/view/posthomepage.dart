import 'package:flutter/material.dart';
import 'package:jsonch8/screens/provider/postprovider.dart';
import 'package:jsonch8/screens/provider/todoprovider.dart';
import 'package:jsonch8/screens/provider/userprovider.dart';
import 'package:provider/provider.dart';
import '../model/postmodel.dart';


class posthome extends StatelessWidget {
  const posthome({super.key});

  @override
  Widget build(BuildContext context) {
    PostProvider postProvider = Provider.of<PostProvider>(context);
    return Scaffold(

      body: ListView.builder(itemCount: postProvider.postModal.posts.length,
      itemBuilder: (context, index) =>ListTile(
        title: Text('${postProvider.postModal.posts[index].title}'),
        subtitle: Text('${postProvider.postModal.posts[index].views}'),
        leading: Text('${postProvider.postModal.posts[index].id}'),
        trailing: Text('${postProvider.postModal.posts[index].reaction.likes}   ${postProvider.postModal.posts[index].reaction.dislikes}'),
      ),),
    );
  }
}
