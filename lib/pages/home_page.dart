import 'package:contrast_shower/components/button.dart';
import 'package:contrast_shower/components/sessions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sessions you planned"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Before starting your session, you will have",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Sessions(
                  title: "Time before start",
                  subtitle: "1 minute",
                  color: Color(0xFF05FE00),
                  icon: Icons.watch_later_outlined,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Session settings",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Sessions(
                  title: "Hot session",
                  subtitle: "30 minutes",
                  color: Color(0xFFF4520C),
                  icon: Icons.local_fire_department_outlined,
                ),
                Sessions(
                  title: "Cold session",
                  subtitle: "30 minutes",
                  color: Color(0xFF3038F4),
                  icon: Icons.severe_cold_rounded,
                ),
                Sessions(
                  title: "Repetitions",
                  subtitle: "2 cycles",
                  color: Color(0xFFDBFE00),
                  icon: Icons.repeat_rounded,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "20-minute",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "contrast shower awaits you",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Please, put your phone by the shower and press "start"',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  text: "       Start       ",
                  onTap: () => Navigator.pushNamed(context, "/summary"),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
