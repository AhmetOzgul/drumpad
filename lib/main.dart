import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumPad());
}

class DrumPad extends StatelessWidget {
  const DrumPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrumPage(),
    );
  }
}

//Main Page
class DrumPage extends StatelessWidget {
  const DrumPage({Key? key}) : super(key: key);

  void playSound(String sound) {
    final player = AudioPlayer(playerId: '$sound');
    player.stop();
    player.play(
      AssetSource('sounds/$sound.wav'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    buildDrum(Colors.red[300], 'kick'),
                    buildDrum(Colors.blue[300], 'hihat'),
                    buildDrum(Colors.green[300], 'shaker'),
                    buildDrum(Colors.yellow[200], 'thebigwoo'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    buildDrum(Colors.pink[300], 'snare'),
                    buildDrum(Colors.purple[300], 'crash'),
                    buildDrum(Colors.deepOrange[300], 'bell'),
                    buildDrum(Colors.red[500], 'tag'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Button and image builder method
  Expanded buildDrum(var color, String sound) {
    return Expanded(
      child: Container(
        width: 180,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        color: color,
        child: Expanded(
          child: TextButton(
            onPressed: () {
              playSound('$sound');
            },
            child: Image(
              image: AssetImage('assets/icons/$sound.png'),
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
