import 'package:clock_app/components/add_timer.dart';
import 'package:clock_app/components/timer_set.dart';
import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Alarm',
            style: kTextStyleHead,
          ),
          const SizedBox(
            height: 70,
          ),
          const TimerSet(),
          const AddTimer(),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
