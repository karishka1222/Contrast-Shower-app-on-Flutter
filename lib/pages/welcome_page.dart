import 'package:contrast_shower/components/button.dart';
import 'package:contrast_shower/components/outline_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 220,
                ),
                Text(
                  "Contrast Shower",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.av_timer_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 100,
                ),
              ],
            ),
            Column(
              children: [
                Button(
                  text: "Start new session",
                  onTap: () => Navigator.pushNamed(context, "/home"),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlineButton(
                  text: "Previous sessions",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
