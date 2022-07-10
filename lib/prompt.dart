import 'package:flutter/material.dart';
import 'package:guess_the_number/text_style.dart';

class Prompt extends StatelessWidget {
  const Prompt({Key? key, required this.targetvalue}) : super(key: key);
   final int targetvalue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('PUT THE BULLSEYES AS CLOSE AS YOU CAN TO',
        style: LabelTextStyle.bodyText1(context),
        ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('$targetvalue'),
      ),
      ],
    );
  }
}

