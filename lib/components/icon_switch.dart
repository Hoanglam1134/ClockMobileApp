import 'package:flutter/material.dart';

class IconFuncSwitch extends StatefulWidget {
  String label;
  String imageUrl;
  Color color;
  IconFuncSwitch({
    Key? key,
    required this.imageUrl,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  State<IconFuncSwitch> createState() => _IconFuncSwitchState();
}

class _IconFuncSwitchState extends State<IconFuncSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            widget.imageUrl,
            scale: 1.5,
          ),
          const SizedBox(
            height: 10,
            width: 70,
          ),
          Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'avenir',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
