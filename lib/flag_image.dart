import 'package:flutter/material.dart';

import 'package:guess_the_flag/flag_data.dart';

// ignore: must_be_immutable
class FlagImage extends StatefulWidget {
  FlagImage({super.key});

  FlagImageState instance = FlagImageState();

  @override
  State<FlagImage> createState() {
    // ignore: no_logic_in_create_state
    return instance;
  }
}

class FlagImageState extends State<FlagImage> {
  var countryCode = flagData.generateNewCountry();

  void update() {
    setState(() {
      countryCode = flagData.getCurrentCountryCode();
    });
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Image.network(
        "https://flagcdn.com/h240/${countryCode.toLowerCase()}.png",
      ),
    );
  }
}
