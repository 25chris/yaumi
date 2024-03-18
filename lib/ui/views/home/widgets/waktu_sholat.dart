import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaktuSholat extends StatefulWidget {
  const WaktuSholat({super.key});

  @override
  State<WaktuSholat> createState() => _WaktuSholatState();
}

class _WaktuSholatState extends State<WaktuSholat> {
  DateTime? nextPrayerTime;

  @override
  void initState() {
    super.initState();
    nextPrayerTime = getNextPrayerTime();
  }

  DateTime getNextPrayerTime() {
    // Your logic to calculate the next prayer time
    // This is just a placeholder logic
    return DateTime.now().add(const Duration(hours: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrayerTimeWidget(nextPrayerTime: nextPrayerTime!),
        const SizedBox(height: 20),
        CountdownTimerWidget(nextPrayerTime: nextPrayerTime!),
      ],
    );
  }
}

class PrayerTimeWidget extends StatelessWidget {
  final DateTime nextPrayerTime;

  const PrayerTimeWidget({super.key, required this.nextPrayerTime});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('HH:mm');
    return Center(
      child: Text(
        "Next Prayer at ${format.format(nextPrayerTime)}",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class CountdownTimerWidget extends StatefulWidget {
  final DateTime nextPrayerTime;

  const CountdownTimerWidget({super.key, required this.nextPrayerTime});

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  Timer? _timer;
  late Duration _duration;

  void _startTimer() {
    setState(() {
      _duration = widget.nextPrayerTime.difference(DateTime.now());
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_duration.inSeconds <= 0) {
        _timer!.cancel();
      } else {
        setState(() {
          _duration -= const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );

    Center(
      child: Text(
        "Time until next prayer: ${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
