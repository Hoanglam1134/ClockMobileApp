import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AnimatedTimer extends StatelessWidget {
  const AnimatedTimer({
    Key? key,
    required this.miliSec,
    required this.maxMili,
    required this.hourShow,
    required this.minShow,
    required this.secShow,
  }) : super(key: key);

  final int miliSec;
  final int maxMili;
  final String hourShow;
  final String minShow;
  final String secShow;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: CircularPercentIndicator(
        animation: true,
        animateFromLastPercent: true,
        radius: MediaQuery.of(context).size.width / 2,
        lineWidth: 10.0,
        percent: miliSec / maxMili,
        center: Text(
          '$hourShow:$minShow:$secShow',
          style: kTextStyleHead,
        ),
        progressColor: Colors.amber[700],
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class DevText extends StatelessWidget {
  const DevText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'developed by Hoanglam.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String label;
  Button({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.amber,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.amber,
          fontFamily: 'avenir',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
