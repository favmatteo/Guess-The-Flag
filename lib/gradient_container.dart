import 'package:flutter/material.dart';

import 'package:guess_the_flag/flag_image.dart';
import 'package:guess_the_flag/guess_button.dart';

final flagImage = FlagImage();
final instance = flagImage.instance;
final guessButton = GuessButton(instance);

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  // @override
  // Widget build(context) {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       gradient: LinearGradient(
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomLeft,
  //           colors: [
  //             Color.fromARGB(255, 71, 60, 60),
  //             Color.fromARGB(153, 65, 31, 31)
  //           ]),
  //     ),
  //     child: const Center(
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: FlagImage(),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: GuessButton(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 71, 60, 60),
              Color.fromARGB(153, 65, 31, 31)
            ]),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            flagImage,
            guessButton,
          ],
        ),
      ),
    );
  }
}
