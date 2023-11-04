import 'package:flutter/material.dart';

import 'package:guess_the_flag/flag_data.dart';

// ignore: must_be_immutable
class FlagImage extends StatefulWidget {
  FlagImage({super.key});

  FlagImageState instance = FlagImageState();

  @override
  // ignore: no_logic_in_create_state
  State<FlagImage> createState() {
    return instance;
  }
}

class FlagImageState extends State<FlagImage> {
  var country = flagData.generateNewCountry();

  void update() {
    setState(() {
      country = flagData.getCurrentCountryCode();
    });
  }

  @override
  Widget build(context) {
    return Image.network(
      "https://flagsapi.com/$country/shiny/64.png",
      scale: .1,
    );
  }
}
