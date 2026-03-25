import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../Constant/appColors.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';

class GuidedVisulization extends StatefulWidget {
  const GuidedVisulization({super.key});
  @override
  State<GuidedVisulization> createState() => _GuidedVisulizationState();
}

class _GuidedVisulizationState extends State<GuidedVisulization> {
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
        child: SafeArea(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              headerContainer(text: 'Guided Visualization', colors:AppColors.white),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: VideoTextField(text: 'Mirror of Support'),
              ),
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
              ValueListenableBuilder(
                valueListenable: _controller,
                builder: (context, VideoPlayerValue value, child) {
                  final position = value.position.inSeconds.toDouble();
                  final duration = value.duration.inSeconds.toDouble();
                  return Slider(
                    min: 0,
                    max: duration > 0 ? duration : 1,
                    value: position.clamp(0, duration),
                    activeColor: AppColors.yellowColor,
                    inactiveColor: Colors.white24,
                    onChanged: (val) {
                      _controller.seekTo(Duration(seconds: val.toInt()));
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous,
                        color: AppColors.white, size: 35),
                    onPressed: backwardVideo,
                  ),
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      color: AppColors.yellowColor,
                      size: 50,
                    ),
                    onPressed: playPause,
                  ),
          
                  /// Forward 10 sec
                  IconButton(
                    icon: Icon(Icons.skip_next,
                        color: AppColors.white, size: 35),
                    onPressed: forwardVideo,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
                child: PrimaryContainer(text: 'Options', colors:AppColors.white ),
              ),
              SizedBox(
                height: 38,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Videobottombutton(text: 'Morning Flow', onPressed: (){}),
                        )),
                    SizedBox(
                        width: 141,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Videobottombutton(text: 'Mid-Day Stretch', onPressed: (){}),
                        )),
                    SizedBox(
                        height: 38,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Videobottombutton(text: ' Evening Relax', onPressed: (){}),
                        )),
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