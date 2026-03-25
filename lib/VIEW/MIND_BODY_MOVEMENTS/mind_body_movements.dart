import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../Constant/appColors.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';

class MindBodyMovements extends StatefulWidget {
  const MindBodyMovements({super.key});

  @override
  State<MindBodyMovements> createState() => _MindBodyMovementsState();
}

class _MindBodyMovementsState extends State<MindBodyMovements> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    )
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void forwardVideo() async {
    final position = await _controller.position;
    _controller.seekTo(position! + Duration(seconds: 10));
  }
  void backwardVideo() async {
    final position = await _controller.position;
    _controller.seekTo(position! - Duration(seconds: 10));
  }

  /// play pause
  void playPause() {
    setState(() {
      _controller.value.isPlaying
          ? _controller.pause()
          : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
width: double.infinity,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Center(child: headerContainer(text: 'Meditation Player', colors: AppColors.white)),
            
                Center(child: VideoTextField(text: 'Morning Flow')),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: SizedBox(
                    height: 322,
                    width: 353,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // THIS MAKES THE ROUNDED CORNERS
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                          : Container(
                        color: Colors.black,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(child: membercontainer(text: 'Cross Your Arms and Place')),
            ),
                Center(child: membercontainer(text: 'Your Hands on Your Upper Arms.')),
               Center(child: headcontainer('00:30', AppColors.yellowColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 40),
                  child: PrimaryContainer(text: 'Options', colors:AppColors.white ),
                ),
                SizedBox(
                  height: 38,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                          width: 120,
                          child: Videobottombutton(text: 'Morning Flow', onPressed: (){})),
                      SizedBox(
                          width: 141,
                          child: Videobottombutton(text: 'Mid-Day Stretch', onPressed: (){})),
                      SizedBox(
                          height: 38,
                          child: Videobottombutton(text: ' Evening Relax', onPressed: (){})),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}