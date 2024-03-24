import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/models/yaumi.dart';
import 'package:yaumi/ui/views/yaumi/yaumi_viewmodel.dart';

class YaumiDatePicker extends StatefulWidget {
  final YaumiViewModel viewModel;
  const YaumiDatePicker({super.key, required this.viewModel});

  @override
  State<YaumiDatePicker> createState() => _YaumiDatePickerState();
}

class _YaumiDatePickerState extends State<YaumiDatePicker> {
  final DatePickerController? controller = DatePickerController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => controller!.animateToDate(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YaumiBloc, YaumiState>(
      builder: (context, state) {
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
            if (state.allYaumis
                .where((element) => element.date == date)
                .isEmpty) {
              context.read<YaumiBloc>().add(AddYaumi(
                  yaumi: Yaumi(
                      date: date,
                      shubuh: false,
                      dhuhur: false,
                      ashar: false,
                      maghrib: false,
                      isya: false,
                      tahajud: 0,
                      dhuha: 0,
                      qshubuh: false,
                      qdhuhur: false,
                      bdhuhur: false,
                      bmaghrib: false,
                      bisya: false,
                      tilawah: 0,
                      poin: 0,
                      shaumSunnah: ShaumSunnah.tidakShaum,
                      dzikirPagi: false,
                      dzikirPetang: false,
                      taklim: Taklim.tidakTaklim,
                      istighfar: false,
                      shalawat: false)));
              widget.viewModel.setDate(date);
            } else {
              widget.viewModel.setDate(date);
            }
            //
          },
        );
      },
    );
  }
}
