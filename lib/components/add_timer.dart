import 'package:clock_app/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddTimer extends StatelessWidget {
  const AddTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: const Radius.circular(28),
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 1.5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF444974),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.add_box_outlined,
              size: 50,
              color: Colors.blue,
            ),
            Text(
              'Add Alarm',
              style: kTextStyleDef,
            ),
          ],
        ),
      ),
    );
  }
}
