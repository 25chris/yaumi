import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class AbsenDatePicker extends StatefulWidget {
  const AbsenDatePicker({super.key});

  @override
  State<AbsenDatePicker> createState() => _AbsenDatePickerState();
}

class _AbsenDatePickerState extends State<AbsenDatePicker> {
  final DatePickerController? controller = DatePickerController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => controller!.animateToDate(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now().subtract(const Duration(days: 11)),
      controller: controller,
      locale: "id_ID",
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.teal,
      selectedTextColor: Colors.white,
      activeDates: List.generate(
          10, (index) => DateTime.now().subtract(Duration(days: index))),
      daysCount: 14, // 10 days back, current day, 3 days forward
      onDateChange: (date) {
        // Check if the selected date is within the inactive range
        // if (date.isAfter(now) && date.isBefore(threeDaysAhead)) {
        // Show dialog or toast to inform about inactive date selection
        // showDialog(
        // context: context,
        // builder: (context) => AlertDialog(
        // title: Text('Date Unavailable'),
        // content: Text('This date is not available for selection.'),
        // actions: [
        // TextButton(
        // onPressed: () => Navigator.of(context).pop(),
        // child: Text('OK'),
        // ),
        // ],
        // ),
        // );
        // } else {
        // Update the state with the new date if it's within the active range
        // setState(() {
        // _selectedDate = date;
        // });
        // }
      },
    );
  }
}
