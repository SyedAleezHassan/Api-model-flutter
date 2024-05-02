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
  List<SamplePosts> samplePosts = [];
  List<String> imageUrls = [
    'https://static.dezeen.com/uploads/2020/05/coronavirus-covid-19-illustation-cdc-medical-illustrator-dan-higgins_dezeen_2364_sq3-300x300.jpg',
    'https://static.dezeen.com/uploads/2020/05/coronavirus-covid-19-illustation-cdc-medical-illustrator-dan-higgins_dezeen_2364_sq3-300x300.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 211, 209),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 211, 209),
        title: Text(
          'CORONA',
          style: const TextStyle(
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
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: samplePosts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 330,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        color: Color.fromARGB(255, 167, 4, 4),
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Updates :${samplePosts[index].updated}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Country :${samplePosts[index].country}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'countryInfo :${samplePosts[index].countryInfo}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'cases :${samplePosts[index].cases} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'todayCases :${samplePosts[index].todayCases} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'deaths :${samplePosts[index].deaths} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'todayDeaths :${samplePosts[index].todayDeaths} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'recovered :${samplePosts[index].recovered} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'todayRecovered :${samplePosts[index].todayRecovered} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'active :${samplePosts[index].active} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'critical :${samplePosts[index].critical} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'casesPerOneMillion :${samplePosts[index].casesPerOneMillion} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'deathsPerOneMillion :${samplePosts[index].deathsPerOneMillion} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'tests :${samplePosts[index].tests} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'testsPerOneMillion :${samplePosts[index].testsPerOneMillion} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'cases :${samplePosts[index].cases} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'population :${samplePosts[index].population} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'continent :${samplePosts[index].continent} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'oneCasePerPeople :${samplePosts[index].oneCasePerPeople} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'oneDeathPerPeople :${samplePosts[index].oneDeathPerPeople} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'oneTestPerPeople :${samplePosts[index].oneTestPerPeople} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'activePerOneMillion :${samplePosts[index].activePerOneMillion} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'recoveredPerOneMillion :${samplePosts[index].recoveredPerOneMillion} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'criticalPerOneMillion :${samplePosts[index].criticalPerOneMillion} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("no data found"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<SamplePosts>> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://disease.sh/v3/covid-19/countries',
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
