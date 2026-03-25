import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';

class SoundPlayer extends StatefulWidget {
  const SoundPlayer({super.key});

  @override
  State<SoundPlayer> createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> {

  late PlayerController playerController;
  bool isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    playerController = PlayerController();

    await playerController.preparePlayer(
      path: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    );

    setState(() {
      isPlayerReady = true;
    });
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.audioimage,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                headerContainer(text: 'Sound Player', colors: AppColors.white),

                Center(child: headcontainer('00:30', AppColors.white)),

                Container(
                  width: 353,
                  height: 242,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white.withOpacity(0.35),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// waveform
                      if (isPlayerReady)
                        AudioFileWaveforms(

                          size: Size(
                           215,74
                          ),
                          waveformType:WaveformType.fitWidth ,
                          playerController: playerController,
                          decoration: BoxDecoration(
                            color: AppColors.white,

                          ),

                        ),
                      AudioFileWaveforms(
                        size: const Size(215, 74),
                        waveformType: WaveformType.fitWidth,
                        playerController: playerController,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        playerWaveStyle: const PlayerWaveStyle(
                          fixedWaveColor: Colors.grey,   // wave color
                          liveWaveColor: Colors.blue,    // playing wave color
                          waveThickness: 3,              // bar width
                          spacing: 4,                    // gap between bars
                          waveCap: StrokeCap.round,      // rounded wave bars
                          showSeekLine: false,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// play button
                      IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 40,
                        ),
                        onPressed: () async {
                          if (isPlaying) {
                            await playerController.pausePlayer();
                          } else {
                            await playerController.startPlayer();
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}





