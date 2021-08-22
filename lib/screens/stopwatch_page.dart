import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stopwatch',
            style: kTextStyleHead,
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '00:00:00',
                style: kTimeStyle,
              ),
            ),
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orangeAccent),
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Start',
              style: kTextStyleHead,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                'Kyrie.Inc 2021',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
