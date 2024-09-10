import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/nyt_respons.dart';
import '../../../core/repositories/nyt_api_repository.dart';
import '../../widgets/news_card.dart';
import '../../widgets/play.dart';
import '../../widgets/play_bar.dart';
import '../news/news_page.dart';


final nytApiRepositoryProvider = Provider((ref) => NYTApiRepository());

class MainRadio extends StatelessWidget {
  const MainRadio({required Key key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [Play()],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Noticias',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, ref, child) {
                    final apiRepository = ref.watch(nytApiRepositoryProvider);
                    return FutureBuilder<NYTResponse>(
                      future: apiRepository.getNews(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final NYTResponse newsResponse = snapshot.data!;
                          return SizedBox(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                newsResponse.results.length,
                                (index) {
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
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      child: NewsCard(
                                          image: newsResponse.results
                                              .elementAt(index)
                                              .media
                                              .first
                                              .mediaMetadata
                                              .elementAt(2)
                                              .url,
                                          title: newsResponse.results.elementAt(index).title),
                                    ),
                                  );
                                },
                              ),
                            ),
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
                  },
                ),
              ],
            ),
          ),
        ),
        const PlayBar()
      ]),
    );
  }
}


