import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'map_list_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _disclaimerChecked = false;

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId("https://youtu.be/IcOdJf0TDb8")!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Welcome to the Ukraine War map",
                style: TextStyle(fontSize: 24)),
            Container(
              margin: const EdgeInsets.all(20),
              height: 200,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
            CheckboxListTile(
              value: _disclaimerChecked,
              onChanged: (newValue) {
                setState(() {
                  _disclaimerChecked = newValue!;
                });
              },
              title: const Text(
                  "I understand that I may view combat footage and I am over the age of 18 years old."),
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            ElevatedButton(
              onPressed: _disclaimerChecked
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapListPage()),
                      );
                    }
                  : null,
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
