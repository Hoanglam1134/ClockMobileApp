import 'package:clock_app/components/icon_class.dart';
import 'package:flutter/cupertino.dart';

import 'components/timer_class.dart';

List<IconSwitch> iconFunc = [
  IconSwitch(
    imageUrl: 'assets/clock_icon.png',
    label: 'Clock',
  ),
  IconSwitch(
    imageUrl: 'assets/alarm_icon.png',
    label: 'Alarm',
  ),
  IconSwitch(
    imageUrl: 'assets/timer_icon.png',
    label: 'Timer',
  ),
  IconSwitch(
    imageUrl: 'assets/stopwatch_icon.png',
    label: 'Stopwatch',
  ),
];

List<Timer> timers = [
  Timer('Sport', 'Thu-Sat', '06:00', 0),
  Timer('Office', 'Mon-Fri', '07:00', 1),
];

const List colors = [
  [
    Color(0xff2193b0),
    Color(0xff6dd5ed),
  ],
  [
    Color(0xffde6262),
    Color(0xffffb88c),
  ]
];
