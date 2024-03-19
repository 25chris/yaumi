import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';

// Define prayer times globally if they do not change
final Map<String, String> prayerTimes = {
  'Shubuh': '04:30',
  'Dhuhur': '12:00',
  'Ashr': '15:00',
  'Maghrib': '18:00',
  'Isha': '19:00',
};

class WaktuSholat extends StatefulWidget {
  const WaktuSholat({super.key});

  @override
  State<WaktuSholat> createState() => _WaktuSholatState();
}

class _WaktuSholatState extends State<WaktuSholat> {
  DateTime getNextPrayerTime() {
    final now = DateTime.now();

    DateTime? nextPrayerTime;
    for (var entry in prayerTimes.entries) {
      final prayerTimeToday = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(entry.value.split(':')[0]),
        int.parse(entry.value.split(':')[1]),
      );
      if (prayerTimeToday.isAfter(now) &&
          (nextPrayerTime == null ||
              prayerTimeToday.isBefore(nextPrayerTime))) {
        nextPrayerTime = prayerTimeToday;
      }
    }

    // If no next prayer time was found for today, it's after Isha, so the next prayer is Shubuh of the next day
    if (nextPrayerTime == null) {
      final shubuhTime = prayerTimes['Shubuh']!.split(':');
      nextPrayerTime = DateTime(now.year, now.month, now.day + 1,
          int.parse(shubuhTime[0]), int.parse(shubuhTime[1]));
    }

    return nextPrayerTime;
  }

  String getFormattedNextPrayerTime() {
    final nextPrayerTime = getNextPrayerTime();
    return DateFormat('HH:mm').format(nextPrayerTime);
  }

  @override
  Widget build(BuildContext context) {
    final nextPrayerTime =
        getNextPrayerTime(); // Calculate once for both widgets

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getNextPrayerTimeWidget(nextPrayerTime),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CountdownTimerWidget(nextPrayerTime: nextPrayerTime),
          ), // Pass nextPrayerTime here
        ],
      ),
    );
  }

  // Adjust getNextPrayerTimeWidget to accept DateTime parameter
  Widget getNextPrayerTimeWidget(DateTime nextPrayerTime) {
    final format = DateFormat('HH:mm');
    String nextPrayerName = prayerTimes.keys.firstWhere(
        (k) => format.format(nextPrayerTime) == prayerTimes[k],
        orElse: () => 'Shubuh');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Waktu Sholat: $nextPrayerName"),
        Text(
          format.format(nextPrayerTime),
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class CountdownTimerWidget extends StatefulWidget {
  final DateTime nextPrayerTime;

  const CountdownTimerWidget({Key? key, required this.nextPrayerTime})
      : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  Timer? _timer;
  Duration? _duration;

  void _startTimer() {
    _duration = widget.nextPrayerTime.difference(DateTime.now());

    _timer?.cancel(); // Cancel existing timer if any
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_duration!.inSeconds <= 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _duration = _duration! - Duration(seconds: 1);
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
    return Text(
      "${_duration!.inHours.toString().padLeft(2, '0')}:${(_duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration!.inSeconds % 60).toString().padLeft(2, '0')}",
      style: TextStyle(fontSize: 12),
    );
  }
}
