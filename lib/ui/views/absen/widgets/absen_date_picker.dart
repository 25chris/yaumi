import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:yaumi/ui/views/absen/absen_viewmodel.dart';

class AbsenDatePicker extends StatefulWidget {
  final AbsenViewModel viewModel;
  const AbsenDatePicker({super.key, required this.viewModel});

  @override
  State<AbsenDatePicker> createState() => _AbsenDatePickerState();
}

class _AbsenDatePickerState extends State<AbsenDatePicker> {
  final DatePickerController? controller = DatePickerController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => controller!.animateToDate(widget.viewModel.selectedDateTime));
  }

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now().subtract(const Duration(days: 11)),
      controller: controller,
      locale: "id_ID",
      initialSelectedDate: widget.viewModel.selectedDateTime,
      selectionColor: Colors.teal,
      selectedTextColor: Colors.white,
      activeDates: List.generate(
          10, (index) => DateTime.now().subtract(Duration(days: index))),
      daysCount: 14, // 10 days back, current day, 3 days forward
      onDateChange: (date) {
        widget.viewModel.selectDate(date: date);
      },
    );
  }
}
