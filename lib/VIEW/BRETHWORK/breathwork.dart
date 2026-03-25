import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:new_project_1/Constant/appImages.dart';
import '../../Constant/appColors.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';
class Breathwork extends StatefulWidget {
  const Breathwork({super.key});
  @override
  State<Breathwork> createState() => _BreathworkState();
}
class _BreathworkState extends State<Breathwork> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    _audioPlayer.setSource(UrlSource(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        position = Duration.zero;
        isPlaying = false;
      });
    });
  }
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  void _playPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }
  void _seekAudio(Duration newPosition) {
    _audioPlayer.seek(newPosition);
  }
  void forwardAudio() {
    final newPos = position + Duration(seconds: 10);
    if (newPos < duration) {
      _seekAudio(newPos);
    } else {
      _seekAudio(duration);
    }
  }
  void backwardAudio() {
    final newPos = position - Duration(seconds: 10);
    if (newPos > Duration.zero) {
      _seekAudio(newPos);
    } else {
      _seekAudio(Duration.zero);
    }
  }
  String _formatTime(Duration d) {
    final minutes = d.inMinutes.toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.yellowColor.withOpacity(0.55),
              AppColors.screenColor
            ],
            stops: const [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                headerContainer(
                    text: 'Breathwork Exercises', colors: AppColors.white),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 25),
                  child: VideoTextField(text: 'Breathwork Exercises'),
                ),
                const SizedBox(height: 8),
                membercontainer(text: 'Equal Breathing'),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 232,
                    height: 232,
                    child: Image.asset(AppImages.audiopic),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous, color: AppColors.white),
                      iconSize: 36,
                      onPressed: backwardAudio,
                    ),
                    IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        color: AppColors.yellowColor,
                      ),
                      iconSize: 60,
                      onPressed: _playPause,
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next, color: AppColors.white),
                      iconSize: 36,
                      onPressed: forwardAudio,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 70, bottom: 8),
                  child:
                  Align(
                      alignment: Alignment.topLeft,
                      child: PrimaryContainer(text: 'Options', colors: AppColors.white)),
                ),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      SizedBox(
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Videobottombutton(
                                text: 'Morning Flow', onPressed: () {}),
                          )),
                      SizedBox(
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Videobottombutton(
                                text: 'Mid-Day Stretch', onPressed: () {}),
                          )),
                      SizedBox(
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Videobottombutton(
                                text: 'Evening Relax', onPressed: () {}),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}