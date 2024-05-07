import 'dart:convert';

import 'package:covid_track_app/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
      Map responseBody = {};


  getData() async {
    var url = Uri.parse("https://disease.sh/v3/covid-19/countries/Pakistan");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
         responseBody = jsonDecode(response.body);
      });
    } else {
      Center(
        child: CircularProgressIndicator(),
      );
    }

    // return responseBody;
  }

  List<String> imageUrls = [
    'https://static.dezeen.com/uploads/2020/05/coronavirus-covid-19-illustation-cdc-medical-illustrator-dan-higgins_dezeen_2364_sq3-300x300.jpg',
    'https://static.dezeen.com/uploads/2020/05/coronavirus-covid-19-illustation-cdc-medical-illustrator-dan-higgins_dezeen_2364_sq3-300x300.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var cases = responseBody['cases'].toString();

      return responseBody.isEmpty
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                  // color: Color.fromRGBO(207, 227, 252, 5),
                  ),
            ),
          )
        : Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 211, 209),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 211, 209),
        title: const Text(
          'CORONA',
          style: TextStyle(
            // color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index, _) {
              final imageUrl = imageUrls[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              height: 310,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Color.fromARGB(255, 167, 4, 4),
              ),
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(5),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    cases,
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Country :',
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
