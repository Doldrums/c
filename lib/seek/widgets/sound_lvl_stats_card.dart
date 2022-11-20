import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:noise_meter/noise_meter.dart';

import '../../common/neumorphic_card_base.dart';

class SoundLVLStatsCard extends StatefulWidget {
  const SoundLVLStatsCard({super.key});

  @override
  SoundLVLStatsCardState createState() => SoundLVLStatsCardState();
}

class SoundLVLStatsCardState extends State<SoundLVLStatsCard> {
  bool _isRecording = false;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  late NoiseMeter _noiseMeter;

  @override
  void initState() {
    super.initState();
    _noiseMeter = NoiseMeter(onError);
  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  void onData(NoiseReading noiseReading) {
    setState(() {
      if (!_isRecording) {
        _isRecording = true;
      }
    });
    print(noiseReading.toString());
  }

  void onError(Object error) {
    print(error.toString());
    _isRecording = false;
  }

  void start() async {
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } catch (err) {
      print(err);
    }
  }

  void stop() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription!.cancel();
        _noiseSubscription = null;
      }
      setState(() {
        _isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  Widget getContent() => Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(_isRecording ? "Mic: ON" : "Mic: OFF",
                  style: const TextStyle(fontSize: 25, color: Colors.blue)),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return NeumorphicCardBase(
      content: SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getContent(),
              Align(
                alignment: Alignment.bottomRight,
                child: NeumorphicButton(
                  onPressed: _isRecording ? stop : start,
                  style: NeumorphicStyle(
                    depth: 20,
                    surfaceIntensity: 1,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(8),
                    ),
                  ),
                  child: _isRecording
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.mic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
