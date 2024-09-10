import 'package:flutter/material.dart';

class CustomContainerWithListTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomContainerWithListTile({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: onPressed,
        ),
      ),
    );
  }
}