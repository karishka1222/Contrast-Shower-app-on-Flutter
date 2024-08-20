import 'package:contrast_shower/components/round_button.dart';
import 'package:contrast_shower/components/sessions.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

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
          children: [
            Sessions(
              title: "Hot session",
              subtitle: "30 minutes",
              color: Color(0xFFF4520C),
              icon: Icons.local_fire_department_outlined,
            ),
            Text("Time left: 10:34"),
            Row(
              children: [
                RoundButton(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  icon: Icons.refresh,
                  colorIcon: Theme.of(context).colorScheme.primary,
                ),
                RoundButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: Icons.pause_outlined,
                  colorIcon: Theme.of(context).colorScheme.secondary,
                ),
                RoundButton(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  icon: Icons.stop_circle,
                  colorIcon: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
