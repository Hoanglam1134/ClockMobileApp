import 'package:clock_app/components/icon_switch.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/screens/alarm_page.dart';
import 'package:clock_app/screens/clock_page.dart';
import 'package:clock_app/screens/stopwatch_page.dart';
import 'package:clock_app/screens/timer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2D2F41),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 90,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selected = index;
                          slidePage(index, controller);
                        });
                      },
                      child: IconFuncSwitch(
                        imageUrl: iconFunc[index].imageUrl,
                        label: iconFunc[index].label,
                        color: index == _selected
                            ? Colors.black26
                            : Colors.transparent,
                      ),
                    );
                  }),
            ),
            const VerticalDivider(
              thickness: 0.8,
              color: Colors.white54,
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: controller,
                children: [
                  ClockPage(),
                  AlarmPage(),
                  TimerPage(),
                  StopwatchPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void slidePage(int index, PageController controller) {
  controller.animateToPage(
    index,
    duration: const Duration(milliseconds: 500),
    curve: Curves.linear,
  );
}
