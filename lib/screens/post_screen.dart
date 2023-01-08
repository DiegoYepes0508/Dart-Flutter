import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

Future<List<PostRespuesta>> getPost() async {
  final res =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  return postRespuestaFromJson(res.body);
}

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post'),
        ),
        body: FutureBuilder(
            future: getPost(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _ListView(snapshot.data);
              }
            }));
  }
}

class _ListView extends StatelessWidget {
  final List<PostRespuesta> post;

  const _ListView(this.post);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: post.length,
        itemBuilder: (BuildContext context, int i) {
          final posts = post[i];
          return FadeIn(
            delay: Duration(milliseconds: 100 * i),
            child: ListTile(
              title: Text(posts.title),
              subtitle: Text(posts.body),
            ),
          );
        });
  }
}
