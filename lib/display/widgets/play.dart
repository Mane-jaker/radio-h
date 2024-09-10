import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_head/display/screens/providers.dart';

class Play extends ConsumerWidget {
  const Play({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayerManager =
        AudioPlayerManager(); // Obtener la instancia del manager
    final audioPlayer = audioPlayerManager.audioPlayer;

    final isPlaying = ref.watch(isPlayingProvider);

    void playRadio(String streamUrl) async {
      try {
        await audioPlayer
            .setUrl(streamUrl); // Usar la instancia del reproductor
        audioPlayer.play();
      } catch (e) {
        // Manejar errores de reproducción
        print('Error al reproducir la radio: $e');
      }
    }

    void stopRadio() {
      audioPlayer.pause(); // Usar la instancia del reproductor
    }

    return ElevatedButton(
      onPressed: () {
        if (isPlaying) {
          stopRadio();
        } else {
          playRadio('http://uk7.internet-radio.com:8226/live');
        }
        ref.read(isPlayingProvider.notifier).state = !isPlaying;
      },
      child: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
    );
  }
}

class AudioPlayerManager {
  static final AudioPlayerManager _instance = AudioPlayerManager._internal();

  factory AudioPlayerManager() {
    return _instance;
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayerManager._internal();

  AudioPlayer get audioPlayer => _audioPlayer;
}
