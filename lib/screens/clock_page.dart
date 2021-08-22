import 'package:clock_app/components/clock_ui.dart';
import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String timeNumber = DateFormat('HH:mm').format(dateTime).toString();
    String dateText = DateFormat('  EEE, d, MMM').format(dateTime).toString();
    String timezone = dateTime.timeZoneOffset.toString().split('.').first;
    String timeSign = timezone.startsWith('-') ? '' : '+';
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Clock', style: kTextStyleHead),
          const SizedBox(height: 50),
          Text(timeNumber, style: kTimeStyle),
          Text(dateText, style: kTextStyleDef),
          ClockUI(size: MediaQuery.of(context).size.width),
          const Text('Timezone', style: kTextStyleDef),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                Text('   UTC' + timeSign + timezone, style: kTextOffset),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
