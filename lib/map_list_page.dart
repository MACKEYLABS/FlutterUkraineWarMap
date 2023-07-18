import 'package:flutter/material.dart';
import 'my_home_page.dart';

class MapListPage extends StatelessWidget {
  const MapListPage({Key? key}) : super(key: key);

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
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Ukraine Deep State Map'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                        title: 'Ukraine Deep State Map',
                        url: "https://deepstatemap.live/en#6/49.438/32.053")),
              );
            },
          ),
          ListTile(
            title: const Text('Ukraine War Events Map Day 507'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                        title: 'Ukraine War Events Map Day 507',
                        url:
                            "https://www.google.com/maps/d/viewer?entry=yt&mid=1pIBk5UfnyRcuh0muuOmEQi5p6g1Mf8U&ll=54.32613015991604%2C37.340042520984554&z=6")),
              );
            },
          ),
          // Add more ListTiles for other maps here
        ],
      ),
    );
  }
}
