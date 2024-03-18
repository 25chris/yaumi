import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';

class WaktuSholat extends StatefulWidget {
  const WaktuSholat({super.key});

  @override
  State<WaktuSholat> createState() => _WaktuSholatState();
}

class _WaktuSholatState extends State<WaktuSholat> {
  Widget getNextPrayerTime() {
    // Define prayer times
    Map<String, String> prayerTimes = {
      'Shubuh': '04:30',
      'Dhuhur': '12:00',
      'Ashr': '15:00',
      'Maghrib': '18:00',
      'Isha': '19:00',
    };

    // Get current time
    final now = DateTime.now();
    final format = DateFormat('HH:mm');
    final currentTime = format.format(now);

    // Determine the next prayer time
    String nextPrayer = "";
    DateTime? nextPrayerTime;
    for (var entry in prayerTimes.entries) {
      final prayerTimeToday = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(entry.value.split(':')[0]),
          int.parse(entry.value.split(':')[1]));
      if (prayerTimeToday.isAfter(now)) {
        if (nextPrayerTime == null ||
            prayerTimeToday.isBefore(nextPrayerTime)) {
          nextPrayer = entry.key;
          nextPrayerTime = prayerTimeToday;
        }
      }
    }

    // If no next prayer time was found for today, it's after Isha, so the next prayer is Shubuh of the next day
    if (nextPrayer == "") {
      nextPrayer = 'Shubuh';
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      nextPrayerTime = DateTime(
          tomorrow.year,
          tomorrow.month,
          tomorrow.day,
          int.parse(prayerTimes[nextPrayer]!.split(':')[0]),
          int.parse(prayerTimes[nextPrayer]!.split(':')[1]));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sholat $nextPrayer"),
        SizedBox(
          height: 8.0,
        ),
        Text(
          format.format(nextPrayerTime!),
          style: ktsBodyLarge.copyWith(
              fontSize: 20.0, fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: getNextPrayerTime(),
    );
  }
}

// class CountdownTimerWidget extends StatefulWidget {
//   @override
//   _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
// }

// class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
//   Timer? _timer;
//   Duration? _duration;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     final nextPrayerTime = (context.findAncestorWidgetOfExactType<WaktuSholat>()
//             as _WaktuSholatState)
//         .getNextPrayerTime();
//     _duration = nextPrayerTime.difference(DateTime.now());

//     _timer?.cancel(); // Cancel existing timer if any
//     _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       if (_duration!.inSeconds == 0) {
//         setState(() {
//           timer.cancel();
//         });
//       } else {
//         setState(() {
//           _duration = _duration! - Duration(seconds: 1);
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         "Time until next prayer: ${_duration!.inHours.toString().padLeft(2, '0')}:${(_duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration!.inSeconds % 60).toString().padLeft(2, '0')}",
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
