import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/play_bar.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  OptionsState createState() => OptionsState();
}

class OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(fit: StackFit.expand, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: 158,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: <Widget>[
                        CustomText(text: 'Notificaciones'),
                        CustomSwitchListTile(
                            title: 'Podcast', initialValue: false),
                        CustomSwitchListTile(
                            title: 'Noticias', initialValue: false),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: const Text(
                            'Aviso de Privacidad',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              // Aquí va ir el code para poner la navegacion al aviso de priacidad
                            },
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      width: screenWidth * 0.9,
                      height: 158,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Contactos',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('mail.example@xd.com  '),
                            leading: Icon(Icons.email),
                          ),
                          ListTile(
                            title: Text('+52 961 359 9651'),
                            leading: Icon(Icons.phone),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/facebook.svg'),
                            const SizedBox(width: 40),
                            SvgPicture.asset('assets/icons/instagram.svg'),
                            const SizedBox(width: 40),
                            SvgPicture.asset('assets/icons/twitter.svg'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/img/radiohead.png', width: 100)
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Radio Head',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      const PlayBar(),
    ]);
  }
}

class CustomSwitchListTile extends StatefulWidget {
  final String title;
  final bool initialValue;

  const CustomSwitchListTile({
    Key? key,
    required this.title,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<CustomSwitchListTile> createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      value: _value,
      onChanged: (bool value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}

class StyledContainer extends StatelessWidget {
  final Widget child;

  const StyledContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
