import 'package:clock_app/components/timer_page_component.dart';
import 'package:clock_app/constants.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool isActive = false;
  bool isPause = false;
  int miliSec = 0;
  int maxMili = 0;
  Timer? timer;
  void setTimer(int hour, int min, int sec, {bool reset = true}) {
    if (reset) {
      maxMili = miliSec = sec * 1000 + min * 1000 * 60 + hour * 3600 * 1000;
    }
    isPause = false;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        miliSec -= 10;
        if (miliSec == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int secShow = (miliSec % 3600000 % 60000 / 1000).floor();
    int minShow = ((miliSec % 3600000) / 60000).floor();
    int hourShow = (miliSec / 3600000).floor();
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Timer',
            style: kTextStyleHead,
          ),
          AnimatedTimer(
              miliSec: miliSec,
              maxMili: maxMili,
              hourShow: hourShow.toString().padLeft(2, '0'),
              minShow: minShow.toString().padLeft(2, '0'),
              secShow: secShow.toString().padLeft(2, '0')),
          buildIsActive(),
          const DevText(),
        ],
      ),
    );
  }

  Widget buildIsActive() {
    return !isActive
        ? InkWell(
            onTap: () {
              isActive = true;
              setTimer(0, 1, 15);
            },
            child: Button(label: 'Start'),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (!isPause) {
                      isPause = true;
                      timer?.cancel();
                    } else {
                      isPause = false;
                      setTimer(0, 0, 15, reset: false);
                    }
                  });
                },
                child: Button(label: !isPause ? 'Pause' : 'Resume'),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    timer?.cancel();
                    miliSec = maxMili;
                    isActive = false;
                  });
                },
                child: Button(label: 'Stop'),
              ),
            ],
          );
  }
}
