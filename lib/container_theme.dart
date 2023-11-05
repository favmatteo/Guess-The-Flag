import 'package:flutter/material.dart';

import 'package:guess_the_flag/flag_image.dart';
import 'package:guess_the_flag/guess_button.dart';

final flagImage = FlagImage();
final instance = flagImage.instance;
final guessButton = GuessButton(instance);

class ContainerTheme extends StatefulWidget {
  const ContainerTheme({super.key});

  @override
  State<ContainerTheme> createState() {
    return _ContainerThemeState();
  }
}

const darkTheme = [
  Color.fromARGB(255, 71, 60, 60),
  Color.fromARGB(153, 65, 31, 31),
];

const lightTheme = [
  Color.fromARGB(255, 167, 152, 152),
  Color.fromARGB(153, 204, 190, 190),
];

enum ColorTheme { dark, light }

class _ContainerThemeState extends State<ContainerTheme> {
  ColorTheme theme = ColorTheme.light;

  void changeTheme() {
    setState(() {
      theme = theme == ColorTheme.light ? ColorTheme.dark : ColorTheme.light;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flag Game"),
        backgroundColor:
            theme == ColorTheme.dark ? darkTheme[0] : lightTheme[0],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: theme == ColorTheme.dark ? darkTheme : lightTheme,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  flagImage,
                  guessButton,
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: changeTheme,
                  child: Text("Change Theme"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
