import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import '../constants.dart';

class ClockUI extends StatefulWidget {
  final double size;
  ClockUI({required this.size});

  @override
  _ClockUIState createState() => _ClockUIState();
}

class _ClockUIState extends State<ClockUI> {
  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kPadding),
      height: widget.size * 0.6,
      width: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPaint(),
        ),
      ),
    );
  }
}

class ClockPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();
    // 1 sec ~ 1 min = 360/60 = 6 degrees
    // 1 hour = 30 degrees + 0.5 degree each min
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width, size.height) / 2;
    double centerWidth = size.width / 2;
    double centerHeight = size.height / 2;

    //draw clock
    var paintBrush = Paint()..color = Color(0xFF444974);
    //draw outline
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius / 10;
    //draw center
    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);
    canvas.drawCircle(center, radius * 0.6, paintBrush);
    canvas.drawCircle(center, radius * 0.6, outlineBrush);
    // second
    var secBrush = Paint()
      ..color = Color(0xFFFFB74D)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    var secX = centerWidth + radius * 0.5 * cos(dateTime.second * 6 * pi / 180);
    var secY =
        centerHeight + radius * 0.5 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secX, secY), secBrush);
    // minute
    var minBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    var minX = centerWidth + radius * 0.4 * cos(dateTime.minute * 6 * pi / 180);
    var minY =
        centerHeight + radius * 0.4 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minX, minY), minBrush);
    //hour
    var hourBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    var hourX = centerWidth +
        radius *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourY = centerHeight +
        radius *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourX, hourY), hourBrush);
    //draw center dot
    canvas.drawCircle(center, radius * 0.1, centerFillBrush);
    //draw line around
    var lineBrush = Paint()
      ..strokeWidth = 1
      ..color = Colors.white;
    var outerCircleRadius = radius * 0.9;
    var innerCircleRadius = radius * 0.8;
    for (int i = 0; i < 360; i += 12) {
      var x1 = centerWidth + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerHeight + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerWidth + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerHeight + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), lineBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
