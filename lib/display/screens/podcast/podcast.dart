import 'package:flutter/material.dart';
import 'package:radio_head/display/widgets/podcast_view.dart';

import '../../widgets/play_bar.dart';

class Podcast extends StatelessWidget {
  const Podcast({super.key});

  @override
  Widget build(BuildContext context) {
    final lista = [
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
      {"title": "Podcast de cj", "image": "https://i.imgur.com/BoN9kdC.png"},
    ];
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            // Cambia de ListView a Column
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinea el contenido a la izquierda
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Programas",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: lista.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = lista[index];
                    return PodcastView(
                        title: item["title"], image: item["image"]);
                  },
                ),
              ),
            ],
          ),
        ),
        const PlayBar(),
      ],
    );
  }
}
