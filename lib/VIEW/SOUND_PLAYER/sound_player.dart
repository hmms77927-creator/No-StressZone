import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';

class SoundPlayer extends StatefulWidget {
  const SoundPlayer({super.key});

  @override
  State<SoundPlayer> createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> {
  late PlayerController playerController;
  bool isPlayerReady = false;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    playerController = PlayerController();

    // Prepare remote audio
    await playerController.preparePlayer(
      path: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      shouldExtractWaveform: true, // optional, if you want waveform
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          SizedBox.expand(
            child: Image.asset(
            AppImages.audioimage,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                /// Title
                const Text(
                  "Sound Player",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 40),

                /// Timer
                const Text(
                  "00:30",
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                /// Bottom Glass Container
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      /// Time Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("1:02",
                              style: TextStyle(color: Colors.white)),
                          Text("10:00",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),

                      const SizedBox(height: 10),
                      // if (isPlayerReady)
                        AudioFileWaveforms(
                          size: const Size(double.infinity, 80),
                          playerController: playerController,
                          waveformType: WaveformType.fitWidth,
                          enableSeekGesture: true,
                          playerWaveStyle: const PlayerWaveStyle(
                            fixedWaveColor: Colors.white54,
                            liveWaveColor: Colors.white,
                            spacing: 6,
                            waveThickness: 2,
                            waveCap: StrokeCap.round,
                            showSeekLine: false,
                          ),
                        ),
                      // AudioFileWaveforms(
                      //   size: const Size(double.infinity, 80),
                      //   playerController: playerController,
                      //   waveformType: WaveformType.fitWidth,
                      //   enableSeekGesture: true,
                      //   playerWaveStyle:PlayerWaveStyle(
                      //     fixedWaveColor: Colors.white54,
                      //     liveWaveColor: Colors.white,
                      //     spacing: 2,              // 🔥 IMPORTANT: no gap
                      //     waveThickness: 2,        // thinner = smoother look
                      //     waveCap: StrokeCap.round,
                      //     showSeekLine: false,
                      //   ),
                      // ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.skip_previous,
                                color: Colors.white, size: 35),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (isPlaying) {
                                await playerController.pausePlayer();
                              } else {
                                await playerController.startPlayer();
                              }

                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.skip_next,
                                color: Colors.white, size: 35),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

