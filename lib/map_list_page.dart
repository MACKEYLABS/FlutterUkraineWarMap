import 'package:flutter/material.dart';
import 'my_home_page.dart';

class MapInfo {
  final String image;
  final String title;
  final String url;
  final String description;

  MapInfo({
    required this.image,
    required this.title,
    required this.url,
    required this.description,
  });
}

class MapListPage extends StatelessWidget {
  MapListPage({Key? key}) : super(key: key);

  final List<MapInfo> maps = [
    MapInfo(
      image: 'assets/warmap.jpeg',
      title: 'Ukraine Deep State Map',
      url: 'https://deepstatemap.live/en#6/49.438/32.053',
      description: 'A detailed map of the Ukraine deep state.',
    ),
    MapInfo(
        image: 'assets/day508.jpeg',
        title: 'Day 508 Ukraine War Events Map',
        url:
            'https://www.google.com/maps/d/u/0/viewer?entry=yt&mid=1pIBk5UfnyRcuh0muuOmEQi5p6g1Mf8U&ll=56.30982478604953%2C21.72168034999999&z=3',
        description:
            'Ukraine takes a major southern town as they continue to break down Russian units with heavy attacks in the area.'),
    MapInfo(
      image: 'assets/day507.jpeg',
      title: 'Day 507 Ukraine War Events Map',
      url:
          'https://www.google.com/maps/d/u/0/viewer?entry=yt&mid=1pIBk5UfnyRcuh0muuOmEQi5p6g1Mf8U&ll=56.30982478604953%2C21.72168034999999&z=3',
      description:
          'Ukraine is breaking Russian forces in head on attacks which lead to massive losses for Russia today.',
    ),
    MapInfo(
      image: 'assets/day506.jpeg',
      title: 'Day 506 Ukraine War Events Map',
      url:
          'https://www.google.com/maps/d/u/0/viewer?entry=yt&mid=1pIBk5UfnyRcuh0muuOmEQi5p6g1Mf8U&ll=56.30982478604953%2C21.72168034999999&z=3',
      description:
          'Ukraine is striking into Russia after a demand was made by Zaluzhny that the war be brought to Russia.',
    ),
    MapInfo(
      image: 'assets/day505.jpeg',
      title: 'Day 505 Ukraine War Events Map',
      url:
          'https://www.google.com/maps/d/u/0/viewer?entry=yt&mid=1pIBk5UfnyRcuh0muuOmEQi5p6g1Mf8U&ll=56.30982478604953%2C21.72168034999999&z=3',
      description:
          'Another Russian coup appears to be a possibility after a massive bout began with the removal of General Popov of the Russian Army.',
    ),
    MapInfo(
      image: 'assets/day504.jpeg',
      title: 'Day 504 Ukraine War Events Map',
      url:
          'https://www.google.com/maps/d/u/0/viewer?entry=yt&mid=1x4EXL_ze-ioAGQqyQe9UL1nkyCmRh0Q&ll=57.8056872989951%2C38.8237553&z=3',
      description:
          'Ukraine has taken the town of Klischkiivka today after a concerted push by the 3rd Brigade, the 93rd, and the 4th Brigade along with supporting units.',
    ),
    MapInfo(
      image: 'assets/day503.jpeg',
      title: 'Day 504 Ukraine War Events Map',
      url:
          'https://www.google.com/maps/d/u/0/viewer?entry=yt&mid=1x4EXL_ze-ioAGQqyQe9UL1nkyCmRh0Q&ll=57.8056872989951%2C38.8237553&z=3',
      description:
          'Wagner has announced a return to Ukraine in a shocking turn around of Russian policy about the wagner since the failed coup nearly 3 weeks ago.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text('Select a Map'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: maps.length,
        itemBuilder: (context, index) {
          var map = maps[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      title: map.title,
                      url: map.url,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Image.asset(
                        map.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10), // for spacing
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            map.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10), // for spacing
                          Text(
                            map.description,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
