import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context,index) {
        return Container(
          height: 130,
          color: Colors.grey,
          padding: const EdgeInsets.all(3),
          margin: const  EdgeInsets.all(5),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('user Id :data',
              style: TextStyle(fontSize: 18),
              ),
                          Text('Id :data',
              style: TextStyle(fontSize: 18),
              ),
                          Text('Title :data',
              style: TextStyle(fontSize: 18),
              ),
                          Text('Body :data',
              style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      }
    );
  }
}