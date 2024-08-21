import 'dart:async';

import 'package:contrast_shower/components/round_button.dart';
import 'package:contrast_shower/components/sessions.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int sessionTime = 10;
  int timeLeft = 10;
  bool isRunning = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountDown() {
    isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          isRunning = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("The session is going on..."),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Sessions(
              title: "Hot session",
              subtitle: "30 minutes",
              color: Color(0xFFF4520C),
              icon: Icons.local_fire_department_outlined,
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: CircularProgressIndicator(
                    value: timeLeft / 10,
                    strokeWidth: 10,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      timeLeft.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      "1 of 2 cycles",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "Time left: 10:34",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: RoundButton(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    icon: Icons.refresh,
                    colorIcon: Theme.of(context).colorScheme.primary,
                    iconSize: 30,
                    onTap: () {
                      setState(() {
                        _timer?.cancel();
                        timeLeft = sessionTime;
                        isRunning = false;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: RoundButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: isRunning
                        ? Icons.pause_outlined
                        : Icons.play_arrow_rounded,
                    colorIcon: Theme.of(context).colorScheme.secondary,
                    iconSize: 40,
                    onTap: () {
                      if (isRunning) {
                        setState(() {
                          isRunning = false;
                        });
                        _timer?.cancel();
                      } else {
                        _startCountDown();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: RoundButton(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    icon: Icons.stop,
                    colorIcon: Theme.of(context).colorScheme.primary,
                    iconSize: 30,
                    onTap: () {
                      _timer?.cancel();
                      setState(() {
                        isRunning = false;
                      });
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmation'),
                            content: const Text(
                                'Are you sure you want to stop this session?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(context, "/summary");
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
