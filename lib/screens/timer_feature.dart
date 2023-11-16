import 'dart:async';

import 'package:flutter/material.dart';

class TimerFeature extends StatefulWidget {
  const TimerFeature({super.key});

  @override
  State<TimerFeature> createState() => _TimerFeatureState();
}

class _TimerFeatureState extends State<TimerFeature> {
  static const tenMinutes = 600;
  int totalSeconds = tenMinutes;
  int totalAttempts = 0;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalAttempts += 1;
        isRunning = false;
        totalSeconds = tenMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartedPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    setState(() {
      isRunning = false;
    });
    timer.cancel();
  }

  void onReset() {
    setState(() {
      isRunning = false;
      totalSeconds = tenMinutes;
    });
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    onPressed: isRunning ? onPausePressed : onStartedPressed,
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                  ),
                ),
                Center(
                  child: isRunning || totalSeconds != tenMinutes
                      ? IconButton(
                          onPressed: onReset,
                          iconSize: 120,
                          color: Theme.of(context).cardColor,
                          icon: const Icon(Icons.refresh),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total Attempts',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '$totalAttempts',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
