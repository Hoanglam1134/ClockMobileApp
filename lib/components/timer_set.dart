import 'package:clock_app/constants.dart';
import 'package:clock_app/data.dart';
import 'package:flutter/material.dart';

class TimerSet extends StatelessWidget {
  const TimerSet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: timers.map((timer) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: kPadding),
            padding: const EdgeInsets.symmetric(
              horizontal: kPadding * 1.5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors[timer.index]),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.shade200,
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: 0.2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.label,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      timer.label,
                      style: kTextStyleDef,
                    ),
                    const Spacer(),
                    Switch(
                      activeColor: Colors.white,
                      onChanged: (bool value) {},
                      value: true,
                    ),
                  ],
                ),
                Text(
                  timer.repeat,
                  style: kTextStyleDef,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timer.time,
                      style: kTextStyleHead,
                    ),
                    const Icon(
                      Icons.expand_more,
                      color: Colors.white,
                      size: 35,
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
