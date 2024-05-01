import 'dart:convert';

import 'package:covid_track_app/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SamplePosts> samplePosts = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: samplePosts.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    color: const Color.fromARGB(255, 63, 7, 7),
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'user Id :${samplePosts[index].userId}',
                          style: TextStyle(fontSize: 18,color: Colors.white),
                          
                        ),
                        Text(
                          'Id :${samplePosts[index].id}',
                          style: TextStyle(fontSize: 18,color: Colors.white),
                        ),
                        Text(
                          'Title :${samplePosts[index].title}',
                          style: TextStyle(fontSize: 18,color: Colors.white),
                          maxLines: 1,
                        ),
                        Text(
                          'Body :${samplePosts[index].body} ',
                          style: TextStyle(fontSize: 18,color: Colors.white),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<SamplePosts>> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts',
      ),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(SamplePosts.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
