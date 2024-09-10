import 'package:flutter/material.dart';

class CustomContainerWithSwitch extends StatefulWidget {
  final String title;
  final String switchListTileTitle1;
  final bool switchListTileInitialValue1;
  final String switchListTileTitle2;
  final bool switchListTileInitialValue2;

  const CustomContainerWithSwitch({
    Key? key,
    required this.title,
    required this.switchListTileTitle1,
    required this.switchListTileInitialValue1,
    required this.switchListTileTitle2,
    required this.switchListTileInitialValue2,
  }) : super(key: key);

  @override
  CustomContainerWithSwitchState createState() => CustomContainerWithSwitchState();
}

class CustomContainerWithSwitchState extends State<CustomContainerWithSwitch> {
  bool _value1 = false;
  bool _value2 = false;

  @override
  void initState() {
    super.initState();
    _value1 = widget.switchListTileInitialValue1;
    _value2 = widget.switchListTileInitialValue2;
  }

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
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SwitchListTile(
            title: Text(widget.switchListTileTitle1),
            value: _value1,
            onChanged: (bool value) {
              setState(() {
                _value1 = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(widget.switchListTileTitle2),
            value: _value2,
            onChanged: (bool value) {
              setState(() {
                _value2 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}