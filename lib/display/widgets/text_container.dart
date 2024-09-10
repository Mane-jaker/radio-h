import 'package:flutter/material.dart';

class CustomContactContainer extends StatelessWidget {
  final String title;
  final String email;
  final String phoneNumber;

  const CustomContactContainer({
    Key? key,
    required this.title,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: 158,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(email),
            leading: const Icon(Icons.email),
          ),
          ListTile(
            title: Text(phoneNumber),
            leading: const Icon(Icons.phone),
          ),
        ],
      ),
    );
  }
}