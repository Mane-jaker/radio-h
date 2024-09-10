import 'package:flutter/material.dart';
import 'package:radio_head/display/screens/news/news_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_head/core/models/nyt_respons.dart';
import '../../widgets/news_card.dart';
import '../../../core/provider/nyt_api_provider.dart';
import '../../widgets/play_bar.dart';

class News extends ConsumerWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiRepository = ref.watch(nytApiRepositoryProvider);
    return FutureBuilder<NYTResponse>(
      future: apiRepository.getNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final NYTResponse newsResponse = snapshot.data!;
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 100, left: 12, right: 12, top: 15),
                child: ListView.builder(
                  itemCount: newsResponse.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (newsResponse.results.elementAt(index).media.isEmpty) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsPage(
                                  title: 'SI',
                                  url: newsResponse.results
                                      .elementAt(index)
                                      .url),
                            ),
                          );
                        },
                        child: NewsCard(
                            image:
                                "https://linube.com/blog/wp-content/uploads/error-404.jpg",
                            title: newsResponse.results.elementAt(index).title),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                NewsPage(
                                    title: 'Radio Head',
                                    url: newsResponse.results
                                        .elementAt(index)
                                        .url),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: NewsCard(
                          image: newsResponse.results
                              .elementAt(index)
                              .media
                              .first
                              .mediaMetadata
                              .elementAt(2)
                              .url,
                          title: newsResponse.results.elementAt(index).title),
                    );
                  },
                ),
              ),
              const PlayBar(),
            ],
          );
        } else if (snapshot.hasError) {
          return const NewsCard(
              image: "https://linube.com/blog/wp-content/uploads/error-404.jpg",
              title: "Fallo al noticiar");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
