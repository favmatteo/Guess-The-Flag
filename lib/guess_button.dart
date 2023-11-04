import 'package:flutter/material.dart';

import 'package:guess_the_flag/flag_data.dart';
import 'package:guess_the_flag/flag_image.dart';

class GuessButton extends StatefulWidget {
  const GuessButton(this.flagImageState, {super.key});

  final FlagImageState flagImageState;

  @override
  State<GuessButton> createState() {
    return _GuessButtonState();
  }
}

const colorWrongAnswer = Colors.red;
const colorCorrectAnswer = Colors.green;
var solutions = flagData.randomizeAnswer();
var correctAnswer = flagData.getCurrentFlag();
int position = solutions.indexOf(correctAnswer);

class _GuessButtonState extends State<GuessButton> {
  var buttonPressed = [false, false, false, false];

  void checkAnswer(int number, String text) {
    if (text == correctAnswer) {
      setState(() {
        buttonPressed[number] = true;
      });
    }
    if (text != correctAnswer) {
      setState(() {
        buttonPressed[number] = true;
      });
    }
  }

  void skip() {
    setState(() {
      flagData.generateNewCountry();
      solutions = flagData.randomizeAnswer();
      correctAnswer = flagData.getCurrentFlag();
      position = solutions.indexOf(correctAnswer);
      buttonPressed = [false, false, false, false];
      widget.flagImageState.update();
    });
  }

  Color setBackgroundColor(int currPosition) {
    if (currPosition == position) {
      return colorCorrectAnswer;
    }
    return colorWrongAnswer;
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(0, solutions[0]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        buttonPressed[0] ? setBackgroundColor(0) : null,
                  ),
                  child: Text(solutions[0]),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(1, solutions[1]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        buttonPressed[1] ? setBackgroundColor(1) : null,
                  ),
                  child: Text(solutions[1]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(2, solutions[2]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        buttonPressed[2] ? setBackgroundColor(2) : null,
                  ),
                  child: Text(solutions[2]),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(3, solutions[3]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        buttonPressed[3] ? setBackgroundColor(3) : null,
                  ),
                  child: Text(solutions[3]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: skip,
                  child: const Text(
                    "Next flag!",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
