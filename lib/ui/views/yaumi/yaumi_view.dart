import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';

import 'yaumi_viewmodel.dart';

class YaumiView extends StackedView<YaumiViewModel> {
  const YaumiView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    YaumiViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Muthaba'ah Yaumiah",
            textAlign: TextAlign.center,
            style: ktsBodyLarge.copyWith(
                fontSize: 30.0,
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.w800),
          ),
          verticalSpaceSmall,
          StaggeredGrid.count(
            crossAxisCount: 6,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1.5,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Pencapaian periode sebelumnya:\n",
                          style: ktsBodyLarge.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey[500])),
                      TextSpan(
                          text: "100.0 %",
                          style: ktsBodyLarge.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[800]))
                    ])),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1.5,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Pencapaian periode sekarang:\n",
                          style: ktsBodyLarge.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey[500])),
                      TextSpan(
                          text: "80.0 %",
                          style: ktsBodyLarge.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[800]))
                    ])),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Rata-rata pencapaian harian: ",
                          style: ktsBodyLarge.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey[500])),
                      TextSpan(
                          text: "80.0 %",
                          style: ktsBodyLarge.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[800]))
                    ])),
                  )),
              DatePicker(
                DateTime.now().subtract(Duration(days: 10)),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.teal,
                selectedTextColor: Colors.white,
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
              ),
              // Padding(
              // padding: const EdgeInsets.all(16.0),
              // child: Text(
              // 'Selected date: _selectedDate.toString().split(' ')[0]}'),
              // ),
            ],
          )
        ],
      ),
    );
  }

  @override
  YaumiViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      YaumiViewModel();
}
