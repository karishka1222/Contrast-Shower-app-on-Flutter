import 'dart:ffi';

import 'package:contrast_shower/components/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Sessions extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  const Sessions({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  late FixedExtentScrollController _controllerHours;
  late FixedExtentScrollController _controllerMinutes;
  late FixedExtentScrollController _controllerSeconds;

  String currentTime = "";

  final _mybox = Hive.box('mybox');

  void writeData() {
    setState(() {
      currentTime = _controllerHours.selectedItem.toString() +
          ":" +
          _controllerMinutes.selectedItem.toString() +
          ":" +
          _controllerSeconds.selectedItem.toString();
    });
    _mybox.put(_mybox.length, currentTime);
  }

  String read() {
    return _mybox.get(_mybox.length - 1);
  }

  @override
  void initState() {
    super.initState();

    _controllerHours = FixedExtentScrollController(initialItem: 0);
    _controllerMinutes = FixedExtentScrollController(initialItem: 0);
    _controllerSeconds = FixedExtentScrollController(initialItem: 0);
  }

  void _setTime() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.surface,
      context: context,
      builder: (context) => SizedBox(
        height: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: _controllerHours,
                onSelectedItemChanged: (value) {
                  setState(() {});
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 24,
                    builder: (context, index) {
                      return Text(
                        index.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: _controllerMinutes,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) {
                      return Text(
                        index < 10 ? '0' + index.toString() : index.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: _controllerSeconds,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) {
                      return Text(
                        index < 10 ? '0' + index.toString() : index.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
    writeData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomIcon(
                color: widget.color,
                icon: widget.icon,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    currentTime != "" ? currentTime : 'nothing',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: _setTime,
              child: Icon(
                Icons.edit_outlined,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
