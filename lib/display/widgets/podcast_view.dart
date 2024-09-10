import 'package:flutter/material.dart';

class PodcastView extends StatelessWidget {
  const PodcastView({super.key, required this.title, required this.image});
  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 176, 205, 237),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            title!,
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
